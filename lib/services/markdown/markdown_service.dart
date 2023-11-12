import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:diohub/app/api_handler/dio.dart';

class MarkdownService {
  static final RESTHandler _restHandler = RESTHandler(
      // apiLogSettings: APILoggingSettings(responseBody: true),
      );

  static Future<String> renderMarkdown(
    final String data, {
    required final String? context,
  }) async {
    final Response<String> res = await _restHandler.post<String>(
      '/markdown',
      data: <String, String>{
        'text': data,
        'mode': 'gfm',
        if (context != null) 'context': context,
      },
    );
    log('markdown', error: res.data);
    return res.data!;
  }
}
