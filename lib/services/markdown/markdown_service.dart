import 'package:dio_hub/app/api_handler/dio.dart';

class MarkdownService {
  static final RESTHandler _restHandler = RESTHandler(
    apiLogSettings: APILoggingSettings(cURL: true, responseBody: false),
  );

  static Future<String> renderMarkdown(
    final String data, {
    required final String? context,
  }) async {
    final res = await _restHandler.post(
      '/markdown',
      data: {
        'text': data,
        'mode': 'gfm',
        if (context != null) 'context': context,
      },
    );
    return res.data;
  }
}
