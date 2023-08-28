import 'dart:async';

import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RepositoryProvider extends BaseDataProvider<RepositoryModel> {
  RepositoryProvider(this.url);
  String url;

  @override
  Future<RepositoryModel> setInitData({final bool isInitialisation = false}) =>
      RepositoryServices.fetchRepository(url);
}

extension RepoProvider on BuildContext {
  RepositoryProvider repoProvider({final bool listen = true}) =>
      Provider.of<RepositoryProvider>(this, listen: listen);
}
