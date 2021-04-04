import 'package:flutter_emoji/flutter_emoji.dart';

String emoteText(String string) {
  return EmojiParser().emojify(string);
}
