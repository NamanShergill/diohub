// class ProjectsList extends StatelessWidget {
//   const ProjectsList({Key? key, required this.scrollController})
//       : super(key: key);
//   final ScrollController scrollController;
//   @override
//   Widget build(BuildContext context) {
//     final repo = Provider.of<RepositoryProvider>(context).data;
//     return InfiniteScrollWrapper<
//         GetRepoProjects$Query$Repository$Projects$Edges?>(
//       future: (pageNumber, pageSize, refresh, lastItem) =>
//           ProjectService.getRepoProjects(
//               name: repo.name!,
//               refresh: refresh,
//               owner: repo.owner!.login!,
//               orderByField: ProjectOrderField.updatedAt,
//               orderByDir: OrderDirection.desc),
//       builder: (context, item, index, refresh) =>
//           ProjectListTile(item!.node as ProjectMixin),
//       topSpacing: 8,
//       separatorBuilder: (context, index) => const SizedBox(
//         height: 8,
//       ),
//       scrollController: scrollController,
//     );
//   }
// }
