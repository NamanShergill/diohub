import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/pull_requests/pull_request_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/services/pulls/pulls_service.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';

class PullProvider extends BaseProvider {
  PullProvider(String? pullURL, String? userLogin) : _pullURL = pullURL {
    getPull(userLogin: userLogin);
  }
  final String? _pullURL;
  PullRequestModel? _pullModel;
  bool _editingEnabled = false;
  String? _repoURL;
  String? get repoURL => _repoURL;
  bool get editingEnabled => _editingEnabled;

  PullRequestModel? get pullModel => _pullModel;

  Future getPull({String? userLogin}) async {
    loading();
    final urlChunks = _pullURL!.split('/');
    _repoURL = urlChunks.sublist(0, urlChunks.length - 2).join('/');
    final futures = <Future>[
      PullsService.getPullInformation(fullUrl: _pullURL!)
    ];
    if (repoURL != null && userLogin != null) {
      futures.add(RepositoryServices.checkUserRepoPerms(userLogin, repoURL));
    }
    final data = await Future.wait(futures);
    _pullModel = data[0];
    if (repoURL != null && userLogin != null) {
      _editingEnabled = data[1];
    }
    loaded();
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
