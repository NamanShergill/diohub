import 'package:onehub/common/base_popup_notification.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/services/repositories/repo_services.dart';

class RepositoryProvider extends BaseProvider {
  RepositoryModel _repository;
  String _url;

  RepositoryModel get repositoryModel => _repository;

  RepositoryProvider() {
    super.statusStream.listen((event) {
      // Show a popup to retry if there was an error fetching the user details.
      if (event == Status.error) {
        super.showPopup(BasePopupNotification(
          title: 'Could not fetch repository details. Tap to retry.',
          dismissOnTap: false,
          // Try getting the user details again on tap.
          onTap: (context) async {
            await getRepository(_url);
          },
        ));
        // Remove the popup if a status other than loading is set.
      } else if (event != Status.loading) {
        super.showPopup(null);
      }
    });
  }

  /// Get Repository information from the API.
  Future<RepositoryModel> getRepository(String url) async {
    _url = url;
    super.statusController.add(Status.loading);
    try {
      _repository = await RepositoryServices.fetchRepository(url).then((value) {
        if (value != null) {
          super.statusController.add(Status.loaded);
          return value;
        }
        return null;
      });
    } catch (e) {
      error = e.message ?? 'Something went wrong.';
      super.statusController.add(Status.error);
    }
    return _repository;
  }
}
