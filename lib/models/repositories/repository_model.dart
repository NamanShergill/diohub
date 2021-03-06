import 'package:onehub/models/users/user_info_model.dart';

class RepositoryModel {
  int id;
  String nodeId;
  String name;
  String fullName;
  UserInfoModel owner;
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
  int forks;
  int stargazersCount;
  int watchersCount;
  int watchers;
  int size;
  String defaultBranch;
  int openIssuesCount;
  int openIssues;
  bool isTemplate;
  List<String> topics;
  bool hasIssues;
  bool hasProjects;
  bool hasWiki;
  bool hasPages;
  bool hasDownloads;
  bool archived;
  bool disabled;
  String visibility;
  String pushedAt;
  String createdAt;
  String updatedAt;
  Permissions permissions;
  bool allowRebaseMerge;
  TemplateRepository templateRepository;
  String tempCloneToken;
  bool allowSquashMerge;
  bool deleteBranchOnMerge;
  bool allowMergeCommit;
  int subscribersCount;
  int networkCount;
  License license;
  UserInfoModel organization;
  TemplateRepository parent;
  TemplateRepository source;

  RepositoryModel(
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
      this.forks,
      this.stargazersCount,
      this.watchersCount,
      this.watchers,
      this.size,
      this.defaultBranch,
      this.openIssuesCount,
      this.openIssues,
      this.isTemplate,
      this.topics,
      this.hasIssues,
      this.hasProjects,
      this.hasWiki,
      this.hasPages,
      this.hasDownloads,
      this.archived,
      this.disabled,
      this.visibility,
      this.pushedAt,
      this.createdAt,
      this.updatedAt,
      this.permissions,
      this.allowRebaseMerge,
      this.templateRepository,
      this.tempCloneToken,
      this.allowSquashMerge,
      this.deleteBranchOnMerge,
      this.allowMergeCommit,
      this.subscribersCount,
      this.networkCount,
      this.license,
      this.organization,
      this.parent,
      this.source});

  RepositoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    owner = json['owner'] != null
        ? new UserInfoModel.fromJson(json['owner'])
        : null;
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
    forks = json['forks'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    watchers = json['watchers'];
    size = json['size'];
    defaultBranch = json['default_branch'];
    openIssuesCount = json['open_issues_count'];
    openIssues = json['open_issues'];
    isTemplate = json['is_template'];
    topics = json['topics'] != null ? json['topics'].cast<String>() : null;
    hasIssues = json['has_issues'];
    hasProjects = json['has_projects'];
    hasWiki = json['has_wiki'];
    hasPages = json['has_pages'];
    hasDownloads = json['has_downloads'];
    archived = json['archived'];
    disabled = json['disabled'];
    visibility = json['visibility'];
    pushedAt = json['pushed_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    permissions = json['permissions'] != null
        ? new Permissions.fromJson(json['permissions'])
        : null;
    allowRebaseMerge = json['allow_rebase_merge'];
    templateRepository = json['template_repository'] != null
        ? new TemplateRepository.fromJson(json['template_repository'])
        : null;
    tempCloneToken = json['temp_clone_token'];
    allowSquashMerge = json['allow_squash_merge'];
    deleteBranchOnMerge = json['delete_branch_on_merge'];
    allowMergeCommit = json['allow_merge_commit'];
    subscribersCount = json['subscribers_count'];
    networkCount = json['network_count'];
    license =
        json['license'] != null ? new License.fromJson(json['license']) : null;
    organization = json['organization'] != null
        ? new UserInfoModel.fromJson(json['organization'])
        : null;
    parent = json['parent'] != null
        ? new TemplateRepository.fromJson(json['parent'])
        : null;
    source = json['source'] != null
        ? new TemplateRepository.fromJson(json['source'])
        : null;
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
    data['forks'] = this.forks;
    data['stargazers_count'] = this.stargazersCount;
    data['watchers_count'] = this.watchersCount;
    data['watchers'] = this.watchers;
    data['size'] = this.size;
    data['default_branch'] = this.defaultBranch;
    data['open_issues_count'] = this.openIssuesCount;
    data['open_issues'] = this.openIssues;
    data['is_template'] = this.isTemplate;
    data['topics'] = this.topics;
    data['has_issues'] = this.hasIssues;
    data['has_projects'] = this.hasProjects;
    data['has_wiki'] = this.hasWiki;
    data['has_pages'] = this.hasPages;
    data['has_downloads'] = this.hasDownloads;
    data['archived'] = this.archived;
    data['disabled'] = this.disabled;
    data['visibility'] = this.visibility;
    data['pushed_at'] = this.pushedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.permissions != null) {
      data['permissions'] = this.permissions.toJson();
    }
    data['allow_rebase_merge'] = this.allowRebaseMerge;
    if (this.templateRepository != null) {
      data['template_repository'] = this.templateRepository.toJson();
    }
    data['temp_clone_token'] = this.tempCloneToken;
    data['allow_squash_merge'] = this.allowSquashMerge;
    data['delete_branch_on_merge'] = this.deleteBranchOnMerge;
    data['allow_merge_commit'] = this.allowMergeCommit;
    data['subscribers_count'] = this.subscribersCount;
    data['network_count'] = this.networkCount;
    if (this.license != null) {
      data['license'] = this.license.toJson();
    }
    if (this.organization != null) {
      data['organization'] = this.organization.toJson();
    }
    if (this.parent != null) {
      data['parent'] = this.parent.toJson();
    }
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    return data;
  }
}

