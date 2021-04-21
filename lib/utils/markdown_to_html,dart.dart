import 'package:markdown/markdown.dart';

String mdToHtml(String data, {String? repo}) {
  return markdownToHtml(data,
      extensionSet: ExtensionSet.gitHubWeb,
      inlineSyntaxes: [
        TeamMentionSyntax(),
        MentionSyntax(),
        if (repo != null) IssuesPullsSyntax(repo)
      ]);
}

class MentionSyntax extends InlineSyntax {
  MentionSyntax() : super(r'\B@\w+');

  @override
  bool onMatch(InlineParser parser, Match match) {
    parser.addNode(Text(
        '<a href="https://github.com/${match[0]!.substring(1)}" style="color: #ffffff; font-weight:bold">${match[0]}</a>'));
    return true;
  }
}

class TeamMentionSyntax extends InlineSyntax {
  TeamMentionSyntax() : super(r'\B@(\w+)[/]{1}(\w+)');

  @override
  bool onMatch(InlineParser parser, Match match) {
    parser.addNode(Text(
        '<a href="https://github.com/orgs/${match[0]!.split('/').first.substring(1)}/teams/${match[0]!.split('/').last}" style="color: #ffffff; font-weight:bold">${match[0]}</a>'));
    return true;
  }
}

class IssuesPullsSyntax extends InlineSyntax {
  IssuesPullsSyntax(this.repo) : super(r'(?:\#(\d+))(?!\w)');
  final String repo;
  @override
  bool onMatch(InlineParser parser, Match match) {
    parser.addNode(Text(
        '<a href="https://github.com/$repo/issues/${match[0]!.substring(1)}" style="font-weight:bold">${match[0]}</a>'));
    return true;
  }
}
