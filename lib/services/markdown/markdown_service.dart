import 'package:dio_hub/app/Dio/dio.dart';

class MarkdownService {
  static Future<String> renderMarkdown(String data,
      {required String? context}) async {
    final res = await API.request().post('/markdown', data: {
      'text': data,
      'mode': 'gfm',
      if (context != null) 'context': context,
    });
    return res.data;
  }
}
