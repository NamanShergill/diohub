// class ProjectService {
//   static final GraphqlHandler _gqlHandler = GraphqlHandler();
//
//   static Future<List<GetRepoProjects$Query$Repository$Projects$Edges?>>
//       getRepoProjects(
//           {required String name,
//           required String owner,
//           required ProjectOrderField orderByField,
//           required bool refresh,
//           List<ProjectState>? states,
//           String? query,
//           String? cursor,
//           required OrderDirection orderByDir}) async {
//     final res = await gqlRequest(
//         GetRepoProjectsQuery(
//             variables: GetRepoProjectsArguments(
//                 name: name,
//                 owner: owner,
//                 orderByField: orderByField,
//                 orderByDir: orderByDir,
//                 states: states,
//                 cursor: cursor,
//                 query: query)),
//         cacheOptions: CacheManager.defaultGQLCache(refresh: refresh));
//     return GetRepoProjects$Query.fromJson(res.data!)
//         .repository!
//         .projects
//         .edges!;
//   }
// }
