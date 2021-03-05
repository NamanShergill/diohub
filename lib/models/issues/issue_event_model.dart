class IssueEventModel {
  int id;
  String nodeId;
  String url;
  Actor actor;
  String event;
  //Todo: Is it going to be int?
  Null commitId;
  String commitUrl;
  String createdAt;
  Actor assignee;
  Actor assigner;
  bool performedViaGithubApp;

  IssueEventModel(
      {this.id,
      this.nodeId,
      this.url,
      this.actor,
      this.event,
      this.commitId,
      this.commitUrl,
      this.createdAt,
      this.assignee,
      this.assigner,
      this.performedViaGithubApp});

  IssueEventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    url = json['url'];
    actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
    event = json['event'];
    commitId = json['commit_id'];
    commitUrl = json['commit_url'];
    createdAt = json['created_at'];
    assignee =
        json['assignee'] != null ? new Actor.fromJson(json['assignee']) : null;
    assigner =
        json['assigner'] != null ? new Actor.fromJson(json['assigner']) : null;
    performedViaGithubApp = json['performed_via_github_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['url'] = this.url;
    if (this.actor != null) {
      data['actor'] = this.actor.toJson();
    }
    data['event'] = this.event;
    data['commit_id'] = this.commitId;
    data['commit_url'] = this.commitUrl;
    data['created_at'] = this.createdAt;
    if (this.assignee != null) {
      data['assignee'] = this.assignee.toJson();
    }
    if (this.assigner != null) {
      data['assigner'] = this.assigner.toJson();
    }
    data['performed_via_github_app'] = this.performedViaGithubApp;
    return data;
  }
}

class Actor {
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

  Actor(
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

  Actor.fromJson(Map<String, dynamic> json) {
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
