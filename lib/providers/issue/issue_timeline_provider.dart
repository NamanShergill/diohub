import 'package:onehub/models/issues/issue_timeline_event_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/issue/issue_provider.dart';

class IssueTimelineProvider extends BaseProvider {
  IssueProvider _issueProvider;
  IssuesTimelineEventModel _issuesTimelineEvent;
}
