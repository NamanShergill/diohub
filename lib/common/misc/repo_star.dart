import 'package:dio_hub/app/Dio/response_handler.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/graphql/graphql.graphql.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

typedef StarBuilder = Widget Function(
    BuildContext context, HasStarred$Query$Repository? starrredData);

class RepoStar extends StatefulWidget {
  final String owner;
  final String repoName;
  final BorderRadius? inkWellRadius;
  final bool fadeIntoView;
  final StarBuilder? child;
  final ValueChanged<int>? onStarsChange;
  const RepoStar(this.owner, this.repoName,
      {Key? key,
      this.child,
      this.onStarsChange,
      this.inkWellRadius,
      this.fadeIntoView = true})
      : super(key: key);

  @override
  _RepoStarState createState() => _RepoStarState();
}

class _RepoStarState extends State<RepoStar> {
  final APIWrapperController<HasStarred$Query$Repository> controller =
      APIWrapperController();
  bool changing = false;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<PaletteSettings>(context).currentSetting;
    VoidCallback? onPress(HasStarred$Query$Repository? data) =>
        data == null || changing
            ? null
            : () async {
                setState(() {
                  changing = true;
                  data.viewerHasStarred
                      ? data.stargazerCount = data.stargazerCount - 1
                      : data.stargazerCount = data.stargazerCount + 1;
                });
                if (!data.viewerHasStarred) {
                  ResponseHandler.setSuccessMessage(AppPopupData(
                      title: 'Starred ${widget.repoName}',
                      icon: Octicons.star));
                }
                if (widget.onStarsChange != null) {
                  widget.onStarsChange!(data.stargazerCount);
                }
                bool isStarred = data.viewerHasStarred;
                controller.changeData(
                    data..viewerHasStarred = !data.viewerHasStarred);
                await RepositoryServices.changeStar(
                        widget.owner, widget.repoName, isStarred)
                    .then((value) {
                  controller.changeData(data..viewerHasStarred = value);
                });

                setState(() {
                  changing = false;
                });
              };
    Widget iconButton(HasStarred$Query$Repository? data) {
      return IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: onPress(data),
          icon: Icon(
            Octicons.star,
            size: 18,
            color: data != null && data.viewerHasStarred
                ? Colors.amber
                : theme.faded3,
          ));
    }

    return APIWrapper<HasStarred$Query$Repository>(
      apiCall: RepositoryServices.isStarred(widget.owner, widget.repoName),
      apiWrapperController: controller,
      loadingBuilder: (context) => widget.child != null
          ? widget.child!(context, null)
          : ShimmerWidget(
              child: iconButton(null),
            ),
      fadeIntoView: widget.fadeIntoView,
      responseBuilder: (context, data) => widget.child != null
          ? InkWell(
              onTap: onPress(data),
              child: widget.child!(context, data),
              borderRadius: widget.inkWellRadius,
            )
          : iconButton(data),
    );
  }
}
