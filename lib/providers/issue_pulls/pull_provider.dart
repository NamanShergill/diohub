import 'package:diohub/graphql/queries/issues_pulls/__generated__/issue_pull_info.query.data.gql.dart';
import 'package:diohub/models/issues/issue_model.dart';
import 'package:diohub/models/pull_requests/pull_request_model.dart';
import 'package:diohub/models/users/user_info_model.dart';
import 'package:diohub/providers/base_provider.dart';

class PullProvider extends BaseDataProvider<GpullInfo> {
  PullProvider(this.pullInfo);
  final GpullInfo pullInfo;

  void updateLabels(final List<Label> labels) {
    // data.labels = labels;
    notifyListeners();
  }

  void updateAssignees(final List<UserInfoModel> users) {
    // data.assignees = users;
    notifyListeners();
  }

  void updateIssue(final PullRequestModel pull) {
    // data = pull;
    notifyListeners();
  }

  @override
  Future<GpullInfo> setInitData({
    final bool isInitialisation = false,
  }) async =>
      pullInfo;
}
