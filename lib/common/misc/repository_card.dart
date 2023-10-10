import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/misc/language_indicator.dart';
import 'package:dio_hub/common/misc/repo_star.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/common/misc/tappable_card.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class RepositoryCard extends StatefulWidget {
  const RepositoryCard(
    this.repo, {
    // this.isThemed = true,
    this.branch,
    // this.padding = const EdgeInsets.symmetric(vertical: 8),
    super.key,
    this.cardLinkType = CardLinkType.none,
  });
  final RepositoryModel? repo;
  // final bool isThemed;
  final String? branch;
  // final EdgeInsets padding;
  final CardLinkType cardLinkType;
  @override
  RepositoryCardState createState() => RepositoryCardState();
}

class RepositoryCardState extends State<RepositoryCard> {
  @override
  Widget build(final BuildContext context) => BasicCard.linked(
        cardLinkType: widget.cardLinkType,

        // elevation: widget.isThemed ? 2 : 0,
        // color: widget.isThemed
        //     ? Provider.of<PaletteSettings>(context).currentSetting.primary
        //     : Colors.transparent,
        // borderRadius: medBorderRadius,
        child: InkWell(
          // borderRadius: medBorderRadius,
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
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                                    size: context
                                        .textTheme.bodyLarge!.contextIconSize,
                                  ),
                                ),
                              ),
                              Text(
                                widget.repo!.name!,
                                style: context.textTheme.bodyLarge,
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
                                      color: context.colorScheme.onSurface
                                          .asHint(),
                                      // color: Provider.of<PaletteSettings>(
                                      //   context,
                                      // ).currentSetting.faded3,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Forked',
                                      style:
                                          context.textTheme.bodyLarge?.asHint(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (widget.repo?.description != null)
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              widget.repo!.description!.length > 100
                                  ? '${widget.repo!.description!.substring(0, 100)}...'
                                  : widget.repo!.description!,
                              style: context.textTheme.bodyMedium?.asHint(),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        LanguageIndicator(
                          widget.repo!.language,
                          // size: 11,
                          // textStyle: AppThemeTextStyles.eventCardChildFooter(
                          //   context,
                          // ),
                        ),
                        if ((widget.repo?.stargazersCount ?? 0) > 0)
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Octicons.star_fill,
                                  size: 12,
                                  color: context.colorScheme.onSurface.asHint(),
                                  // color: Provider.of<PaletteSettings>(context)
                                  //     .currentSetting
                                  //     .faded3,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  widget.repo!.stargazersCount.toString(),
                                  style: context.textTheme.bodySmall?.asHint(),
                                  // style: AppThemeTextStyles.eventCardChildFooter(
                                  //   context,
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.update_rounded,
                          size: 12,
                          color: context.colorScheme.onSurface.asHint(),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${getDate(widget.repo!.updatedAt.toString(), shorten: true)}',
                          style: context.textTheme.bodySmall?.asHint(),
                          // style: AppThemeTextStyles.eventCardChildFooter(
                          //   context,
                          // ),
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

                    // onStarsChange: (final int value) {
                    //   setState(() {
                    //     widget.repo!.stargazersCount = value;
                    //   });
                    // },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class RepoCardLoading extends StatelessWidget {
  const RepoCardLoading(
    this.repoURL,
    this.repoName, {
    this.cardLinkType = CardLinkType.none, // this.elevation = 2,
    this.branch,
    this.refresh = false,
    this.padding = EdgeInsets.zero,
    super.key,
  });
  final String? repoURL;
  final String? repoName;
  final EdgeInsets padding;
  // final double elevation;
  final bool refresh;
  final String? branch;
  final CardLinkType cardLinkType;
  @override
  Widget build(final BuildContext context) => Padding(
        padding: padding,
        child: APIWrapper<RepositoryModel>(
          fadeIntoView: false,
          apiCall: ({required final bool refresh}) async =>
              RepositoryServices.fetchRepository(repoURL!, refresh: refresh),
          loadingBuilder: (final BuildContext context) => BasicCard.linked(
            cardLinkType: cardLinkType,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    repoName!.split('/').last,
                    // style: AppThemeTextStyles.eventCardChildTitle(context),
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
          ),
          responseBuilder:
              (final BuildContext context, final RepositoryModel repo) =>
                  RepositoryCard(
            repo,
            cardLinkType: cardLinkType,
            branch: branch,
            // isThemed: false,
          ),
        ),
      );
}
