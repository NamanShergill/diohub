import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/language_indicator.dart';
import 'package:dio_hub/common/misc/repo_star.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class RepositoryCard extends StatefulWidget {
  const RepositoryCard(
    this.repo, {
    this.isThemed = true,
    this.branch,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    super.key,
  });
  final RepositoryModel? repo;
  final bool isThemed;
  final String? branch;
  final EdgeInsets padding;

  @override
  RepositoryCardState createState() => RepositoryCardState();
}

class RepositoryCardState extends State<RepositoryCard> {
  @override
  Widget build(final BuildContext context) => Padding(
        padding: widget.isThemed ? widget.padding : EdgeInsets.zero,
        child: Material(
          elevation: widget.isThemed ? 2 : 0,
          color: widget.isThemed
              ? Provider.of<PaletteSettings>(context).currentSetting.primary
              : Colors.transparent,
          borderRadius: medBorderRadius,
          child: InkWell(
            borderRadius: medBorderRadius,
            onTap: () async {
              await AutoRouter.of(context).push(
                RepositoryRoute(
                  repositoryURL: widget.repo!.url!,
                  branch: widget.branch,
                ),
              );
            },
            child: Stack(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: <Widget>[
                                Visibility(
                                  visible: widget.repo!.private!,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Octicons.lock,
                                      color:
                                          Provider.of<PaletteSettings>(context)
                                              .currentSetting
                                              .faded3,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                Text(
                                  widget.repo!.name!,
                                  style: AppThemeTextStyles.eventCardChildTitle(
                                    context,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Visibility(
                                  visible: widget.repo!.fork ?? false,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        Octicons.repo_forked,
                                        size: 12,
                                        color: Provider.of<PaletteSettings>(
                                          context,
                                        ).currentSetting.faded3,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'Forked',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Provider.of<PaletteSettings>(
                                            context,
                                          ).currentSetting.faded3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              widget.repo!.description != null
                                  ? widget.repo!.description!.length > 100
                                      ? '${widget.repo!.description!.substring(0, 100)}...'
                                      : widget.repo!.description ??
                                          'No description.'
                                  : 'No description.',
                              style: AppThemeTextStyles.eventCardChildSubtitle(
                                context,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 24,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          LanguageIndicator(
                            widget.repo!.language,
                            size: 11,
                            textStyle: AppThemeTextStyles.eventCardChildFooter(
                              context,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Octicons.star_fill,
                                size: 12,
                                color: Provider.of<PaletteSettings>(context)
                                    .currentSetting
                                    .faded3,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                widget.repo!.stargazersCount.toString(),
                                style: AppThemeTextStyles.eventCardChildFooter(
                                  context,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Updated ${getDate(widget.repo!.updatedAt.toString(), shorten: false)}',
                            style: AppThemeTextStyles.eventCardChildFooter(
                              context,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: RepoStar(
                      widget.repo!.owner!.login!,
                      widget.repo!.name!,
                      onStarsChange: (final int value) {
                        setState(() {
                          widget.repo!.stargazersCount = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class RepoCardLoading extends StatelessWidget {
  const RepoCardLoading(
    this.repoURL,
    this.repoName, {
    this.elevation = 2,
    this.branch,
    this.refresh = false,
    this.padding = EdgeInsets.zero,
    super.key,
  });
  final String? repoURL;
  final String? repoName;
  final EdgeInsets padding;
  final double elevation;
  final bool refresh;
  final String? branch;
  @override
  Widget build(final BuildContext context) => Padding(
        padding: padding,
        child: Material(
          elevation: elevation,
          color: Provider.of<PaletteSettings>(context).currentSetting.primary,
          borderRadius: medBorderRadius,
          child: APIWrapper<RepositoryModel>(
            apiCall: ({required final bool refresh}) async =>
                RepositoryServices.fetchRepository(repoURL!, refresh: refresh),
            loadingBuilder: (final BuildContext context) => Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    repoName!.split('/').last,
                    style: AppThemeTextStyles.eventCardChildTitle(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ShimmerWidget(
                    borderRadius: smallBorderRadius,
                    child: Container(
                      height: 20,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  ShimmerWidget(
                    borderRadius: smallBorderRadius,
                    child: Container(
                      height: 20,
                      width: 200,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            responseBuilder:
                (final BuildContext context, final RepositoryModel repo) =>
                    RepositoryCard(
              repo,
              branch: branch,
              isThemed: false,
            ),
          ),
        ),
      );
}
