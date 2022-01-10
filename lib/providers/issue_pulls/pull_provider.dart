import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/pull_requests/pull_request_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';

class PullProvider extends BaseDataProvider<PullInfoMixin> {
  PullProvider(this.pullInfo);
  final PullInfoMixin pullInfo;

  void updateLabels(List<Label> labels) {
    // data.labels = labels;
    notifyListeners();
  }

  void updateAssignees(List<UserInfoModel> users) {
    // data.assignees = users;
    notifyListeners();
  }

  void updateIssue(PullRequestModel pull) {
    // data = pull;
    notifyListeners();
  }

  @override
  Future<PullInfoMixin> setInitData({bool isInitialisation = false}) async {
    return pullInfo;
  }
}
