class SearchFilters {
  List<SearchQuery> _basicQueries = [];
  List<SearchQuery> _sensitiveQueries = [];
  List<SearchQuery> _blackList = [];
  final SearchType _searchType;
  final Map<String, String> _sortOptions;
  final SearchQueries searchQueries = SearchQueries();

  /// Get search type.
  SearchType get searchType => _searchType;

  /// Get regexp to match all valid queries in a string.
  RegExp get allValidQueriesRegexp => RegExp(validBasicQueriesRegExp.pattern +
      '|' +
      validSensitiveQueriesRegExp.pattern);

  /// Get regexp to match all invalid queries in a string.
  RegExp get allInvalidQueriesRegExp =>
      _getIncompleteRegExp(_basicQueries + _sensitiveQueries + _blackList);

  /// Sort options for the given search filter.
  Map<String, String> get sortOptions => _sortOptions;

  /// Get regexp to match valid basic queries in a string.
  RegExp get validBasicQueriesRegExp => _getRegExp(_basicQueries);

  /// Get regexp to match valid sensitive queries in a string.
  RegExp get validSensitiveQueriesRegExp =>
      _getSensitiveQueryRegExp(_sensitiveQueries);

  /// Get regexp to match all blacklisted queries in a string.
  RegExp get blacklistRegExp => _getIncompleteRegExp(_blackList);

  /// Get regexp to match invalid basic queries in a string.
  RegExp get invalidBasicQueriesRegExp => _getIncompleteRegExp(_basicQueries);

  /// Get regexp to match invalid sensitive queries in a string.
  RegExp get invalidSensitiveQueriesRegExp =>
      _getIncompleteRegExp(_sensitiveQueries);

  /// Get regexp to match NOT operators in a string.
  static RegExp get notOperatorRegExp =>
      RegExp('(?:NOT)(?:\\s)(?!(NOT|OR|AND))(\\w+)');

  /// Get regexp to match AND/OR operators in a string.
  static RegExp get andOperatorRegExp => RegExp(
      '(${optionalQuotes('(\\w[^(NOT|OR|AND| )]+)', allowSpace: true, spacedRegex: '((\\w|\\s+)+)')})?(?:(\\s)+)(?:AND)(?:(\\s)+)(?!(NOT|OR|AND))(${optionalQuotes('\\w+', allowSpace: true, spacedRegex: '((\\w|\\s+)+)')})');

  /// Get regexp to matchOR operators in a string.
  static RegExp get orOperatorRegExp => RegExp(
      '(${optionalQuotes('(\\w[^(NOT|OR|AND| )]+)', allowSpace: true, spacedRegex: '((\\w|\\s+)+)')})?(?:(\\s)+)(?:OR)(?:(\\s)+)(?!(NOT|OR|AND))(${optionalQuotes('\\w+', allowSpace: true, spacedRegex: '((\\w|\\s+)+)')})');

  // List<SearchQuery> get queries => _queries;
  // List<SearchQuery> get sensitiveQueries => _sensitiveQueries;

  /// Get all whitelisted queries for the [SearchFilters] instance.
  List<SearchQuery> get whiteListedQueries {
    List<SearchQuery> list = _sensitiveQueries + _basicQueries;
    list.sort((a, b) => a.query.toLowerCase().compareTo(b.query.toLowerCase()));
    return list;
  }

  /// Get all whitelisted query strings for the [SearchFilters] instance.
  List<String> get whiteListedQueriesStrings =>
      whiteListedQueries.map((e) => e.query).toList();

  /// Get the corresponding [SearchQuery] instance in the lists from a given string.
  SearchQuery? queryFromString(String query) {
    SearchQuery? value;
    if (query.startsWith('-')) query = query.substring(1);
    (_basicQueries + _sensitiveQueries + _blackList).forEach((element) {
      if (element.query == query) value = element;
    });
    return value;
  }

