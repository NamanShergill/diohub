import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';
import 'package:dio_hub/services/projects/projects_service.dart';
import 'package:dio_hub/view/repository/projects/widgets/project_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<RepositoryProvider>(context).data;
    return InfiniteScrollWrapper<
        GetRepoProjects$Query$Repository$Projects$Edges?>(
      future: (pageNumber, pageSize, refresh, lastItem) =>
          ProjectService.getRepoProjects(
              name: repo.name!,
              refresh: refresh,
              owner: repo.owner!.login!,
              orderByField: ProjectOrderField.updatedAt,
              orderByDir: OrderDirection.desc),
      builder: (context, item, index, refresh) =>
          ProjectListTile(item!.node as ProjectMixin),
      topSpacing: 8,
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      scrollController: scrollController,
    );
  }
}