class Permissions {
  bool pull;
  bool push;
  bool admin;

  Permissions({this.pull, this.push, this.admin});

  Permissions.fromJson(Map<String, dynamic> json) {
    pull = json['pull'];
    push = json['push'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pull'] = this.pull;
    data['push'] = this.push;
    data['admin'] = this.admin;
    return data;
  }
}

class TemplateRepository {
  int id;
  String nodeId;
  String name;
  String fullName;
  UserInfoModel owner;
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
  int forks;
  int forksCount;
  int stargazersCount;
  int watchersCount;
  int watchers;
  int size;
  String defaultBranch;
  int openIssues;
  int openIssuesCount;
  bool isTemplate;
  License license;
  List<String> topics;
  bool hasIssues;
  bool hasProjects;
  bool hasWiki;
  bool hasPages;
  bool hasDownloads;
  bool archived;
  bool disabled;
  String visibility;
  String pushedAt;
  String createdAt;
  String updatedAt;
  Permissions permissions;
  bool allowRebaseMerge;
  String tempCloneToken;
  bool allowSquashMerge;
  bool deleteBranchOnMerge;
  bool allowMergeCommit;
  int subscribersCount;
  int networkCount;

  TemplateRepository(
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
      this.forks,
      this.forksCount,
      this.stargazersCount,
      this.watchersCount,
      this.watchers,
      this.size,
      this.defaultBranch,
      this.openIssues,
      this.openIssuesCount,
      this.isTemplate,
      this.license,
      this.topics,
      this.hasIssues,
      this.hasProjects,
      this.hasWiki,
      this.hasPages,
      this.hasDownloads,
      this.archived,
      this.disabled,
      this.visibility,
      this.pushedAt,
      this.createdAt,
      this.updatedAt,
      this.permissions,
      this.allowRebaseMerge,
      this.tempCloneToken,
      this.allowSquashMerge,
      this.deleteBranchOnMerge,
      this.allowMergeCommit,
      this.subscribersCount,
      this.networkCount});

  TemplateRepository.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    owner = json['owner'] != null
        ? new UserInfoModel.fromJson(json['owner'])
        : null;
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
    forks = json['forks'];
    forksCount = json['forks_count'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    watchers = json['watchers'];
    size = json['size'];
    defaultBranch = json['default_branch'];
    openIssues = json['open_issues'];
    openIssuesCount = json['open_issues_count'];
    isTemplate = json['is_template'];
    license =
        json['license'] != null ? new License.fromJson(json['license']) : null;
    topics = json['topics'].cast<String>();
    hasIssues = json['has_issues'];
    hasProjects = json['has_projects'];
    hasWiki = json['has_wiki'];
    hasPages = json['has_pages'];
    hasDownloads = json['has_downloads'];
    archived = json['archived'];
    disabled = json['disabled'];
    visibility = json['visibility'];
    pushedAt = json['pushed_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    permissions = json['permissions'] != null
        ? new Permissions.fromJson(json['permissions'])
        : null;
    allowRebaseMerge = json['allow_rebase_merge'];
    tempCloneToken = json['temp_clone_token'];
    allowSquashMerge = json['allow_squash_merge'];
    deleteBranchOnMerge = json['delete_branch_on_merge'];
    allowMergeCommit = json['allow_merge_commit'];
    subscribersCount = json['subscribers_count'];
    networkCount = json['network_count'];
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
    data['forks'] = this.forks;
    data['forks_count'] = this.forksCount;
    data['stargazers_count'] = this.stargazersCount;
    data['watchers_count'] = this.watchersCount;
    data['watchers'] = this.watchers;
    data['size'] = this.size;
    data['default_branch'] = this.defaultBranch;
    data['open_issues'] = this.openIssues;
    data['open_issues_count'] = this.openIssuesCount;
    data['is_template'] = this.isTemplate;
    if (this.license != null) {
      data['license'] = this.license.toJson();
    }
    data['topics'] = this.topics;
    data['has_issues'] = this.hasIssues;
    data['has_projects'] = this.hasProjects;
    data['has_wiki'] = this.hasWiki;
    data['has_pages'] = this.hasPages;
    data['has_downloads'] = this.hasDownloads;
    data['archived'] = this.archived;
    data['disabled'] = this.disabled;
    data['visibility'] = this.visibility;
    data['pushed_at'] = this.pushedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.permissions != null) {
      data['permissions'] = this.permissions.toJson();
    }
    data['allow_rebase_merge'] = this.allowRebaseMerge;
    data['temp_clone_token'] = this.tempCloneToken;
    data['allow_squash_merge'] = this.allowSquashMerge;
    data['delete_branch_on_merge'] = this.deleteBranchOnMerge;
    data['allow_merge_commit'] = this.allowMergeCommit;
    data['subscribers_count'] = this.subscribersCount;
    data['network_count'] = this.networkCount;
    return data;
  }
}

class License {
  String key;
  String name;
  String url;
  String spdxId;
  String nodeId;
  String htmlUrl;

  License(
      {this.key, this.name, this.url, this.spdxId, this.nodeId, this.htmlUrl});

  License.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    url = json['url'];
    spdxId = json['spdx_id'];
    nodeId = json['node_id'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['name'] = this.name;
    data['url'] = this.url;
    data['spdx_id'] = this.spdxId;
    data['node_id'] = this.nodeId;
    data['html_url'] = this.htmlUrl;
    return data;
  }
}
