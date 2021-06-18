// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_emoji/flutter_emoji.dart';

String emoteText(String string) {
  return _emojiParser.emojify(string);
}

EmojiParser _emojiParser = EmojiParser();
