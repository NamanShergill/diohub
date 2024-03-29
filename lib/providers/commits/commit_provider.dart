import 'package:diohub/models/commits/commit_model.dart';
import 'package:diohub/providers/base_provider.dart';
import 'package:diohub/services/repositories/repo_services.dart';

class CommitProvider extends BaseDataProvider<CommitModel> {
  CommitProvider(this.commitURL);
  final String commitURL;

  @override
  Future<CommitModel> setInitData({final bool isInitialisation = false}) =>
      RepositoryServices.getCommit(commitURL);
}
