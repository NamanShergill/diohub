import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';

class IssueProvider extends BaseDataProvider<IssueModel> {
  IssueProvider(this.issueURL, this.userLogin);
  final String issueURL;
  final String userLogin;
  bool _editingEnabled = false;
  bool get editingEnabled => _editingEnabled;

  void updateLabels(List<Label> labels) {
    data.labels = labels;
    notifyListeners();
  }

  void updateAssignees(List<UserInfoModel>? users) {
    data.assignees = users;
    notifyListeners();
  }

  void updateIssue(IssueModel issue) {
    data = issue;
    notifyListeners();
  }

  @override
  Future<IssueModel> setInitData() async {
    final futures = <Future>[
      IssuesService.getIssueInfo(fullUrl: issueURL),
      RepositoryServices.checkUserRepoPerms(
          userLogin, _repoURLFromIssueURL(issueURL))
    ];

    final data = await Future.wait(futures);
    final IssueModel _issueModel = data[0];
    if (_issueModel.pullRequest != null) {
      AutoRouter.of(currentContext)
          .replace(PullScreenRoute(pullURL: _issueModel.pullRequest!.url!));
    }
    _editingEnabled = data[1];

    return _issueModel;
  }
}

String _repoURLFromIssueURL(String link) {
  final url = link.split('/');
  return url.sublist(0, url.length - 2).join('/');
}
