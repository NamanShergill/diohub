import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/services/pulls/pulls_service.dart';
import 'package:onehub/services/repositories/repo_services.dart';

class PullProvider extends BaseProvider {
  final String? _pullURL;
  PullRequestModel? _pullModel;
  bool? _editingEnabled;
  String? _repoURL;
  String? get repoURL => _repoURL;
  bool? get editingEnabled => _editingEnabled;

  PullRequestModel? get pullModel => _pullModel;

  PullProvider(String? pullURL, String? userLogin) : _pullURL = pullURL {
    getPull(userLogin: userLogin);
  }

  Future getPull({String? userLogin}) async {
    statusController.add(Status.loading);
    List<String> urlChunks = _pullURL!.split('/');
    _repoURL = urlChunks.sublist(0, urlChunks.length - 2).join('/');
    List<Future> futures = [PullsService.getPullInformation(fullUrl: _pullURL!)];
    if (repoURL != null && userLogin != null)
      futures.add(RepositoryServices.checkUserRepoPerms(userLogin, repoURL));
    List<dynamic> data = await Future.wait(futures);
    _pullModel = data[0];
    if (repoURL != null && userLogin != null) _editingEnabled = data[1];
    statusController.add(Status.loaded);
  }

  void updateLabels(List<Label> labels) {
    _pullModel!.labels = labels;
    notifyListeners();
  }

  void updateAssignees(List<UserInfoModel> users) {
    _pullModel!.assignees = users;
    notifyListeners();
  }

  void updateIssue(PullRequestModel pull) {
    _pullModel = pull;
    notifyListeners();
  }
}