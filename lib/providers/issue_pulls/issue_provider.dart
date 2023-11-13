import 'package:diohub/common/misc/info_card.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/issue_pull_info.data.gql.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/timeline.data.gql.dart';
import 'package:diohub/models/issues/issue_model.dart';
import 'package:diohub/models/users/user_info_model.dart';
import 'package:diohub/providers/base_provider.dart';
import 'package:diohub/services/issues/issues_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

extension IssueProviderExtension on BuildContext {
  IssueProvider issueProvider({final bool listen = true}) =>
      Provider.of<IssueProvider>(this, listen: listen);
}

class IssueProvider extends BaseDataProvider<GissueInfo> {
  IssueProvider(this.issueInfo);
  final GissueInfo issueInfo;

  late final IssuesService _issueRepo = IssuesService(
    repo: issueInfo.repository.name,
    user: issueInfo.repository.owner.login,
    number: issueInfo.number,
  );

  void updateLabels(final List<Label> labels) {
    // data.labels = labels;
    notifyListeners();
  }

  void updateAssignees(final List<UserInfoModel>? users) {
    // data.assignees = users;
    notifyListeners();
  }

  void updateIssue(final IssueModel issue) {
    // data = issue;
    notifyListeners();
  }

  Future<List<NodeWithPaginationInfo<Gactor>?>> getAssignees({
    required final String? after,
  }) =>
      _issueRepo.getAssignees(after: after);

  Future<List<NodeWithPaginationInfo<Gactor>>> getParticipants({
    required final String? after,
  }) =>
      _issueRepo.getParticipants(after: after);

  @override
  Future<GissueInfo> setInitData({
    final bool isInitialisation = false,
  }) async =>
      issueInfo;
}

// String _repoURLFromIssueURL(String link) {
//   final url = link.split('/');
//   return url.sublist(0, url.length - 2).join('/');
// }
