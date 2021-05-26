import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/bottom_sheet.dart';
import 'package:dio_hub/common/loading_indicator.dart';
import 'package:dio_hub/common/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/common/search_scroll_wrapper.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/providers/repository/issue_templates_provider.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IssuesList extends StatelessWidget {
  final ScrollController scrollController;
  const IssuesList({required this.scrollController, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _repo = Provider.of<RepositoryProvider>(context);
    final _user = Provider.of<CurrentUserProvider>(context).currentUserInfo;
    return Stack(
      children: [
        SearchScrollWrapper(
          SearchData(
              searchFilters: SearchFilters.issuesPulls(
                  blacklist: [SearchQueryStrings.type]),
              defaultHiddenFilters: [
                SearchQueries().type.toQueryString('issue'),
                SearchQueries()
                    .repo
                    .toQueryString(_repo.repositoryModel!.fullName!),
              ]),
          quickFilters: _user != null
              ? {
                  SearchQueries().assignee.toQueryString(_user.login!):
                      'Assigned to you',
                  SearchQueries().author.toQueryString(_user.login!):
                      'Your issues',
                  SearchQueries().mentions.toQueryString(_user.login!):
                      'Mentions you',
                }
              : null,
          quickOptions: {
            SearchQueries().iS.toQueryString('open'): 'Open issues only',
          },
          scrollController: scrollController,
          searchBarMessage:
              'Search in ${_repo.repositoryModel!.name}\'s issues',
          searchHeroTag: 'repoIssueSearch',
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          filterFn: (data) {
            List<IssueModel> filteredData = [];
            for (var item in data) {
              if (item.pullRequest == null) filteredData.add(item);
            }
            return filteredData;
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ProviderLoadingProgressWrapper<IssueTemplateProvider>(
              loadingBuilder: (context) => const FloatingActionButton(
                onPressed: null,
                child: LoadingIndicator(),
              ),
              childBuilder: (context, value) => FloatingActionButton(
                onPressed: () {
                  if (value.templates.isNotEmpty) {
                    showScrollableBottomActionsMenu(context,
                        child: (buildContext, scrollController) =>
                            ListenableProvider.value(
                              value: Provider.of<RepositoryProvider>(context,
                                  listen: false),
                              child: ListView.separated(
                                  controller: scrollController,
                                  itemBuilder: (context, index) =>
                                      IssueTemplateCard(value.templates[index]),
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                  itemCount: value.templates.length),
                            ),
                        titleText: 'New Issue');
                  } else {
                    final repo =
                        context.read<RepositoryProvider>().repositoryModel;
                    AutoRouter.of(context).push(NewIssueScreenRoute(
                        owner: repo!.owner!.login!, repo: repo.name!));
                  }
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class IssueTemplateCard extends StatelessWidget {
  final IssueTemplates$Query$Repository$IssueTemplates template;
  const IssueTemplateCard(this.template, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: AppColor.onBackground,
        shape: RoundedRectangleBorder(
            borderRadius: AppThemeBorderRadius.medBorderRadius),
        child: InkWell(
          onTap: () {
            final repo = context.read<RepositoryProvider>().repositoryModel;
            AutoRouter.of(context).push(NewIssueScreenRoute(
                owner: repo!.owner!.login!,
                repo: repo.name!,
                template: template));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  template.name,
                  style: AppThemeTextStyles.eventCardChildTitle,
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
