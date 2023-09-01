import 'package:dio_hub/app/api_handler/dio.dart';
import 'package:dio_hub/models/repositories/blob_model.dart';
import 'package:dio_hub/models/repositories/code_tree_model.dart';

class GitDatabaseService {
  static final RESTHandler _restHandler = RESTHandler();

  // Ref: https://docs.github.com/en/rest/reference/git#get-a-tree
  static Future<CodeTreeModel> getTree({
    final String? repoURL,
    final String? sha,
  }) async {
    final response = await _restHandler.get('$repoURL/git/trees/$sha');
    return CodeTreeModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/git#get-a-blob
  static Future<BlobModel> getBlob({
    final String? repoURL,
    final String? sha,
  }) async {
    final response = await _restHandler.get('$repoURL/git/blobs/$sha');
    return BlobModel.fromJson(response.data);
  }

  static Future<BlobModel> getFileContents(final String url) async {
    final response = await _restHandler.get(url);
    return BlobModel.fromJson(response.data);
  }
}
