class PullRequestModel {
  String url;
  int id;
  String nodeId;
  String htmlUrl;
  String diffUrl;
  String patchUrl;
  String issueUrl;
  String commitsUrl;
  String reviewCommentsUrl;
  String reviewCommentUrl;
  String commentsUrl;
  String statusesUrl;
  int number;
  String state;
  bool locked;
  String title;
  User user;
  String body;
  List<Labels> labels;
  Milestone milestone;
  String activeLockReason;
  String createdAt;
  String updatedAt;
  String closedAt;
  String mergedAt;
  String mergeCommitSha;
  User assignee;
  List<User> assignees;
  List<User> requestedReviewers;
  List<RequestedTeams> requestedTeams;
  Head head;
  Head base;
  Links lLinks;
  String authorAssociation;
  Null autoMerge;
  bool draft;
  bool merged;
  bool mergeable;
  bool rebaseable;
  String mergeableState;
  User mergedBy;
  int comments;
  int reviewComments;
  bool maintainerCanModify;
  int commits;
  int additions;
  int deletions;
  int changedFiles;

  PullRequestModel(
      {this.url,
      this.id,
      this.nodeId,
      this.htmlUrl,
      this.diffUrl,
      this.patchUrl,
      this.issueUrl,
      this.commitsUrl,
      this.reviewCommentsUrl,
      this.reviewCommentUrl,
      this.commentsUrl,
      this.statusesUrl,
      this.number,
      this.state,
      this.locked,
      this.title,
      this.user,
      this.body,
      this.labels,
      this.milestone,
      this.activeLockReason,
      this.createdAt,
      this.updatedAt,
      this.closedAt,
      this.mergedAt,
      this.mergeCommitSha,
      this.assignee,
      this.assignees,
      this.requestedReviewers,
      this.requestedTeams,
      this.head,
      this.base,
      this.lLinks,
      this.authorAssociation,
      this.autoMerge,
      this.draft,
      this.merged,
      this.mergeable,
      this.rebaseable,
      this.mergeableState,
      this.mergedBy,
      this.comments,
      this.reviewComments,
      this.maintainerCanModify,
      this.commits,
      this.additions,
      this.deletions,
      this.changedFiles});

  PullRequestModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
    nodeId = json['node_id'];
    htmlUrl = json['html_url'];
    diffUrl = json['diff_url'];
    patchUrl = json['patch_url'];
    issueUrl = json['issue_url'];
    commitsUrl = json['commits_url'];
    reviewCommentsUrl = json['review_comments_url'];
    reviewCommentUrl = json['review_comment_url'];
    commentsUrl = json['comments_url'];
    statusesUrl = json['statuses_url'];
    number = json['number'];
    state = json['state'];
    locked = json['locked'];
    title = json['title'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    body = json['body'];
    if (json['labels'] != null) {
      // ignore: deprecated_member_use
      labels = new List<Labels>();
      json['labels'].forEach((v) {
        labels.add(new Labels.fromJson(v));
      });
    }
    milestone = json['milestone'] != null
        ? new Milestone.fromJson(json['milestone'])
        : null;
    activeLockReason = json['active_lock_reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    closedAt = json['closed_at'];
    mergedAt = json['merged_at'];
    mergeCommitSha = json['merge_commit_sha'];
    assignee =
        json['assignee'] != null ? new User.fromJson(json['assignee']) : null;
    if (json['assignees'] != null) {
      // ignore: deprecated_member_use
      assignees = new List<User>();
      json['assignees'].forEach((v) {
        assignees.add(new User.fromJson(v));
      });
    }
    if (json['requested_reviewers'] != null) {
      // ignore: deprecated_member_use
      requestedReviewers = new List<User>();
      json['requested_reviewers'].forEach((v) {
        requestedReviewers.add(new User.fromJson(v));
      });
    }
    if (json['requested_teams'] != null) {
      // ignore: deprecated_member_use
      requestedTeams = new List<RequestedTeams>();
      json['requested_teams'].forEach((v) {
        requestedTeams.add(new RequestedTeams.fromJson(v));
      });
    }
    head = json['head'] != null ? new Head.fromJson(json['head']) : null;
    base = json['base'] != null ? new Head.fromJson(json['base']) : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    authorAssociation = json['author_association'];
    autoMerge = json['auto_merge'];
    draft = json['draft'];
    merged = json['merged'];
    mergeable = json['mergeable'];
    rebaseable = json['rebaseable'];
    mergeableState = json['mergeable_state'];
    mergedBy =
        json['merged_by'] != null ? new User.fromJson(json['merged_by']) : null;
    comments = json['comments'];
    reviewComments = json['review_comments'];
    maintainerCanModify = json['maintainer_can_modify'];
    commits = json['commits'];
    additions = json['additions'];
    deletions = json['deletions'];
    changedFiles = json['changed_files'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['html_url'] = this.htmlUrl;
    data['diff_url'] = this.diffUrl;
    data['patch_url'] = this.patchUrl;
    data['issue_url'] = this.issueUrl;
    data['commits_url'] = this.commitsUrl;
    data['review_comments_url'] = this.reviewCommentsUrl;
    data['review_comment_url'] = this.reviewCommentUrl;
    data['comments_url'] = this.commentsUrl;
    data['statuses_url'] = this.statusesUrl;
    data['number'] = this.number;
    data['state'] = this.state;
    data['locked'] = this.locked;
    data['title'] = this.title;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['body'] = this.body;
    if (this.labels != null) {
      data['labels'] = this.labels.map((v) => v.toJson()).toList();
    }
    if (this.milestone != null) {
      data['milestone'] = this.milestone.toJson();
    }
    data['active_lock_reason'] = this.activeLockReason;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['closed_at'] = this.closedAt;
    data['merged_at'] = this.mergedAt;
    data['merge_commit_sha'] = this.mergeCommitSha;
    if (this.assignee != null) {
      data['assignee'] = this.assignee.toJson();
    }
    if (this.assignees != null) {
      data['assignees'] = this.assignees.map((v) => v.toJson()).toList();
    }
    if (this.requestedReviewers != null) {
      data['requested_reviewers'] =
          this.requestedReviewers.map((v) => v.toJson()).toList();
    }
    if (this.requestedTeams != null) {
      data['requested_teams'] =
          this.requestedTeams.map((v) => v.toJson()).toList();
    }
    if (this.head != null) {
      data['head'] = this.head.toJson();
    }
    if (this.base != null) {
      data['base'] = this.base.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    data['author_association'] = this.authorAssociation;
    data['auto_merge'] = this.autoMerge;
    data['draft'] = this.draft;
    data['merged'] = this.merged;
    data['mergeable'] = this.mergeable;
    data['rebaseable'] = this.rebaseable;
    data['mergeable_state'] = this.mergeableState;
    if (this.mergedBy != null) {
      data['merged_by'] = this.mergedBy.toJson();
    }
    data['comments'] = this.comments;
    data['review_comments'] = this.reviewComments;
    data['maintainer_can_modify'] = this.maintainerCanModify;
    data['commits'] = this.commits;
    data['additions'] = this.additions;
    data['deletions'] = this.deletions;
    data['changed_files'] = this.changedFiles;
    return data;
  }
}

class User {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  User(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin});

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['avatar_url'] = this.avatarUrl;
    data['gravatar_id'] = this.gravatarId;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['followers_url'] = this.followersUrl;
    data['following_url'] = this.followingUrl;
    data['gists_url'] = this.gistsUrl;
    data['starred_url'] = this.starredUrl;
    data['subscriptions_url'] = this.subscriptionsUrl;
    data['organizations_url'] = this.organizationsUrl;
    data['repos_url'] = this.reposUrl;
    data['events_url'] = this.eventsUrl;
    data['received_events_url'] = this.receivedEventsUrl;
    data['type'] = this.type;
    data['site_admin'] = this.siteAdmin;
    return data;
  }
}

class Labels {
  int id;
  String nodeId;
  String url;
  String name;
  String description;
  String color;
  bool defaultBool;

