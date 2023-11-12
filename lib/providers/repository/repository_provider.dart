import 'dart:async';

import 'package:diohub/models/repositories/repository_model.dart';
import 'package:diohub/providers/base_provider.dart';
import 'package:diohub/services/repositories/repo_services.dart';
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
