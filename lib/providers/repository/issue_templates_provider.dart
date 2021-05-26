// class IssueTemplateProvider extends BaseProvider {
//   List<IssueTemplates$Query$Repository$IssueTemplates> _templates = [];
//   List<IssueTemplates$Query$Repository$IssueTemplates> get templates =>
//       _templates;
//   RepositoryProvider? _repositoryProvider;
//
//   /// Update the provider with new data.
//   void updateProvider(RepositoryProvider repoProvider) async {
//     // Only initialise streams if the provider is not equal,
//     // ignore the call otherwise.
//     if (_repositoryProvider != repoProvider) {
//       _repositoryProvider = repoProvider;
//       // In case the provider loads lazily and the event of load is
//       // already dispatched before it started listening to the stream.
//       if (repoProvider.status == Status.loaded) {
//         _fetchReadme(_branchProvider!.currentSHA);
//       }
//       _repositoryProvider!.statusStream.listen((event) async {
//         // Fetch the root sha in the branch when the branch provider is loaded.
//         // This event happens whenever the branch is changed, so this provider
//         // is reset and new data is fetched.
//         if (event == Status.loaded) {
//           reset();
//           await _fetchReadme(_branchProvider!.currentSHA);
//         }
//       });
//     }
//   }
// }