  Labels(
      {this.id,
      this.nodeId,
      this.url,
      this.name,
      this.description,
      this.color,
      this.defaultBool});

  Labels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    url = json['url'];
    name = json['name'];
    description = json['description'];
    color = json['color'];
    defaultBool = json['default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['url'] = this.url;
    data['name'] = this.name;
    data['description'] = this.description;
    data['color'] = this.color;
    data['default'] = this.defaultBool;
    return data;
  }
}

class Milestone {
  String url;
  String htmlUrl;
  String labelsUrl;
  int id;
  String nodeId;
  int number;
  String state;
  String title;
  String description;
  User creator;
  int openIssues;
  int closedIssues;
  String createdAt;
  String updatedAt;
  String closedAt;
  String dueOn;

  Milestone(
      {this.url,
      this.htmlUrl,
      this.labelsUrl,
      this.id,
      this.nodeId,
      this.number,
      this.state,
      this.title,
      this.description,
      this.creator,
      this.openIssues,
      this.closedIssues,
      this.createdAt,
      this.updatedAt,
      this.closedAt,
      this.dueOn});

  Milestone.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    htmlUrl = json['html_url'];
    labelsUrl = json['labels_url'];
    id = json['id'];
    nodeId = json['node_id'];
    number = json['number'];
    state = json['state'];
    title = json['title'];
    description = json['description'];
    creator =
        json['creator'] != null ? new User.fromJson(json['creator']) : null;
    openIssues = json['open_issues'];
    closedIssues = json['closed_issues'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    closedAt = json['closed_at'];
    dueOn = json['due_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['labels_url'] = this.labelsUrl;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['number'] = this.number;
    data['state'] = this.state;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    data['open_issues'] = this.openIssues;
    data['closed_issues'] = this.closedIssues;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['closed_at'] = this.closedAt;
    data['due_on'] = this.dueOn;
    return data;
  }
}

class RequestedTeams {
  int id;
  String nodeId;
  String url;
  String htmlUrl;
  String name;
  String slug;
  String description;
  String privacy;
  String permission;
  String membersUrl;
  String repositoriesUrl;

  RequestedTeams(
      {this.id,
      this.nodeId,
      this.url,
      this.htmlUrl,
      this.name,
      this.slug,
      this.description,
      this.privacy,
      this.permission,
      this.membersUrl,
      this.repositoriesUrl});

  RequestedTeams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    privacy = json['privacy'];
    permission = json['permission'];
    membersUrl = json['members_url'];
    repositoriesUrl = json['repositories_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['privacy'] = this.privacy;
    data['permission'] = this.permission;
    data['members_url'] = this.membersUrl;
    data['repositories_url'] = this.repositoriesUrl;
    return data;
  }
}

class Head {
  String label;
  String ref;
  String sha;
  User user;
  Repo repo;

  Head({this.label, this.ref, this.sha, this.user, this.repo});

  Head.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    ref = json['ref'];
    sha = json['sha'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    repo = json['repo'] != null ? new Repo.fromJson(json['repo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['ref'] = this.ref;
    data['sha'] = this.sha;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.repo != null) {
      data['repo'] = this.repo.toJson();
    }
    return data;
  }
}

class Repo {
  int id;
  String nodeId;
  String name;
  String fullName;
  User owner;
  bool private;
  String htmlUrl;
  String description;
  bool fork;
  String url;
  String archiveUrl;
  String assigneesUrl;
  String blobsUrl;
  String branchesUrl;
  String collaboratorsUrl;
  String commentsUrl;
  String commitsUrl;
  String compareUrl;
  String contentsUrl;
  String contributorsUrl;
  String deploymentsUrl;
  String downloadsUrl;
  String eventsUrl;
  String forksUrl;
  String gitCommitsUrl;
  String gitRefsUrl;
  String gitTagsUrl;
  String gitUrl;
  String issueCommentUrl;
  String issueEventsUrl;
  String issuesUrl;
  String keysUrl;
  String labelsUrl;
  String languagesUrl;
  String mergesUrl;
  String milestonesUrl;
  String notificationsUrl;
  String pullsUrl;
  String releasesUrl;
  String sshUrl;
  String stargazersUrl;
  String statusesUrl;
  String subscribersUrl;
  String subscriptionUrl;
  String tagsUrl;
  String teamsUrl;
  String treesUrl;
  String cloneUrl;
  String mirrorUrl;
  String hooksUrl;
  String svnUrl;
  String homepage;
  String language;
  int forksCount;
  int stargazersCount;
  int watchersCount;
  int size;
  String defaultBranch;
  int openIssuesCount;
  List<String> topics;
  bool hasIssues;
  bool hasProjects;
  bool hasWiki;
  bool hasPages;
  bool hasDownloads;
  bool archived;
  bool disabled;
  String pushedAt;
  String createdAt;
  String updatedAt;
  Permissions permissions;
  bool allowRebaseMerge;
  String tempCloneToken;
  bool allowSquashMerge;
  bool allowMergeCommit;
  int forks;
  int openIssues;
  License license;
  int watchers;

