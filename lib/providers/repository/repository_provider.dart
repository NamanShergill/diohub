import 'package:onehub/common/base_popup_notification.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/services/repositories/repo_services.dart';

class RepositoryProvider extends BaseProvider {
  RepositoryModel _repository;
  String _url;

  RepositoryModel get repositoryModel => _repository;

  RepositoryProvider(String url) : _url = url {
    if (_url != null) {
      _getRepository(_url);
    }
    statusStream.listen((event) {
      // Show a popup to retry if there was an error fetching the user details.
      if (event == Status.error) {
        showPopup(BasePopupNotification(
          title: 'Could not fetch repository details. Tap to retry.',
          dismissOnTap: false,
          notificationController: notificationController,

          // Try getting the user details again on tap.
          onTap: (context) async {
            _getRepository(_url);
          },
        ));
        // Remove the popup if a status other than loading is set.
      } else if (event != Status.loading) {
        showPopup(null);
      }
    });
  }

  /// Get Repository information from the API.
  void _getRepository(String url) async {
    _url = url;
    statusController.add(Status.loading);
    try {
      print(_url);
      _repository = await RepositoryServices.fetchRepository(url);
      statusController.add(Status.loaded);
    } catch (e) {
      error = e.toString() ?? 'Something went wrong.';
      statusController.add(Status.error);
    }
  }
}
