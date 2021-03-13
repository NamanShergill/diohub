import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/reactions/reactions_model.dart';

class ReactionsService {
// Ref: https://docs.github.com/en/rest/reference/reactions#list-reactions-for-an-issue-comment
  static Future<List<ReactionsModel>> getCommitCommentReactions(
      String fullURL) async {
    Response response = await GetDio.getDio(
            applyBaseURL: false,
            acceptHeader: 'application/vnd.github.squirrel-girl-preview')
        .get('$fullURL/reactions');
    List unParsedData = response.data;
    return unParsedData.map((e) => ReactionsModel.fromJson(e)).toList();
  }
}
