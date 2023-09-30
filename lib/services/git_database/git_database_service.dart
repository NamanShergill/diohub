import 'package:dio/dio.dart';
import 'package:dio_hub/app/api_handler/dio.dart';
import 'package:dio_hub/models/repositories/blob_model.dart';
import 'package:dio_hub/models/repositories/code_tree_model.dart';
import 'package:dio_hub/utils/type_cast.dart';

class GitDatabaseService {
  static final RESTHandler _restHandler = RESTHandler();

  // Ref: https://docs.github.com/en/rest/reference/git#get-a-tree
  static Future<CodeTreeModel> getTree({
    final String? repoURL,
    final String? sha,
  }) async {
    final Response<TypeMap> response =
        await _restHandler.get<TypeMap>('$repoURL/git/trees/$sha');
    return CodeTreeModel.fromJson(response.data!);
  }

  // Ref: https://docs.github.com/en/rest/reference/git#get-a-blob
  static Future<BlobModel> getBlob({
    final String? repoURL,
    final String? sha,
  }) async {
    final Response<TypeMap> response =
        await _restHandler.get<TypeMap>('$repoURL/git/blobs/$sha');
    return BlobModel.fromJson(response.data!);
  }

  static Future<BlobModel> getFileContents(final String url) async {
    final Response<TypeMap> response = await _restHandler.get<TypeMap>(url);
    return BlobModel.fromJson(response.data!);
  }
}
