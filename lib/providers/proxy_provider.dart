import 'package:dio_hub/providers/base_provider.dart';

abstract class ProxyProvider<T extends BaseProvider> extends BaseProvider {
  T? _parentProvider;
  T? get parentProvider => _parentProvider;

  ProxyProvider([Status status = Status.initialized]) : super(status);

  /// Update the provider with new data.
  void updateProvider(T parentProvider) async {
    // Only initialise streams if the provider is not equal,
    // ignore the call otherwise.
    if (_parentProvider != parentProvider) {
      _parentProvider = parentProvider;
      // In case the provider loads lazily and the event of load is
      // already dispatched before it started listening to the stream.
      if (_parentProvider!.status == Status.loaded) {
        fetchData();
      }
      _parentProvider!.statusStream.listen(
        (event) async {
          // This event happens whenever the parent provider is reloaded, so this provider
          // is reset and new data is fetched.
          if (event == Status.loaded) {
            reset();
            fetchData();
          }
        },
      );
      customStreams();
    }
  }

  customStreams() {}

  fetchData();
}
