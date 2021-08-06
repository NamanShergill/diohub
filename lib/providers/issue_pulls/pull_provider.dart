import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/pull_requests/pull_request_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/services/pulls/pulls_service.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';

class PullProvider extends BaseDataProvider<PullRequestModel> {
  PullProvider(this.pullURL, this.userLogin);
  final String pullURL;
  final String userLogin;
  bool _editingEnabled = false;
  late String _repoURL;
  String get repoURL => _repoURL;
  bool get editingEnabled => _editingEnabled;

  void updateLabels(List<Label> labels) {
    data.labels = labels;
    notifyListeners();
  }

  void updateAssignees(List<UserInfoModel> users) {
    data.assignees = users;
    notifyListeners();
  }

  void updateIssue(PullRequestModel pull) {
    data = pull;
    notifyListeners();
  }

  @override
  Future<PullRequestModel> setInitData({bool isInitialisation = false}) async {
    final urlChunks = pullURL.split('/');
    _repoURL = urlChunks.sublist(0, urlChunks.length - 2).join('/');
    final futures = <Future>[
      PullsService.getPullInformation(fullUrl: pullURL),
      RepositoryServices.checkUserRepoPerms(userLogin, repoURL),
    ];
    final data = await Future.wait(futures);
    final PullRequestModel _pullModel = data[0];
    _editingEnabled = data[1];
    return _pullModel;
  }
}
