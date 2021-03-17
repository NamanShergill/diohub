import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/reactions/reactions_model.dart';

class ReactionsService {
// Ref: https://docs.github.com/en/rest/reference/reactions#list-reactions-for-an-issue-comment
  static Future<List<ReactionsModel>> getReactions(String fullURL) async {
    Response response = await GetDio.getDio(
            applyBaseURL: false,
            acceptHeader: 'application/vnd.github.squirrel-girl-preview',
            options: CacheManager.defaultCache())
        .get('$fullURL/reactions');
    List unParsedData = response.data;
    return unParsedData.map((e) => ReactionsModel.fromJson(e)).toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/reactions#create-reaction-for-an-issue
  static Future<ReactionsModel> createReaction(
      String fullURL, String reaction) async {
    Response response = await GetDio.getDio(
      applyBaseURL: false,
      acceptHeader: 'application/vnd.github.squirrel-girl-preview',
    ).post('$fullURL/reactions', data: {'content': reaction});
    if (response.statusCode == 201)
      return ReactionsModel.fromJson(response.data);
    return null;
  }

  // Ref: https://docs.github.com/en/rest/reference/reactions#delete-an-issue-comment-reaction
  static Future deleteReaction(String fullURL, int reactionID) async {
    await GetDio.getDio(
            applyBaseURL: false,
            acceptHeader: 'application/vnd.github.squirrel-girl-preview')
        .delete('$fullURL/reactions/$reactionID');
  }
}
