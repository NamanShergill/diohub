import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/slide_expanded_widget.dart';
import 'package:dio_hub/common/issues/issue_list_card.dart';
import 'package:dio_hub/common/misc/bottom_sheet.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/common/wrappers/search_scroll_wrapper.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/providers/repository/issue_templates_provider.dart';
import 'package:dio_hub/providers/repository/pinned_issues_provider.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:dio_hub/utils/http_to_api.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class IssuesList extends StatelessWidget {
  const IssuesList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<RepositoryProvider>(context);
    final user = Provider.of<CurrentUserProvider>(context).data;
    return Stack(
      children: [
        SearchScrollWrapper(
          SearchData(
              searchFilters: SearchFilters.issuesPulls(
                  blacklist: [SearchQueryStrings.type]),
              defaultHiddenFilters: [
                SearchQueries().type.toQueryString('issue'),
                SearchQueries().repo.toQueryString(repo.data.fullName!),
              ]),
          quickFilters: {
            SearchQueries().assignee.toQueryString(user.login!):
                'Assigned to you',
            SearchQueries().author.toQueryString(user.login!): 'Your issues',
            SearchQueries().mentions.toQueryString(user.login!): 'Mentions you',
          },
          quickOptions: {
            SearchQueries().iS.toQueryString('open'): 'Open issues only',
          },
          showRepoNameOnIssues: false,
          searchBarMessage: 'Search in ${repo.data.name}\'s issues',
          searchHeroTag: 'repoIssueSearch',
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          filterFn: (data) {
            final filteredData = <IssueModel>[];
            for (final item in data) {
              if (item.pullRequest == null) {
                filteredData.add(item);
              }
            }
            return filteredData;
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ProviderLoadingProgressWrapper<PinnedIssuesProvider>(
                loadingBuilder: (context) => Container(),
                childBuilder: (context, value) {
                  if (value.data.totalCount > 0) {
                    return SlideExpandedSection(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: FloatingActionButton.extended(
                              onPressed: () {
                                showScrollableBottomActionsMenu(context,
                                    builder: (buildContext, scrollController,
                                            setState) =>
                                        ListView.separated(
                                            controller: scrollController,
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            itemBuilder: (context, index) {
                                              return IssueLoadingCard(
                                                toRepoAPIResource(value.data
                                                    .nodes![index]!.issue.url
                                                    .toString()),
                                                backgroundColor:
                                                    secondary(context),
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                                    const Divider(),
                                            itemCount:
                                                value.data.nodes!.length),
                                    titleText: 'Pinned Issues');
                              },
                              label: Text('${value.data.totalCount} Pinned'),
                              icon: const Icon(LineIcons.thumbtack),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProviderLoadingProgressWrapper<IssueTemplateProvider>(
                  loadingBuilder: (context) => const FloatingActionButton(
                    onPressed: null,
                    child: LoadingIndicator(),
                  ),
                  childBuilder: (context, value) => FloatingActionButton(
                    onPressed: () {
                      if (value.data.isNotEmpty) {
                        showScrollableBottomActionsMenu(context,
                            builder: (buildContext, scrollController,
                                    setState) =>
                                ListenableProvider.value(
                                  value: Provider.of<RepositoryProvider>(
                                      context,
                                      listen: false),
                                  child: ListView.separated(
                                      controller: scrollController,
                                      padding: const EdgeInsets.only(bottom: 8),
                                      itemBuilder: (context, index) {
                                        if (value.data.length == index) {
                                          return const BlankIssueTemplate();
                                        } else {
                                          return IssueTemplateCard(
                                              value.data[index]);
                                        }
                                      },
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                      itemCount: value.data.length + 1),
                                ),
                            titleText: 'New Issue');
                      } else {
                        final repo = context.read<RepositoryProvider>().data;
                        AutoRouter.of(context).push(NewIssueScreenRoute(
                            owner: repo.owner!.login!, repo: repo.name!));
                      }
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IssueTemplateCard extends StatelessWidget {
  const IssueTemplateCard(this.template, {Key? key, this.isBlank = false})
      : super(key: key);
  final bool isBlank;
  final IssueTemplates$Query$Repository$IssueTemplates template;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
        shape: RoundedRectangleBorder(borderRadius: medBorderRadius),
        child: InkWell(
          onTap: () {
            final repo = context.read<RepositoryProvider>().data;
            AutoRouter.of(context).push(NewIssueScreenRoute(
                owner: repo.owner!.login!,
                repo: repo.name!,
                template: isBlank ? null : template));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  template.name,
                  style: AppThemeTextStyles.eventCardChildTitle(context),
                ),
                if (template.about != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(template.about!),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BlankIssueTemplate extends StatelessWidget {
  const BlankIssueTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IssueTemplateCard(
      IssueTemplates$Query$Repository$IssueTemplates()
        ..name = 'Don’t see your issue here?'
        ..about = 'Open a blank issue.',
      isBlank: true,
    );
  }
}
