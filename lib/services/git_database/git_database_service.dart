import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/repositories/blob_model.dart';
import 'package:onehub/models/repositories/code_tree_model.dart';

class GitDatabaseService {
  // Ref: https://docs.github.com/en/rest/reference/git#get-a-tree
  static Future<CodeTreeModel> getTree({String repoURL, String sha}) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get('$repoURL/git/trees/$sha', options: CacheManager.defaultCache());
    return CodeTreeModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/git#get-a-blob
  static Future<BlobModel> getBlob({String repoURL, String sha}) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get('$repoURL/git/blobs/$sha', options: CacheManager.defaultCache());
    return BlobModel.fromJson(response.data);
  }

  static Future<String> getRawFile(String url) async {
    Response response = await GetDio.getDio(applyBaseURL: false).get(url);
    return response.data;
  }
}
