import 'package:flutter_emoji/flutter_emoji.dart';

String emoteText(String string) {
  return _emojiParser.emojify(string);
}

EmojiParser _emojiParser = EmojiParser();
