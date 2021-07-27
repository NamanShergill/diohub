import 'package:dio_hub/models/commits/commit_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';

class CommitProvider extends BaseDataProvider<CommitModel> {
  CommitProvider(this.commitURL);
  final String commitURL;

  @override
  Future<CommitModel> setInitData() {
    return RepositoryServices.getCommit(commitURL);
  }
}
