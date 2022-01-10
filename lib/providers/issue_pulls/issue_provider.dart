import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';

class IssueProvider extends BaseDataProvider<IssueInfoMixin> {
  IssueProvider(this.issueInfo);
  final IssueInfoMixin issueInfo;

  void updateLabels(List<Label> labels) {
    // data.labels = labels;
    notifyListeners();
  }

  void updateAssignees(List<UserInfoModel>? users) {
    // data.assignees = users;
    notifyListeners();
  }

  void updateIssue(IssueModel issue) {
    // data = issue;
    notifyListeners();
  }

  @override
  Future<IssueInfoMixin> setInitData({bool isInitialisation = false}) async {
    return issueInfo;
  }
}

String _repoURLFromIssueURL(String link) {
  final url = link.split('/');
  return url.sublist(0, url.length - 2).join('/');
}