  /// Create a [SearchFilters] instance with data of a repository search.
  /// Ref: https://docs.github.com/en/github/searching-for-information-on-github/searching-for-repositories
  SearchFilters.repositories({List<String> blacklist = const []})
      : _sortOptions = {
          'stars-desc': 'Most stars',
          'stars-asc': 'Fewest stars',
          'forks-desc': 'Most forks',
          'forks-asc': 'Least forks',
          'updated-desc': 'Recently updated',
          'updated-asc': 'Least Recently updated',
        },
        _searchType = SearchType.repositories {
    _filterQueries([
      searchQueries.archived,
      searchQueries.created,
      searchQueries.followers,
      searchQueries.forks,
      searchQueries.goodFirstIssues,
      searchQueries.helpWantedIssues,
      searchQueries.iN
        ..addOptions({
          'name': 'Name',
          'description': 'Description',
          'readme': 'Readme',
        }),
      searchQueries.iS
        ..addOptions({
          'public': '',
          'internal': '',
          'private': '',
        }),
      searchQueries.language,
      searchQueries.license,
      searchQueries.mirror,
      searchQueries.org,
      searchQueries.pushed,
      searchQueries.repo,
      searchQueries.size,
      searchQueries.stars,
      searchQueries.topic,
      searchQueries.topics,
      searchQueries.user,
    ], blacklist);
  }

  /// Create a [SearchFilters] instance with data of issues and pull requests search.
  /// Ref: https://docs.github.com/en/github/searching-for-information-on-github/searching-issues-and-pull-requests
  SearchFilters.issuesPulls({List<String> blacklist = const []})
      : _sortOptions = {
          'created-desc': 'Newest',
          'created-asc': 'Oldest',
          'comments-desc': 'Most comments',
          'comments-asc': 'Least comments',
          'updated-desc': 'Recently updated',
          'updated-asc': 'Least recently updated',
          'reactions-desc': 'Most reactions',
          'reactions-asc': 'Least reactions',
          'reactions-+1-desc': 'Most 👍',
          // 'reactions-+1-asc': 'Least 👍',
          'reactions--1-desc': 'Most 👎',
          // 'reactions--1-asc': 'Least 👎',
          'reactions-smile-desc': 'Most 😄',
          // 'reactions-smile-asc': 'Least 😄',
          'reactions-thinking_face-desc': 'Most 😕',
          // 'reactions-thinking_face-asc': 'Least 😕',
          'reactions-heart-desc': 'Most ❤️',
          // 'reactions-heart-asc': 'Least ❤️',
          'reactions-tada-desc': 'Most 🎉',
          // 'reactions-tada-asc': 'Least 🎉',
          'reactions-rocket-desc': 'Most 🚀',
          // 'reactions-rocket-asc': 'Least 🚀',
          'reactions-eyes-desc': 'Most 👀',
          // 'reactions-eyes-asc': 'Least 👀',
        },
        _searchType = SearchType.issues_pulls {
    _filterQueries([
      searchQueries.author,
      searchQueries.assignee,
      searchQueries.archived,
      searchQueries.iN
        ..addOptions({
          'title': 'Name',
          'body': 'Description',
          'comments': 'Readme',
        }),
      searchQueries.type
        ..addOptions({
          'pr': 'Pull Request',
          'issue': 'Issue',
        }),
      searchQueries.iS
        ..addOptions({
          'open': '',
          'closed': '',
          'pr': 'Pull Request',
          'issue': 'Issue',
          'public': '',
          'internal': '',
          'private': '',
          'merged': '',
          'unmerged': '',
          'locked': '',
          'unlocked': '',
        }),
      searchQueries.state
        ..addOptions({
          'open': '',
          'closed': '',
        }),
      searchQueries.no
        ..addOptions({
          'label': '',
          'milestone': '',
          'assignee': '',
          'project': '',
        }),
      searchQueries.team,
      searchQueries.head,
      searchQueries.base,
      searchQueries.language,
      searchQueries.comments,
      searchQueries.interactions,
      searchQueries.reactions,
      searchQueries.draft,
      searchQueries.commenter,
      searchQueries.review
        ..addOptions({
          'none': '',
          'required': '',
          'approved': '',
          'changes_requested': '',
        }),
      searchQueries.reviewRequested,
      searchQueries.teamReviewRequested,
      searchQueries.involves,
      searchQueries.created,
      searchQueries.updated,
      searchQueries.closed,
      searchQueries.merged,
      searchQueries.linked
        ..addOptions({
          'pr': '',
          'issue': '',
        }),
      searchQueries.label,
      searchQueries.milestone,
      searchQueries.status
        ..addOptions({
          'pending': '',
          'success': '',
          'failure': '',
        }),
      searchQueries.mentions,
      searchQueries.project,
      searchQueries.user,
      searchQueries.org,
      searchQueries.repo,
    ], blacklist);
  }