  Repo(
      {this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.owner,
      this.private,
      this.htmlUrl,
      this.description,
      this.fork,
      this.url,
      this.archiveUrl,
      this.assigneesUrl,
      this.blobsUrl,
      this.branchesUrl,
      this.collaboratorsUrl,
      this.commentsUrl,
      this.commitsUrl,
      this.compareUrl,
      this.contentsUrl,
      this.contributorsUrl,
      this.deploymentsUrl,
      this.downloadsUrl,
      this.eventsUrl,
      this.forksUrl,
      this.gitCommitsUrl,
      this.gitRefsUrl,
      this.gitTagsUrl,
      this.gitUrl,
      this.issueCommentUrl,
      this.issueEventsUrl,
      this.issuesUrl,
      this.keysUrl,
      this.labelsUrl,
      this.languagesUrl,
      this.mergesUrl,
      this.milestonesUrl,
      this.notificationsUrl,
      this.pullsUrl,
      this.releasesUrl,
      this.sshUrl,
      this.stargazersUrl,
      this.statusesUrl,
      this.subscribersUrl,
      this.subscriptionUrl,
      this.tagsUrl,
      this.teamsUrl,
      this.treesUrl,
      this.cloneUrl,
      this.mirrorUrl,
      this.hooksUrl,
      this.svnUrl,
      this.homepage,
      this.language,
      this.forksCount,
      this.stargazersCount,
      this.watchersCount,
      this.size,
      this.defaultBranch,
      this.openIssuesCount,
      this.topics,
      this.hasIssues,
      this.hasProjects,
      this.hasWiki,
      this.hasPages,
      this.hasDownloads,
      this.archived,
      this.disabled,
      this.pushedAt,
      this.createdAt,
      this.updatedAt,
      this.permissions,
      this.allowRebaseMerge,
      this.tempCloneToken,
      this.allowSquashMerge,
      this.allowMergeCommit,
      this.forks,
      this.openIssues,
      this.license,
      this.watchers});

