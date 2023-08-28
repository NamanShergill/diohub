import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/pull_requests/pull_request_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';

class PullProvider extends BaseDataProvider<PullInfoMixin> {
  PullProvider(this.pullInfo);
  final PullInfoMixin pullInfo;

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
  Future<PullInfoMixin> setInitData(
          {final bool isInitialisation = false,}) async =>
      pullInfo;
}
