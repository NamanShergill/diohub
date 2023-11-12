import 'package:flutter_emoji/flutter_emoji.dart';

String emoteText(final String string) => _emojiParser.emojify(string);

EmojiParser _emojiParser = EmojiParser();
