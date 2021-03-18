// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

class NotificationModel {
  NotificationModel({
    this.id,
    this.unread,
    this.reason,
    this.updatedAt,
    this.lastReadAt,
    this.subject,
    this.repository,
    this.url,
    this.subscriptionUrl,
  });

  String? id;
  bool? unread;
  String? reason;
  DateTime? updatedAt;
  DateTime? lastReadAt;
  Subject? subject;
  Repository? repository;
  String? url;
  String? subscriptionUrl;

  NotificationModel copyWith({
    String? id,
    bool? unread,
    String? reason,
    DateTime? updatedAt,
    DateTime? lastReadAt,
    Subject? subject,
    Repository? repository,
    String? url,
    String? subscriptionUrl,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        unread: unread ?? this.unread,
        reason: reason ?? this.reason,
        updatedAt: updatedAt ?? this.updatedAt,
        lastReadAt: lastReadAt ?? this.lastReadAt,
        subject: subject ?? this.subject,
        repository: repository ?? this.repository,
        url: url ?? this.url,
        subscriptionUrl: subscriptionUrl ?? this.subscriptionUrl,
      );

  factory NotificationModel.fromRawJson(String str) =>
      NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"] == null ? null : json["id"],
        unread: json["unread"] == null ? null : json["unread"],
        reason: json["reason"] == null ? null : json["reason"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lastReadAt: json["last_read_at"] == null
            ? null
            : DateTime.parse(json["last_read_at"]),
        subject:
            json["subject"] == null ? null : Subject.fromJson(json["subject"]),
        repository: json["repository"] == null
            ? null
            : Repository.fromJson(json["repository"]),
        url: json["url"] == null ? null : json["url"],
        subscriptionUrl:
            json["subscription_url"] == null ? null : json["subscription_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "unread": unread == null ? null : unread,
        "reason": reason == null ? null : reason,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "last_read_at":
            lastReadAt == null ? null : lastReadAt!.toIso8601String(),
        "subject": subject == null ? null : subject!.toJson(),
        "repository": repository == null ? null : repository!.toJson(),
        "url": url == null ? null : url,
        "subscription_url": subscriptionUrl == null ? null : subscriptionUrl,
      };
}

class Repository {
  Repository({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
  });

  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  Owner? owner;
  String? htmlUrl;
  String? description;
  bool? fork;
  String? url;
  String? forksUrl;
  String? keysUrl;
  String? collaboratorsUrl;
  String? teamsUrl;
  String? hooksUrl;
  String? issueEventsUrl;
  String? eventsUrl;
  String? assigneesUrl;
  String? branchesUrl;
  String? tagsUrl;
  String? blobsUrl;
  String? gitTagsUrl;
  String? gitRefsUrl;
  String? treesUrl;
  String? statusesUrl;
  String? languagesUrl;
  String? stargazersUrl;
  String? contributorsUrl;
  String? subscribersUrl;
  String? subscriptionUrl;
  String? commitsUrl;
  String? gitCommitsUrl;
  String? commentsUrl;
  String? issueCommentUrl;
  String? contentsUrl;
  String? compareUrl;
  String? mergesUrl;
  String? archiveUrl;
  String? downloadsUrl;
  String? issuesUrl;
  String? pullsUrl;
  String? milestonesUrl;
  String? notificationsUrl;
  String? labelsUrl;
  String? releasesUrl;
  String? deploymentsUrl;

  Repository copyWith({
    int? id,
    String? nodeId,
    String? name,
    String? fullName,
    bool? private,
    Owner? owner,
    String? htmlUrl,
    String? description,
    bool? fork,
    String? url,
    String? forksUrl,
    String? keysUrl,
    String? collaboratorsUrl,
    String? teamsUrl,
    String? hooksUrl,
    String? issueEventsUrl,
    String? eventsUrl,
    String? assigneesUrl,
    String? branchesUrl,
    String? tagsUrl,
    String? blobsUrl,
    String? gitTagsUrl,
    String? gitRefsUrl,
    String? treesUrl,
    String? statusesUrl,
    String? languagesUrl,
    String? stargazersUrl,
    String? contributorsUrl,
    String? subscribersUrl,
    String? subscriptionUrl,
    String? commitsUrl,
    String? gitCommitsUrl,
    String? commentsUrl,
    String? issueCommentUrl,
    String? contentsUrl,
    String? compareUrl,
    String? mergesUrl,
    String? archiveUrl,
    String? downloadsUrl,
    String? issuesUrl,
    String? pullsUrl,
    String? milestonesUrl,
    String? notificationsUrl,
    String? labelsUrl,
    String? releasesUrl,
    String? deploymentsUrl,
  }) =>
      Repository(
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        private: private ?? this.private,
        owner: owner ?? this.owner,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        description: description ?? this.description,
        fork: fork ?? this.fork,
        url: url ?? this.url,
        forksUrl: forksUrl ?? this.forksUrl,
        keysUrl: keysUrl ?? this.keysUrl,
        collaboratorsUrl: collaboratorsUrl ?? this.collaboratorsUrl,
        teamsUrl: teamsUrl ?? this.teamsUrl,
        hooksUrl: hooksUrl ?? this.hooksUrl,
        issueEventsUrl: issueEventsUrl ?? this.issueEventsUrl,
        eventsUrl: eventsUrl ?? this.eventsUrl,
        assigneesUrl: assigneesUrl ?? this.assigneesUrl,
        branchesUrl: branchesUrl ?? this.branchesUrl,
        tagsUrl: tagsUrl ?? this.tagsUrl,
        blobsUrl: blobsUrl ?? this.blobsUrl,
        gitTagsUrl: gitTagsUrl ?? this.gitTagsUrl,
        gitRefsUrl: gitRefsUrl ?? this.gitRefsUrl,
        treesUrl: treesUrl ?? this.treesUrl,
        statusesUrl: statusesUrl ?? this.statusesUrl,
        languagesUrl: languagesUrl ?? this.languagesUrl,
        stargazersUrl: stargazersUrl ?? this.stargazersUrl,
        contributorsUrl: contributorsUrl ?? this.contributorsUrl,
        subscribersUrl: subscribersUrl ?? this.subscribersUrl,
        subscriptionUrl: subscriptionUrl ?? this.subscriptionUrl,
        commitsUrl: commitsUrl ?? this.commitsUrl,
        gitCommitsUrl: gitCommitsUrl ?? this.gitCommitsUrl,
        commentsUrl: commentsUrl ?? this.commentsUrl,
        issueCommentUrl: issueCommentUrl ?? this.issueCommentUrl,
        contentsUrl: contentsUrl ?? this.contentsUrl,
        compareUrl: compareUrl ?? this.compareUrl,
        mergesUrl: mergesUrl ?? this.mergesUrl,
        archiveUrl: archiveUrl ?? this.archiveUrl,
        downloadsUrl: downloadsUrl ?? this.downloadsUrl,
        issuesUrl: issuesUrl ?? this.issuesUrl,
        pullsUrl: pullsUrl ?? this.pullsUrl,
        milestonesUrl: milestonesUrl ?? this.milestonesUrl,
        notificationsUrl: notificationsUrl ?? this.notificationsUrl,
        labelsUrl: labelsUrl ?? this.labelsUrl,
        releasesUrl: releasesUrl ?? this.releasesUrl,
        deploymentsUrl: deploymentsUrl ?? this.deploymentsUrl,
      );

  factory Repository.fromRawJson(String str) =>
      Repository.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Repository.fromJson(Map<String, dynamic> json) => Repository(
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        name: json["name"] == null ? null : json["name"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        private: json["private"] == null ? null : json["private"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        description: json["description"] == null ? null : json["description"],
        fork: json["fork"] == null ? null : json["fork"],
        url: json["url"] == null ? null : json["url"],
        forksUrl: json["forks_url"] == null ? null : json["forks_url"],
        keysUrl: json["keys_url"] == null ? null : json["keys_url"],
        collaboratorsUrl: json["collaborators_url"] == null
            ? null
            : json["collaborators_url"],
        teamsUrl: json["teams_url"] == null ? null : json["teams_url"],
        hooksUrl: json["hooks_url"] == null ? null : json["hooks_url"],
        issueEventsUrl:
            json["issue_events_url"] == null ? null : json["issue_events_url"],
        eventsUrl: json["events_url"] == null ? null : json["events_url"],
        assigneesUrl:
            json["assignees_url"] == null ? null : json["assignees_url"],
        branchesUrl: json["branches_url"] == null ? null : json["branches_url"],
        tagsUrl: json["tags_url"] == null ? null : json["tags_url"],
        blobsUrl: json["blobs_url"] == null ? null : json["blobs_url"],
        gitTagsUrl: json["git_tags_url"] == null ? null : json["git_tags_url"],
        gitRefsUrl: json["git_refs_url"] == null ? null : json["git_refs_url"],
        treesUrl: json["trees_url"] == null ? null : json["trees_url"],
        statusesUrl: json["statuses_url"] == null ? null : json["statuses_url"],
        languagesUrl:
            json["languages_url"] == null ? null : json["languages_url"],
        stargazersUrl:
            json["stargazers_url"] == null ? null : json["stargazers_url"],
        contributorsUrl:
            json["contributors_url"] == null ? null : json["contributors_url"],
        subscribersUrl:
            json["subscribers_url"] == null ? null : json["subscribers_url"],
        subscriptionUrl:
            json["subscription_url"] == null ? null : json["subscription_url"],
        commitsUrl: json["commits_url"] == null ? null : json["commits_url"],
        gitCommitsUrl:
            json["git_commits_url"] == null ? null : json["git_commits_url"],
        commentsUrl: json["comments_url"] == null ? null : json["comments_url"],
        issueCommentUrl: json["issue_comment_url"] == null
            ? null
            : json["issue_comment_url"],
        contentsUrl: json["contents_url"] == null ? null : json["contents_url"],
        compareUrl: json["compare_url"] == null ? null : json["compare_url"],
        mergesUrl: json["merges_url"] == null ? null : json["merges_url"],
        archiveUrl: json["archive_url"] == null ? null : json["archive_url"],
        downloadsUrl:
            json["downloads_url"] == null ? null : json["downloads_url"],
        issuesUrl: json["issues_url"] == null ? null : json["issues_url"],
        pullsUrl: json["pulls_url"] == null ? null : json["pulls_url"],
        milestonesUrl:
            json["milestones_url"] == null ? null : json["milestones_url"],
        notificationsUrl: json["notifications_url"] == null
            ? null
            : json["notifications_url"],
        labelsUrl: json["labels_url"] == null ? null : json["labels_url"],
        releasesUrl: json["releases_url"] == null ? null : json["releases_url"],
        deploymentsUrl:
            json["deployments_url"] == null ? null : json["deployments_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "name": name == null ? null : name,
        "full_name": fullName == null ? null : fullName,
        "private": private == null ? null : private,
        "owner": owner == null ? null : owner!.toJson(),
        "html_url": htmlUrl == null ? null : htmlUrl,
        "description": description == null ? null : description,
        "fork": fork == null ? null : fork,
        "url": url == null ? null : url,
        "forks_url": forksUrl == null ? null : forksUrl,
        "keys_url": keysUrl == null ? null : keysUrl,
        "collaborators_url": collaboratorsUrl == null ? null : collaboratorsUrl,
        "teams_url": teamsUrl == null ? null : teamsUrl,
        "hooks_url": hooksUrl == null ? null : hooksUrl,
        "issue_events_url": issueEventsUrl == null ? null : issueEventsUrl,
        "events_url": eventsUrl == null ? null : eventsUrl,
        "assignees_url": assigneesUrl == null ? null : assigneesUrl,
        "branches_url": branchesUrl == null ? null : branchesUrl,
        "tags_url": tagsUrl == null ? null : tagsUrl,
        "blobs_url": blobsUrl == null ? null : blobsUrl,
        "git_tags_url": gitTagsUrl == null ? null : gitTagsUrl,
        "git_refs_url": gitRefsUrl == null ? null : gitRefsUrl,
        "trees_url": treesUrl == null ? null : treesUrl,
        "statuses_url": statusesUrl == null ? null : statusesUrl,
        "languages_url": languagesUrl == null ? null : languagesUrl,
        "stargazers_url": stargazersUrl == null ? null : stargazersUrl,
        "contributors_url": contributorsUrl == null ? null : contributorsUrl,
        "subscribers_url": subscribersUrl == null ? null : subscribersUrl,
        "subscription_url": subscriptionUrl == null ? null : subscriptionUrl,
        "commits_url": commitsUrl == null ? null : commitsUrl,
        "git_commits_url": gitCommitsUrl == null ? null : gitCommitsUrl,
        "comments_url": commentsUrl == null ? null : commentsUrl,
        "issue_comment_url": issueCommentUrl == null ? null : issueCommentUrl,
        "contents_url": contentsUrl == null ? null : contentsUrl,
        "compare_url": compareUrl == null ? null : compareUrl,
        "merges_url": mergesUrl == null ? null : mergesUrl,
        "archive_url": archiveUrl == null ? null : archiveUrl,
        "downloads_url": downloadsUrl == null ? null : downloadsUrl,
        "issues_url": issuesUrl == null ? null : issuesUrl,
        "pulls_url": pullsUrl == null ? null : pullsUrl,
        "milestones_url": milestonesUrl == null ? null : milestonesUrl,
        "notifications_url": notificationsUrl == null ? null : notificationsUrl,
        "labels_url": labelsUrl == null ? null : labelsUrl,
        "releases_url": releasesUrl == null ? null : releasesUrl,
        "deployments_url": deploymentsUrl == null ? null : deploymentsUrl,
      };
}

class Owner {
  Owner({
    this.login,
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
    this.siteAdmin,
  });

  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  OwnerType? type;
  bool? siteAdmin;

  Owner copyWith({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    OwnerType? type,
    bool? siteAdmin,
  }) =>
      Owner(
        login: login ?? this.login,
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        gravatarId: gravatarId ?? this.gravatarId,
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        followersUrl: followersUrl ?? this.followersUrl,
        followingUrl: followingUrl ?? this.followingUrl,
        gistsUrl: gistsUrl ?? this.gistsUrl,
        starredUrl: starredUrl ?? this.starredUrl,
        subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
        organizationsUrl: organizationsUrl ?? this.organizationsUrl,
        reposUrl: reposUrl ?? this.reposUrl,
        eventsUrl: eventsUrl ?? this.eventsUrl,
        receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
        type: type ?? this.type,
        siteAdmin: siteAdmin ?? this.siteAdmin,
      );

  factory Owner.fromRawJson(String str) => Owner.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"] == null ? null : json["login"],
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        gravatarId: json["gravatar_id"] == null ? null : json["gravatar_id"],
        url: json["url"] == null ? null : json["url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        followersUrl:
            json["followers_url"] == null ? null : json["followers_url"],
        followingUrl:
            json["following_url"] == null ? null : json["following_url"],
        gistsUrl: json["gists_url"] == null ? null : json["gists_url"],
        starredUrl: json["starred_url"] == null ? null : json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"] == null
            ? null
            : json["subscriptions_url"],
        organizationsUrl: json["organizations_url"] == null
            ? null
            : json["organizations_url"],
        reposUrl: json["repos_url"] == null ? null : json["repos_url"],
        eventsUrl: json["events_url"] == null ? null : json["events_url"],
        receivedEventsUrl: json["received_events_url"] == null
            ? null
            : json["received_events_url"],
        type: json["type"] == null ? null : ownerTypeValues.map[json["type"]],
        siteAdmin: json["site_admin"] == null ? null : json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login == null ? null : login,
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "gravatar_id": gravatarId == null ? null : gravatarId,
        "url": url == null ? null : url,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "followers_url": followersUrl == null ? null : followersUrl,
        "following_url": followingUrl == null ? null : followingUrl,
        "gists_url": gistsUrl == null ? null : gistsUrl,
        "starred_url": starredUrl == null ? null : starredUrl,
        "subscriptions_url": subscriptionsUrl == null ? null : subscriptionsUrl,
        "organizations_url": organizationsUrl == null ? null : organizationsUrl,
        "repos_url": reposUrl == null ? null : reposUrl,
        "events_url": eventsUrl == null ? null : eventsUrl,
        "received_events_url":
            receivedEventsUrl == null ? null : receivedEventsUrl,
        "type": type == null ? null : ownerTypeValues.reverse![type!],
        "site_admin": siteAdmin == null ? null : siteAdmin,
      };
}

enum OwnerType { ORGANIZATION, USER }

final ownerTypeValues = EnumValues(
    {"Organization": OwnerType.ORGANIZATION, "User": OwnerType.USER});

class Subject {
  Subject({
    this.title,
    this.url,
    this.latestCommentUrl,
    this.type,
  });

  String? title;
  String? url;
  String? latestCommentUrl;
  SubjectType? type;

  Subject copyWith({
    String? title,
    String? url,
    String? latestCommentUrl,
    SubjectType? type,
  }) =>
      Subject(
        title: title ?? this.title,
        url: url ?? this.url,
        latestCommentUrl: latestCommentUrl ?? this.latestCommentUrl,
        type: type ?? this.type,
      );

  factory Subject.fromRawJson(String str) => Subject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
        latestCommentUrl: json["latest_comment_url"] == null
            ? null
            : json["latest_comment_url"],
        type: json["type"] == null ? null : subjectTypeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "latest_comment_url":
            latestCommentUrl == null ? null : latestCommentUrl,
        "type": type == null ? null : subjectTypeValues.reverse![type!],
      };
}

enum SubjectType { ISSUE, PULL_REQUEST }

final subjectTypeValues = EnumValues(
    {"Issue": SubjectType.ISSUE, "PullRequest": SubjectType.PULL_REQUEST});

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