  Repo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    owner = json['owner'] != null ? new User.fromJson(json['owner']) : null;
    private = json['private'];
    htmlUrl = json['html_url'];
    description = json['description'];
    fork = json['fork'];
    url = json['url'];
    archiveUrl = json['archive_url'];
    assigneesUrl = json['assignees_url'];
    blobsUrl = json['blobs_url'];
    branchesUrl = json['branches_url'];
    collaboratorsUrl = json['collaborators_url'];
    commentsUrl = json['comments_url'];
    commitsUrl = json['commits_url'];
    compareUrl = json['compare_url'];
    contentsUrl = json['contents_url'];
    contributorsUrl = json['contributors_url'];
    deploymentsUrl = json['deployments_url'];
    downloadsUrl = json['downloads_url'];
    eventsUrl = json['events_url'];
    forksUrl = json['forks_url'];
    gitCommitsUrl = json['git_commits_url'];
    gitRefsUrl = json['git_refs_url'];
    gitTagsUrl = json['git_tags_url'];
    gitUrl = json['git_url'];
    issueCommentUrl = json['issue_comment_url'];
    issueEventsUrl = json['issue_events_url'];
    issuesUrl = json['issues_url'];
    keysUrl = json['keys_url'];
    labelsUrl = json['labels_url'];
    languagesUrl = json['languages_url'];
    mergesUrl = json['merges_url'];
    milestonesUrl = json['milestones_url'];
    notificationsUrl = json['notifications_url'];
    pullsUrl = json['pulls_url'];
    releasesUrl = json['releases_url'];
    sshUrl = json['ssh_url'];
    stargazersUrl = json['stargazers_url'];
    statusesUrl = json['statuses_url'];
    subscribersUrl = json['subscribers_url'];
    subscriptionUrl = json['subscription_url'];
    tagsUrl = json['tags_url'];
    teamsUrl = json['teams_url'];
    treesUrl = json['trees_url'];
    cloneUrl = json['clone_url'];
    mirrorUrl = json['mirror_url'];
    hooksUrl = json['hooks_url'];
    svnUrl = json['svn_url'];
    homepage = json['homepage'];
    language = json['language'];
    forksCount = json['forks_count'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    size = json['size'];
    defaultBranch = json['default_branch'];
    openIssuesCount = json['open_issues_count'];
    hasIssues = json['has_issues'];
    hasProjects = json['has_projects'];
    hasWiki = json['has_wiki'];
    hasPages = json['has_pages'];
    hasDownloads = json['has_downloads'];
    archived = json['archived'];
    disabled = json['disabled'];
    pushedAt = json['pushed_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    permissions = json['permissions'] != null
        ? new Permissions.fromJson(json['permissions'])
        : null;
    allowRebaseMerge = json['allow_rebase_merge'];
    tempCloneToken = json['temp_clone_token'];
    allowSquashMerge = json['allow_squash_merge'];
    allowMergeCommit = json['allow_merge_commit'];
    forks = json['forks'];
    openIssues = json['open_issues'];
    license =
        json['license'] != null ? new License.fromJson(json['license']) : null;
    watchers = json['watchers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['private'] = this.private;
    data['html_url'] = this.htmlUrl;
    data['description'] = this.description;
    data['fork'] = this.fork;
    data['url'] = this.url;
    data['archive_url'] = this.archiveUrl;
    data['assignees_url'] = this.assigneesUrl;
    data['blobs_url'] = this.blobsUrl;
    data['branches_url'] = this.branchesUrl;
    data['collaborators_url'] = this.collaboratorsUrl;
    data['comments_url'] = this.commentsUrl;
    data['commits_url'] = this.commitsUrl;
    data['compare_url'] = this.compareUrl;
    data['contents_url'] = this.contentsUrl;
    data['contributors_url'] = this.contributorsUrl;
    data['deployments_url'] = this.deploymentsUrl;
    data['downloads_url'] = this.downloadsUrl;
    data['events_url'] = this.eventsUrl;
    data['forks_url'] = this.forksUrl;
    data['git_commits_url'] = this.gitCommitsUrl;
    data['git_refs_url'] = this.gitRefsUrl;
    data['git_tags_url'] = this.gitTagsUrl;
    data['git_url'] = this.gitUrl;
    data['issue_comment_url'] = this.issueCommentUrl;
    data['issue_events_url'] = this.issueEventsUrl;
    data['issues_url'] = this.issuesUrl;
    data['keys_url'] = this.keysUrl;
    data['labels_url'] = this.labelsUrl;
    data['languages_url'] = this.languagesUrl;
    data['merges_url'] = this.mergesUrl;
    data['milestones_url'] = this.milestonesUrl;
    data['notifications_url'] = this.notificationsUrl;
    data['pulls_url'] = this.pullsUrl;
    data['releases_url'] = this.releasesUrl;
    data['ssh_url'] = this.sshUrl;
    data['stargazers_url'] = this.stargazersUrl;
    data['statuses_url'] = this.statusesUrl;
    data['subscribers_url'] = this.subscribersUrl;
    data['subscription_url'] = this.subscriptionUrl;
    data['tags_url'] = this.tagsUrl;
    data['teams_url'] = this.teamsUrl;
    data['trees_url'] = this.treesUrl;
    data['clone_url'] = this.cloneUrl;
    data['mirror_url'] = this.mirrorUrl;
    data['hooks_url'] = this.hooksUrl;
    data['svn_url'] = this.svnUrl;
    data['homepage'] = this.homepage;
    data['language'] = this.language;
    data['forks_count'] = this.forksCount;
    data['stargazers_count'] = this.stargazersCount;
    data['watchers_count'] = this.watchersCount;
    data['size'] = this.size;
    data['default_branch'] = this.defaultBranch;
    data['open_issues_count'] = this.openIssuesCount;
    data['topics'] = this.topics;
    data['has_issues'] = this.hasIssues;
    data['has_projects'] = this.hasProjects;
    data['has_wiki'] = this.hasWiki;
    data['has_pages'] = this.hasPages;
    data['has_downloads'] = this.hasDownloads;
    data['archived'] = this.archived;
    data['disabled'] = this.disabled;
    data['pushed_at'] = this.pushedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.permissions != null) {
      data['permissions'] = this.permissions.toJson();
    }
    data['allow_rebase_merge'] = this.allowRebaseMerge;
    data['temp_clone_token'] = this.tempCloneToken;
    data['allow_squash_merge'] = this.allowSquashMerge;
    data['allow_merge_commit'] = this.allowMergeCommit;
    data['forks'] = this.forks;
    data['open_issues'] = this.openIssues;
    if (this.license != null) {
      data['license'] = this.license.toJson();
    }
    data['watchers'] = this.watchers;
    return data;
  }
}

class Permissions {
  bool admin;
  bool push;
  bool pull;

