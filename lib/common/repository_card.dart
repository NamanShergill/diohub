import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/language_indicator.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/common/shimmer_widget.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class RepositoryCard extends StatelessWidget {
  final RepositoryModel? repo;
  final bool isThemed;
  final String? branch;
  final EdgeInsets padding;
  const RepositoryCard(this.repo,
      {this.isThemed = true,
      this.branch,
      this.padding = const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isThemed ? padding : EdgeInsets.zero,
      child: Material(
        elevation: isThemed ? 2 : 0,
        color: isThemed ? AppColor.background : Colors.transparent,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        child: InkWell(
          borderRadius: AppThemeBorderRadius.medBorderRadius,
          onTap: () {
            AutoRouter.of(context).push(RepositoryScreenRoute(
              repositoryURL: repo!.url,
              branch: branch,
            ));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Visibility(
                        visible: repo!.private!,
                        child: const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Octicons.lock,
                            color: AppColor.grey3,
                            size: 12,
                          ),
                        )),
                    Text(
                      repo!.name!,
                      style: AppThemeTextStyles.eventCardChildTitle,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Visibility(
                        visible: repo!.fork ?? false,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Octicons.repo_forked,
                              size: 12,
                              color: AppColor.grey3,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Forked',
                              style: TextStyle(
                                  fontSize: 12, color: AppColor.grey3),
                            ),
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        repo!.description != null
                            ? repo!.description!.length > 100
                                ? repo!.description!.substring(0, 100) + '...'
                                : repo!.description ?? 'No description.'
                            : 'No description.',
                        style: AppThemeTextStyles.eventCardChildSubtitle,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 24,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    LanguageIndicator(
                      repo!.language,
                      size: 11,
                      textStyle: AppThemeTextStyles.eventCardChildFooter,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Octicons.star,
                          size: 12,
                          color: AppColor.grey3,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          repo!.stargazersCount.toString(),
                          style: AppThemeTextStyles.eventCardChildFooter,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Updated ${getDate(repo!.updatedAt.toString(), shorten: false)}',
                      style: AppThemeTextStyles.eventCardChildFooter,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RepoCardLoading extends StatelessWidget {
  final String? repoURL;
  final String? repoName;
  final EdgeInsets padding;
  final double elevation;
  final String? branch;
  const RepoCardLoading(this.repoURL, this.repoName,
      {this.elevation = 2,
      this.branch,
      this.padding = const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        elevation: elevation,
        color: AppColor.background,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        child: APIWrapper<RepositoryModel>(
          getCall: RepositoryServices.fetchRepository(repoURL!),
          loadingBuilder: (context) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repoName!.split('/').last,
                    style: AppThemeTextStyles.eventCardChildTitle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ShimmerWidget(
                    borderRadius: AppThemeBorderRadius.smallBorderRadius,
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
                    borderRadius: AppThemeBorderRadius.smallBorderRadius,
                    child: Container(
                      height: 20,
                      width: 200,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
          responseBuilder: (context, RepositoryModel repo) {
            return RepositoryCard(
              repo,
              branch: branch,
              isThemed: false,
            );
          },
        ),
      ),
    );
  }
}