  RegExp _getSensitiveQueryRegExp(List<SearchQuery> queries) {
    List<SearchQuery> optionQ = [];
    List<SearchQuery> dateQ = [];
    List<SearchQuery> numberQ = [];
    List<SearchQuery> userQ = [];
    List<SearchQuery> spacedQ = [];
    List<SearchQuery> customQ = [];
    queries.forEach(
      (element) {
        if (element.type == QueryType.date)
          dateQ.add(element);
        else if (element.type == QueryType.number)
          numberQ.add(element);
        else if (element.type == QueryType.user ||
            element.type == QueryType.org)
          userQ.add(element);
        else if (element.type == QueryType.spacedString)
          spacedQ.add(element);
        else if (element.type == QueryType.custom)
          customQ.add(element);
        else
          optionQ.add(element);
      },
    );

    /*
        (?:-)? -> Optional [-] at start.
        (?:${spacedQs.join('|')}) -> Starts with the given queries.
        (?:") -> Checks for start quote.
        ((\\w|\\d| |[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+) -> Everything after start quote.
        (?:") -> Checks for end quote.
        (?=(\\s)(${spacedQs.join('|')})?|\$) ->  Ends with another query or end of line.
    */
    List<String> spacedQs = spacedQ.map((e) => e.query + ':').toList();
    String spacedRegExp =
        '(?:-)?(?:${spacedQs.join('|')})(((?:")((\\w|\\d| |[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+)(?:"))|((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+))(?=(\\s))';

    /*
        (?:-)? -> Optional [-] at start.
        (?:${optionsQ.join('|')}) -> Starts with the given queries.
    */
    List<String> optionsQ = optionQ
        .map((query) => query.options!.keys
            .map((option) => '${query.query}:($option|"$option")')
            .join('|'))
        .toList();
    String optionRegexp = '(?:-)?(?:${optionsQ.join('|')})(?=(\\s))';

    /*
    Common:
        (?:-)? -> Optional [-] at start.
        (?:${numbersQ.join('|')}) -> Starts with the given queries.
        (?:") -> Checks for start quote.
        (?:") -> Checks for end quote.
        (?=(\\s)(${numbersQ.join('|')})?|\$) ->  Ends with another query or end of line.
    Cases:
        ([><][=]?)?([0-9]+) -> [10], [>10], [>=10], [<=10]
        -----------------------
        ([0-9]+)([.][.][*]) -> [10..*]
        -----------------------
        ([*][.][.])([0-9]+) -> [*..10]
    */
    List<String> numbersQ = numberQ.map((query) => '${query.query}:').toList();
    String numberRegexp =
        '(?:-)?(?:${numbersQ.join('|')})${optionalQuotes('([><][=]?)?([0-9]+)')}(?=(\\s))|(?:-)?(?:${numbersQ.join('|')})${optionalQuotes('([0-9]+)([.][.][*])')}(?=(\\s))|(?:-)?(?:${numbersQ.join('|')})${optionalQuotes('([*][.][.])([0-9]+)')}(?=(\\s))';

    /*
        (?:-)? -> Optional [-] at start.
        (?:$filter) -> Starts with the given queries.
        (?:") -> Checks for start quote.
        (([a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+) -> Any character following.
        (?:") -> Checks for end quote.
        (?=(\\s)($filter)?|\$) -> Ends with another query or end of line.
    */
    List<String> usersQ = userQ.map((query) => '${query.query}:').toList();
    String userRegExp =
        '(?:-)?(?:${usersQ.join('|')})${optionalQuotes('(([a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+)')}(?=(\\s))';
    // print(numberRegexp + '|' + userRegExp + '|' + boolRegexp);

    List<String> finalRegex = [];
    if (spacedQ.isNotEmpty) finalRegex.add(spacedRegExp);
    if (userQ.isNotEmpty) finalRegex.add(userRegExp);
    if (optionQ.isNotEmpty) finalRegex.add(optionRegexp);
    if (numberQ.isNotEmpty) finalRegex.add(numberRegexp);
    if (customQ.isNotEmpty)
      customQ.forEach((element) {
        finalRegex.add(element.customRegex!);
      });
    return RegExp(finalRegex.join('|'));
  }

  RegExp _getRegExp(List<SearchQuery> queries) {
    List<String> strings = queries.map((e) => e.query + ':').toList();
    String filter = strings.join('|');
    /*
        (?:-)? -> Optional [-] at start.
        (?:$filter) -> Starts with the given queries.
        ((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+) -> Any character following.
        (?=(\\s)($filter)?|\$) -> Ends with another query or end of line.
    */
    String regex = '(?:-)?(?:$filter)${optionalQuotes('(.[^":]+)')}(?=(\\s))';
    if (queries.isEmpty) regex = '(?!x)x';
    return RegExp(regex);
  }

  RegExp _getIncompleteRegExp(
    List<SearchQuery> queries,
  ) {
    List<String> strings = queries.map((e) => e.query + ':').toList();
    String filter = strings.join('|');
    /*
        (?:-)? -> Optional [-] at start.
        (?:$filter) -> Starts with the given queries.
        (.*) -> Any character following.
        (?=(\\s)($filter)?|\$) -> Ends with another query or end of line.
    */
    String regex = '(?:-)?(?:$filter)(.[^"]*)?(?:")?';
    if (queries.isEmpty) regex = '(?!x)x';
    return RegExp(regex);
  }

  void _filterQueries(List<SearchQuery> original, List<String> blacklist) {
    List<SearchQuery> allQueries = searchQueries.allQueries;
    original.forEach(
      (element) {
        if (!blacklist.contains(element.query)) {
          if (element.type != QueryType.basic || element.options != null)
            _sensitiveQueries.add(element);
          else
            _basicQueries.add(element);
        }
      },
    );
    List<SearchQuery> filteredBlackList = [];
    allQueries.forEach((e) {
      if (!whiteListedQueries.contains(e)) filteredBlackList.add(e);
    });
    _blackList.addAll(filteredBlackList);
  }

  static String optionalQuotes(String string,
      {bool allowSpace = false, String? spacedRegex}) {
    if (allowSpace) return '(((?:")$spacedRegex(?:"))|($string))';
    return '(((?:")$string(?:"))|($string))';
  }
}

class SearchQueries {
  static String _teamRegex =
      '(?:-)?(?:${SearchQueryStrings.team}:)${SearchFilters.optionalQuotes('((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+)(/)((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+)')}(?=(\\s))';
  static String _authorRegex =
      '(?:-)?(?:${SearchQueryStrings.author}:)${SearchFilters.optionalQuotes('((app)(/))?((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,])+)')}(?=(\\s))';

  /*
        (?:-)? -> Optional [-] at start.
        (?:${SearchQueryStrings.repo}:) -> Starts with the given queries.
        (?:") -> Checks for start quote.
        ((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+) -> Everything after start quote.
        (((/)((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+)){1,2}) -> Everything after [/], min 1, max 2.
        (?:") -> Checks for end quote.
        (?:${SearchQueryStrings.repo}:) ->  Ends with given queries or end of line.
  */
  static String _projectRegex =
      '(?:-)?(?:${SearchQueryStrings.project}:)${SearchFilters.optionalQuotes('((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+)(((/)((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+)){1,2})')}(?=(\\s))';

  /*
        (?:-)? -> Optional [-] at start.
        (?:${SearchQueryStrings.repo}:) -> Starts with the given queries.
        (?:") -> Checks for start quote.
        ((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+) -> Everything after start quote.
        (/) -> Checks that [/] is present.
        ((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+) -> Everything after [/].
        (?:") -> Checks for end quote.
        (?:${SearchQueryStrings.repo}:) ->  Ends with given queries or end of line.
  */
  static String _repoRegex =
      '(?:-)?(?:${SearchQueryStrings.repo}:)${SearchFilters.optionalQuotes('((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+)(/)((\\w|\\d|[a-zA-Z0-9!><=@#\$&\\(\\)\\-`.+,/])+)')}(?=(\\s))';

  SearchQuery archived =
      SearchQuery(SearchQueryStrings.archived, type: QueryType.bool);
  SearchQuery assignee =
      SearchQuery(SearchQueryStrings.assignee, type: QueryType.user);
  SearchQuery author =
      SearchQuery(SearchQueryStrings.author, customRegex: _authorRegex);
  SearchQuery authorName = SearchQuery(SearchQueryStrings.authorName);
  SearchQuery authorEmail = SearchQuery(SearchQueryStrings.authorEmail);
  SearchQuery authorDate = SearchQuery(SearchQueryStrings.authorDate);
  SearchQuery base = SearchQuery(SearchQueryStrings.base);
  SearchQuery closed =
      SearchQuery(SearchQueryStrings.closed, type: QueryType.date);
  SearchQuery commenter =
      SearchQuery(SearchQueryStrings.commenter, type: QueryType.user);
  SearchQuery comments = SearchQuery(SearchQueryStrings.comments);
  SearchQuery committer =
      SearchQuery(SearchQueryStrings.committer, type: QueryType.user);
  SearchQuery committerName = SearchQuery(SearchQueryStrings.committerName);
  SearchQuery committerEmail = SearchQuery(SearchQueryStrings.committerEmail);
  SearchQuery committerDate = SearchQuery(SearchQueryStrings.committerDate);
  SearchQuery created =
      SearchQuery(SearchQueryStrings.created, type: QueryType.date);
  SearchQuery draft =
      SearchQuery(SearchQueryStrings.draft, type: QueryType.bool);
  SearchQuery extension = SearchQuery(SearchQueryStrings.extension);
  SearchQuery filename = SearchQuery(SearchQueryStrings.filename);
  SearchQuery followers =
      SearchQuery(SearchQueryStrings.followers, type: QueryType.number);
  SearchQuery fork = SearchQuery(SearchQueryStrings.fork, options: {
    'true': 'Include forks.',
    'only': 'Only show forks.',
  });
  SearchQuery forks =
      SearchQuery(SearchQueryStrings.forks, type: QueryType.number);
  SearchQuery fullName =
      SearchQuery(SearchQueryStrings.fullName, type: QueryType.spacedString);
  SearchQuery goodFirstIssues = SearchQuery(SearchQueryStrings.goodFirstIssues);
  SearchQuery hash = SearchQuery(SearchQueryStrings.hash);
  SearchQuery head = SearchQuery(SearchQueryStrings.head);
  SearchQuery helpWantedIssues =
      SearchQuery(SearchQueryStrings.helpWantedIssues);
  SearchQuery iN = SearchQuery(SearchQueryStrings.iN, qualifierQuery: false);
  SearchQuery interactions =
      SearchQuery(SearchQueryStrings.interactions, type: QueryType.number);
  SearchQuery involves =
      SearchQuery(SearchQueryStrings.involves, type: QueryType.user);
  SearchQuery iS = SearchQuery(SearchQueryStrings.iS, qualifierQuery: false);
  SearchQuery label =
      SearchQuery(SearchQueryStrings.label, type: QueryType.spacedString);
  SearchQuery language = SearchQuery(SearchQueryStrings.language);
  SearchQuery license = SearchQuery(SearchQueryStrings.license);
  SearchQuery linked = SearchQuery(SearchQueryStrings.linked);
  SearchQuery location = SearchQuery(SearchQueryStrings.location);
  SearchQuery merge = SearchQuery(SearchQueryStrings.merge);
  SearchQuery merged =
      SearchQuery(SearchQueryStrings.merged, type: QueryType.date);
  SearchQuery mentions =
      SearchQuery(SearchQueryStrings.mentions, type: QueryType.user);
  SearchQuery milestone =
      SearchQuery(SearchQueryStrings.milestone, type: QueryType.spacedString);
  SearchQuery mirror =
      SearchQuery(SearchQueryStrings.mirror, type: QueryType.bool);
  SearchQuery no = SearchQuery(SearchQueryStrings.no);
  SearchQuery org = SearchQuery(SearchQueryStrings.org, type: QueryType.org);
  SearchQuery parent = SearchQuery(SearchQueryStrings.parent);
  SearchQuery path = SearchQuery(SearchQueryStrings.path);
  SearchQuery project =
      SearchQuery(SearchQueryStrings.project, customRegex: _projectRegex);
  SearchQuery pushed =
      SearchQuery(SearchQueryStrings.pushed, type: QueryType.date);
  SearchQuery reactions = SearchQuery(SearchQueryStrings.reactions);
  SearchQuery repo =
      SearchQuery(SearchQueryStrings.repo, customRegex: _repoRegex);
  SearchQuery repos = SearchQuery(SearchQueryStrings.repos);
  SearchQuery repositories = SearchQuery(SearchQueryStrings.repositories);
  SearchQuery review = SearchQuery(SearchQueryStrings.review);
  SearchQuery reviewedBy =
      SearchQuery(SearchQueryStrings.reviewedBy, type: QueryType.user);
  SearchQuery reviewRequested =
      SearchQuery(SearchQueryStrings.reviewRequested, type: QueryType.user);
  SearchQuery size =
      SearchQuery(SearchQueryStrings.size, type: QueryType.number);
  SearchQuery sort = SearchQuery(SearchQueryStrings.sort);
  SearchQuery stars =
      SearchQuery(SearchQueryStrings.stars, type: QueryType.number);
  SearchQuery state = SearchQuery(SearchQueryStrings.state);
  SearchQuery status = SearchQuery(SearchQueryStrings.status);
  SearchQuery team =
      SearchQuery(SearchQueryStrings.team, customRegex: _teamRegex);
  SearchQuery teamReviewRequested = SearchQuery(
      SearchQueryStrings.teamReviewRequested,
      customRegex: _teamRegex);
  SearchQuery topic =
      SearchQuery(SearchQueryStrings.topic, type: QueryType.spacedString);
  SearchQuery topics =
      SearchQuery(SearchQueryStrings.topics, type: QueryType.number);
  SearchQuery tree = SearchQuery(SearchQueryStrings.tree);
  SearchQuery type =
      SearchQuery(SearchQueryStrings.type, qualifierQuery: false);
  SearchQuery updated = SearchQuery(SearchQueryStrings.updated);
  SearchQuery user = SearchQuery(SearchQueryStrings.user, type: QueryType.user);

  List<SearchQuery> get allQueries => [
        archived,
        assignee,
        author,
        authorName,
        authorEmail,
        authorDate,
        base,
        closed,
        commenter,
        comments,
        committer,
        committerName,
        committerEmail,
        committerDate,
        created,
        draft,
        extension,
        filename,
        followers,
        fork,
        forks,
        fullName,
        goodFirstIssues,
        hash,
        head,
        helpWantedIssues,
        iN,
        interactions,
        involves,
        iS,
        label,
        language,
        license,
        linked,
        location,
        merge,
        merged,
        mentions,
        milestone,
        mirror,
        no,
        org,
        parent,
        path,
        project,
        pushed,
        reactions,
        repo,
        repos,
        repositories,
        review,
        reviewedBy,
        reviewRequested,
        teamReviewRequested,
        size,
        sort,
        stars,
        state,
        status,
        team,
        topic,
        topics,
        tree,
        type,
        updated,
        user
      ];
}

class SearchQueryStrings {
  static const String archived = 'archived';
  static const String assignee = 'assignee';
  static const String author = 'author';
  static const String authorName = 'author-name';
  static const String authorEmail = 'author-email';
  static const String authorDate = 'author-date';
  static const String base = 'base';
  static const String closed = 'closed';
  static const String commenter = 'commenter';
  static const String comments = 'comments';
  static const String committer = 'committer';
  static const String committerName = 'committer-name';
  static const String committerEmail = 'committer-email';
  static const String committerDate = 'committer-date';
  static const String created = 'created';
  static const String draft = 'draft';
  static const String extension = 'extension';
  static const String filename = 'filename';
  static const String followers = 'followers';
  static const String fork = 'fork';
  static const String forks = 'forks';
  static const String fullName = 'fullname';
  static const String goodFirstIssues = 'good-first-issues';
  static const String hash = 'hash';
  static const String head = 'head';
  static const String helpWantedIssues = 'help-wanted-issues';
  static const String iN = 'in';
  static const String interactions = 'interactions';
  static const String involves = 'involves';
  static const String iS = 'is';
  static const String label = 'label';
  static const String language = 'language';
  static const String license = 'license';
  static const String linked = 'linked';
  static const String location = 'location';
  static const String merge = 'merge';
  static const String merged = 'merged';
  static const String mentions = 'mentions';
  static const String milestone = 'milestone';
  static const String mirror = 'mirror';
  static const String no = 'no';
  static const String org = 'org';
  static const String parent = 'parent';
  static const String path = 'path';
  static const String project = 'project';
  static const String pushed = 'pushed';
  static const String reactions = 'reactions';
  static const String repo = 'repo';
  static const String repos = 'repos';
  static const String repositories = 'repositories';
  static const String review = 'review';
  static const String reviewedBy = 'reviewed-by';
  static const String reviewRequested = 'review-requested';
  static const String teamReviewRequested = 'team-review-requested';
  static const String size = 'size';
  static const String sort = 'sort';
  static const String stars = 'stars';
  static const String state = 'state';
  static const String status = 'status';
  static const String team = 'team';
  static const String topic = 'topic';
  static const String topics = 'topics';
  static const String tree = 'tree';
  static const String type = 'type';
  static const String updated = 'updated';
  static const String user = 'user';

  static const List<String> allQueries = [
    archived,
    assignee,
    author,
    authorName,
    authorEmail,
    authorDate,
    base,
    closed,
    commenter,
    comments,
    committer,
    committerName,
    committerEmail,
    committerDate,
    created,
    draft,
    extension,
    filename,
    followers,
    fork,
    forks,
    fullName,
    goodFirstIssues,
    hash,
    head,
    helpWantedIssues,
    iN,
    interactions,
    involves,
    iS,
    label,
    language,
    license,
    linked,
    location,
    merge,
    merged,
    mentions,
    milestone,
    mirror,
    no,
    org,
    parent,
    path,
    project,
    pushed,
    reactions,
    repo,
    repos,
    repositories,
    review,
    reviewedBy,
    reviewRequested,
    teamReviewRequested,
    size,
    sort,
    stars,
    state,
    status,
    team,
    topic,
    topics,
    tree,
    type,
    updated,
    user
  ];
}

class SearchQuery {
  final String query;
  final String? description;
  final String? customRegex;
  final bool qualifierQuery;
  Map<String, String>? options;
  final QueryType type;
  SearchQuery(this.query,
      {this.description,
      this.options,
      this.customRegex,
      QueryType type = QueryType.basic,
      this.qualifierQuery = true})
      : this.type = customRegex != null ? QueryType.custom : type {
    if (type == QueryType.bool && options == null)
      options = {'true': '', '"false"': ''};
  }

  void addOptions(Map<String, String> options) {
    if (this.options == null) this.options = {};

    this.options!.addAll(options);
  }
}

enum QueryType { basic, spacedString, date, number, user, org, bool, custom }

enum SearchType {
  repositories,
  // topics,
  // code,
  // commits,
  issues_pulls,
  // discussions,
  users,
  // packages,
  // wiki
}

final searchTypeValues = EnumValues({
  "Repositories": SearchType.repositories,
  // "Topics": SearchType.topics,
  // "Code": SearchType.code,
  // "Commits": SearchType.commits,
  "Issues and Pulls Requests": SearchType.issues_pulls,
  // "Discussions": SearchType.discussions,
  "Users": SearchType.users,
  // "Packages": SearchType.packages,
  // "Wiki": SearchType.wiki,
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
