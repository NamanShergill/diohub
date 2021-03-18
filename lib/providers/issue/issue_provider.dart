import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/services/issues/issues_service.dart';
import 'package:onehub/services/repositories/repo_services.dart';

class IssueProvider extends BaseProvider {
  final String? _issueURL;
  IssueModel? _issueModel;
  bool? _editingEnabled;
  bool? get editingEnabled => _editingEnabled;

  IssueModel? get issueModel => _issueModel;

  IssueProvider(String? issueURL, String? userLogin, String? repoURL)
      : _issueURL = issueURL {
    getIssue(repoURL: repoURL, userLogin: userLogin);
  }

  Future getIssue({String? repoURL, String? userLogin}) async {
    statusController.add(Status.loading);
    List<Future> futures = [IssuesService.getIssueInfo(fullUrl: _issueURL!)];
    if (repoURL != null && userLogin != null)
      futures.add(RepositoryServices.checkUserRepoPerms(userLogin, repoURL));
    List<dynamic> data = await Future.wait(futures);
    _issueModel = data[0];
    if (repoURL != null && userLogin != null) _editingEnabled = data[1];
    statusController.add(Status.loaded);
  }

  void updateLabels(List<Label> labels) {
    _issueModel!.labels = labels;
    notifyListeners();
  }

  void updateAssignees(List<UserInfoModel>? users) {
    _issueModel!.assignees = users;
    notifyListeners();
  }

  void updateIssue(IssueModel issue) {
    _issueModel = issue;
    notifyListeners();
  }
}
