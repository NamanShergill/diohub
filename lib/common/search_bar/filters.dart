class SearchFilters {
  late List<SearchQuery> _queries;
  late List<SearchQuery> _optionQueries;
  final List<SearchQuery> _blackList;
  final SearchQueries searchQueries = SearchQueries();
  RegExp? _queriesRegExp;
  RegExp? _blacklistRegExp;
  RegExp? _optionQueriesRegExp;
  RegExp? _optionQueriesOnlyRegExp;

  RegExp get queriesRegExp => _queriesRegExp!;
  RegExp get blacklistRegExp => _blacklistRegExp!;
  RegExp get optionQueriesRegExp => _optionQueriesRegExp!;
  RegExp get optionQueriesOnlyRegExp => _optionQueriesOnlyRegExp!;
  List<SearchQuery> get queries => _queries;
  List<SearchQuery> get optionQueries => _optionQueries;
  List<SearchQuery> get whiteListedQueries => _optionQueries + _queries;

  SearchQuery? queryFromString(String query) {
    SearchQuery? value;
    _queries.forEach((element) {
      if (element.query == query) value = element;
    });
    _optionQueries.forEach((element) {
      if (element.query == query) value = element;
    });
    _blackList.forEach((element) {
      if (element.query == query) value = element;
    });
    return value;
  }

  SearchFilters.repositories({List<SearchQuery> blacklist = const []})
      : _blackList = blacklist {
    _queries = _getFilteredList([
      searchQueries.repo,
      searchQueries.user,
      searchQueries.org,
      searchQueries.size,
      searchQueries.followers,
      searchQueries.forks,
      searchQueries.stars,
      searchQueries.created,
      searchQueries.pushed,
      searchQueries.language,
      searchQueries.topic,
      searchQueries.topics,
      searchQueries.license,
      searchQueries.iS,
      searchQueries.mirror,
      searchQueries.archived,
      searchQueries.goodFirstIssues,
      searchQueries.helpWantedIssues,
    ], blacklist);
    _optionQueries = _getFilteredList([
      searchQueries.iN
        ..options = {
          'name': 'Name',
          'description': 'Description',
          'readme': 'Readme'
        },
    ], blacklist);
    _queriesRegExp = _getRegExp(_queries);
    _blacklistRegExp = _getRegExp(_blackList);
    _optionQueriesOnlyRegExp = _getRegExp(_optionQueries);
    _optionQueriesRegExp = _getOptionRegExp(_optionQueries);
  }

  static RegExp _getOptionRegExp(List<SearchQuery> queries) {
    List<String> strings = queries
        .map((query) => query.options!.keys
            .map((option) => '${query.query}:$option')
            .join('|'))
        .toList();
    String filter = strings.join('|');
    return RegExp(
        '(?:-)?(?:$filter)([=><]{1,2})?([*..]{1,3})?((\\w|\\d| |[a-zA-Z0-9!@#\$&()\\-`.+,/"])*)([..*]{1,3})?(?=(\\s)($filter)?|\$)');
  }

  static RegExp _getRegExp(List<SearchQuery> queries) {
    List<String> strings = queries.map((e) => e.query + ':').toList();
    String filter = strings.join('|');
    return RegExp(
        '(?:-)?(?:$filter)([=><]{1,2})?([*..]{1,3})?((\\w|\\d| |[a-zA-Z0-9!@#\$&()\\-`.+,/"])*)([..*]{1,3})?(?=(\\s)($filter)?|\$)');
  }

  static List<SearchQuery> _getFilteredList(
      List<SearchQuery> original, List<SearchQuery> blacklist) {
    List<String> blacklistedQueries = blacklist.map((e) => e.query).toList();
    List<SearchQuery> list = [];
    original.forEach((element) {
      if (!blacklistedQueries.contains(element.query)) list.add(element);
    });
    return list;
  }
}

class SearchQueries {
  SearchQuery archived = SearchQuery('archived');
  SearchQuery assignee = SearchQuery('assignee');
  SearchQuery author = SearchQuery('author');
  SearchQuery authorName = SearchQuery('author-name');
  SearchQuery authorEmail = SearchQuery('author-email');
  SearchQuery authorDate = SearchQuery('author-date');
  SearchQuery base = SearchQuery('base');
  SearchQuery closed = SearchQuery('closed');
  SearchQuery commenter = SearchQuery('commenter');
  SearchQuery comments = SearchQuery('comments');
  SearchQuery committer = SearchQuery('committer');
  SearchQuery committerName = SearchQuery('committer-name');
  SearchQuery committerEmail = SearchQuery('committer-email');
  SearchQuery committerDate = SearchQuery('committer-date');
  SearchQuery created = SearchQuery('created');
  SearchQuery draft = SearchQuery('draft');
  SearchQuery extension = SearchQuery('extension');
  SearchQuery filename = SearchQuery('filename');
  SearchQuery followers = SearchQuery('followers');
  SearchQuery fork = SearchQuery('fork');
  SearchQuery forks = SearchQuery('forks');
  SearchQuery fullName = SearchQuery('fullname');
  SearchQuery goodFirstIssues = SearchQuery('good-first-issues');
  SearchQuery hash = SearchQuery('hash');
  SearchQuery head = SearchQuery('head');
  SearchQuery helpWantedIssues = SearchQuery('help-wanted-issues');
  SearchQuery iN = SearchQuery('in');
  SearchQuery interactions = SearchQuery('interactions');
  SearchQuery involves = SearchQuery('involves');
  SearchQuery iS = SearchQuery('is');
  SearchQuery label = SearchQuery('label');
  SearchQuery language = SearchQuery('language');
  SearchQuery license = SearchQuery('license');
  SearchQuery linked = SearchQuery('linked');
  SearchQuery location = SearchQuery('location');
  SearchQuery merge = SearchQuery('merge');
  SearchQuery merged = SearchQuery('merged');
  SearchQuery mentions = SearchQuery('mentions');
  SearchQuery milestone = SearchQuery('milestone');
  SearchQuery mirror = SearchQuery('mirror');
  SearchQuery org = SearchQuery('org');
  SearchQuery parent = SearchQuery('parent');
  SearchQuery path = SearchQuery('path');
  SearchQuery project = SearchQuery('project');
  SearchQuery pushed = SearchQuery('pushed');
  SearchQuery reactions = SearchQuery('reactions');
  SearchQuery repo = SearchQuery('repo');
  SearchQuery repos = SearchQuery('repos');
  SearchQuery repositories = SearchQuery('repositories');
  SearchQuery review = SearchQuery('review');
  SearchQuery reviewedBy = SearchQuery('reviewed-by');
  SearchQuery reviewRequested = SearchQuery('review-requested');
  SearchQuery teamReviewRequested = SearchQuery('team-review-requested');
  SearchQuery sha = SearchQuery('SHA');
  SearchQuery size = SearchQuery('size');
  SearchQuery stars = SearchQuery('stars');
  SearchQuery state = SearchQuery('state');
  SearchQuery status = SearchQuery('status');
  SearchQuery team = SearchQuery('team');
  SearchQuery topic = SearchQuery('topic');
  SearchQuery topics = SearchQuery('topics');
  SearchQuery tree = SearchQuery('tree');
  SearchQuery type = SearchQuery('type');
  SearchQuery updated = SearchQuery('updated');
  SearchQuery user = SearchQuery('user');
}

class SearchQuery {
  final String query;
  final String? description;
  Map<String, String>? options;
  final QueryType type;
  SearchQuery(this.query,
      {this.description, this.options, this.type = QueryType.string});
}

enum QueryType { string, range, date }
