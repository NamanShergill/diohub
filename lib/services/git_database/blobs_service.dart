import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/repositories/code_tree_model.dart';

class GitDatabaseService {
  static Future<CodeTreeModel> getTree({String repoURL, String sha}) async {
    Response response = await GetDio.getDio(applyBaseURL: false, debugLog: true)
        .get('$repoURL/git/trees/$sha', options: CacheManager.defaultCache());
    return CodeTreeModel.fromJson(response.data);
  }
}
