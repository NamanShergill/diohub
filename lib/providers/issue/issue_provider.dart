import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/services/issues/issues_service.dart';

class IssueProvider extends BaseProvider {
  final String _issueURL;
  IssueModel _issueModel;

  IssueModel get issueModel => _issueModel;

  IssueProvider(String issueURL) : _issueURL = issueURL {
    getIssue();
  }

  Future getIssue() async {
    statusController.add(Status.loading);
    try {
      _issueModel = await IssuesService.getIssueInfo(fullUrl: _issueURL);
      statusController.add(Status.loaded);
    } catch (e) {
      error = e.toString() ?? 'Something went wrong.';
      statusController.add(Status.error);
    }
  }
}
