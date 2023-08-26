import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

extension IssueProviderExtension on BuildContext {
  IssueProvider issueProvider({bool listen = true}) =>
      Provider.of<IssueProvider>(this, listen: listen);
}

class IssueProvider extends BaseDataProvider<IssueInfoMixin> {
  IssueProvider(this.issueInfo);
  final IssueInfoMixin issueInfo;

  late final IssuesService _issueRepo = IssuesService(
    repo: issueInfo.repository.name,
    user: issueInfo.repository.owner.login,
    number: issueInfo.number,
  );

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

  Future<List<AssigneeUserListMixin$Assignees$Edges?>> getAssignees(
          {String? after}) =>
      _issueRepo.getAssignees(after: after);

  @override
  Future<IssueInfoMixin> setInitData({bool isInitialisation = false}) async =>
      issueInfo;
}

// String _repoURLFromIssueURL(String link) {
//   final url = link.split('/');
//   return url.sublist(0, url.length - 2).join('/');
// }