  Permissions({this.admin, this.push, this.pull});

  Permissions.fromJson(Map<String, dynamic> json) {
    admin = json['admin'];
    push = json['push'];
    pull = json['pull'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin'] = this.admin;
    data['push'] = this.push;
    data['pull'] = this.pull;
    return data;
  }
}

class License {
  String key;
  String name;
  String url;
  String spdxId;
  String nodeId;

  License({this.key, this.name, this.url, this.spdxId, this.nodeId});

  License.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    url = json['url'];
    spdxId = json['spdx_id'];
    nodeId = json['node_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['name'] = this.name;
    data['url'] = this.url;
    data['spdx_id'] = this.spdxId;
    data['node_id'] = this.nodeId;
    return data;
  }
}

class Links {
  Self self;
  Self html;
  Self issue;
  Self comments;
  Self reviewComments;
  Self reviewComment;
  Self commits;
  Self statuses;

  Links(
      {this.self,
      this.html,
      this.issue,
      this.comments,
      this.reviewComments,
      this.reviewComment,
      this.commits,
      this.statuses});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    html = json['html'] != null ? new Self.fromJson(json['html']) : null;
    issue = json['issue'] != null ? new Self.fromJson(json['issue']) : null;
    comments =
        json['comments'] != null ? new Self.fromJson(json['comments']) : null;
    reviewComments = json['review_comments'] != null
        ? new Self.fromJson(json['review_comments'])
        : null;
    reviewComment = json['review_comment'] != null
        ? new Self.fromJson(json['review_comment'])
        : null;
    commits =
        json['commits'] != null ? new Self.fromJson(json['commits']) : null;
    statuses =
        json['statuses'] != null ? new Self.fromJson(json['statuses']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.toJson();
    }
    if (this.html != null) {
      data['html'] = this.html.toJson();
    }
    if (this.issue != null) {
      data['issue'] = this.issue.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments.toJson();
    }
    if (this.reviewComments != null) {
      data['review_comments'] = this.reviewComments.toJson();
    }
    if (this.reviewComment != null) {
      data['review_comment'] = this.reviewComment.toJson();
    }
    if (this.commits != null) {
      data['commits'] = this.commits.toJson();
    }
    if (this.statuses != null) {
      data['statuses'] = this.statuses.toJson();
    }
    return data;
  }
}

class Self {
  String href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
