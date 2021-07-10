import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';

class IssueProvider extends BaseProvider {
  IssueProvider(String? issueURL, String? userLogin) : _issueURL = issueURL {
    getIssue(userLogin: userLogin);
  }
  final String? _issueURL;
  IssueModel? _issueModel;
  bool _editingEnabled = false;
  bool get editingEnabled => _editingEnabled;

  IssueModel? get issueModel => _issueModel;

  Future getIssue({String? userLogin}) async {
    loading();
    final futures = <Future>[IssuesService.getIssueInfo(fullUrl: _issueURL!)];
    if (userLogin != null) {
      futures.add(RepositoryServices.checkUserRepoPerms(
          userLogin, _repoURLFromIssueURL(_issueURL!)));
    }
    final data = await Future.wait(futures);
    _issueModel = data[0];
    if (_issueModel!.pullRequest != null) {
      AutoRouter.of(currentContext)
          .replace(PullScreenRoute(pullURL: _issueModel!.pullRequest!.url));
    }
    if (userLogin != null) {
      _editingEnabled = data[1];
    }
    loaded();
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

String _repoURLFromIssueURL(String link) {
  final url = link.split('/');
  return url.sublist(0, url.length - 2).join('/');
}
