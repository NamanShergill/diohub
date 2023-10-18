import 'package:diohub/utils/string_compare.dart';
import 'package:markdown/markdown.dart';

String mdToHtml(final String data, {final String? repo}) => markdownToHtml(
      data,
      extensionSet: ExtensionSet.gitHubWeb,
      inlineSyntaxes: <InlineSyntax>[
        TeamMentionSyntax(),
        MentionSyntax(),
        if (repo != null) IssuesPullsNumberSyntax(repo),
        if (repo != null) IssuesPullsRefSyntaxCurrentRepo(repo),
        IssuesPullsRefSyntax(currentRepo: repo),
      ],
    );

class MentionSyntax extends InlineSyntax {
  MentionSyntax() : super(r'\B@\w+');

  @override
  bool onMatch(final InlineParser parser, final Match match) {
    parser.addNode(
      Text(
        '<a href="https://github.com/${match[0]!.substring(1)}" style="color: #ffffff; font-weight:bold">${match[0]}</a>',
      ),
    );
    return true;
  }
}

class TeamMentionSyntax extends InlineSyntax {
  TeamMentionSyntax() : super('\\B@(\\w+)[/]{1}(\\w+)');

  @override
  bool onMatch(final InlineParser parser, final Match match) {
    parser.addNode(
      Text(
        '<a href="https://github.com/orgs/${match[0]!.split('/').first.substring(1)}/teams/${match[0]!.split('/').last}" style="color: #ffffff; font-weight:bold">${match[0]}</a>',
      ),
    );
    return true;
  }
}

class IssuesPullsNumberSyntax extends CustomInlineSyntax {
  IssuesPullsNumberSyntax(final String currentRepo)
      : super('(?:\\#(\\d+))(?!\\w)', currentRepo: currentRepo);
  @override
  bool onMatch(final InlineParser parser, final Match match) {
    parser.addNode(
      Text(
        '<a href="https://github.com/${currentRepo!}/issues/${match[0]!.substring(1)}" style="font-weight:bold">${match[0]}</a>',
      ),
    );
    return true;
  }
}

class IssuesPullsRefSyntaxCurrentRepo extends CustomInlineSyntax {
  IssuesPullsRefSyntaxCurrentRepo(final String currentRepo)
      : super(
          '(/)(?:(issues))(/)(?:(\\d+))(?!\\w)',
          currentRepo: currentRepo,
        );
  @override
  bool onMatch(final InlineParser parser, final Match match) {
    parser.addNode(
      Text(
        '<a href="https://github.com/$currentRepo${match[0]!}" style="font-weight:bold">${match[0]!.replaceAll(currentRepo!, '')}</a>',
      ),
    );
    return true;
  }
}

class IssuesPullsRefSyntax extends CustomInlineSyntax {
  IssuesPullsRefSyntax({final String? currentRepo})
      : super(
          '(?:\\w+)(/)(?:\\w+)(/)(?:(issues))(/)(?:(\\d+))(?!\\w)',
          currentRepo: currentRepo,
        );

  @override
  bool onMatch(final InlineParser parser, final Match match) {
    if (currentRepo != null &&
        StringFunctions(match[0]!).isStringStartingWith(currentRepo!)) {
      parser.addNode(
        Text(
          '<a href="https://github.com/${match[0]!}" style="font-weight:bold">${StringFunctions(match[0]!).replaceAllinString(currentRepo!)}</a>',
        ),
      );
    } else {
      parser.addNode(
        Text(
          '<a href="https://github.com/${match[0]!}" style="font-weight:bold">${match[0]}</a>',
        ),
      );
    }
    return true;
  }
}

abstract class CustomInlineSyntax extends InlineSyntax {
  CustomInlineSyntax(super.pattern, {this.currentRepo});
  final String? currentRepo;
}
