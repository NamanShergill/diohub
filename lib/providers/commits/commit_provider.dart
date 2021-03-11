import 'package:onehub/common/base_popup_notification.dart';
import 'package:onehub/models/commits/commit_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/services/repositories/repo_services.dart';

class CommitProvider extends BaseProvider {
  final String _commitURL;

  CommitModel _commit;

  CommitModel get commit => _commit;

  CommitProvider(String commitURL) : _commitURL = commitURL {
    if (_commitURL != null) {
      _getCommit();
    }
    statusStream.listen((event) {
      // Show a popup to retry if there was an error fetching the user details.
      if (event == Status.error) {
        showPopup(BasePopupNotification(
          title: 'Could not fetch commit details. Tap to retry.',
          dismissOnTap: false,
          notificationController: notificationController,

          // Try getting the user details again on tap.
          onTap: (context) async {
            _getCommit();
          },
        ));
        // Remove the popup if a status other than loading is set.
      } else if (event != Status.loading) {
        showPopup(null);
      }
    });
  }

  void _getCommit() async {
    statusController.add(Status.loading);
    try {
      _commit = await RepositoryServices.getCommit(_commitURL);
      statusController.add(Status.loaded);
    } catch (e) {
      error = e.message ?? 'Something went wrong.';
      statusController.add(Status.error);
    }
  }
}
