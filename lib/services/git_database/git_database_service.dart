import 'package:dio_hub/app/Dio/cache.dart';
import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/models/repositories/blob_model.dart';
import 'package:dio_hub/models/repositories/code_tree_model.dart';

class GitDatabaseService {
  // Ref: https://docs.github.com/en/rest/reference/git#get-a-tree
  static Future<CodeTreeModel> getTree({String? repoURL, String? sha}) async {
    final response = await request(
            applyBaseURL: false, cacheOptions: CacheManager.defaultCache())
        .get('$repoURL/git/trees/$sha');
    return CodeTreeModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/git#get-a-blob
  static Future<BlobModel> getBlob({String? repoURL, String? sha}) async {
    final response = await request(
            applyBaseURL: false, cacheOptions: CacheManager.defaultCache())
        .get('$repoURL/git/blobs/$sha');
    return BlobModel.fromJson(response.data);
  }

  static Future<BlobModel> getFileContents(String url) async {
    final response = await request(
            applyBaseURL: false, cacheOptions: CacheManager.defaultCache())
        .get(url);
    return BlobModel.fromJson(response.data);
  }
}
