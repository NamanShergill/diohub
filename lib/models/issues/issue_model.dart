import 'package:onehub/models/users/user_info_model.dart';

class IssueModel {
  String url;
  String repositoryUrl;
  String labelsUrl;
  String commentsUrl;
  String eventsUrl;
  String htmlUrl;
  int id;
  String nodeId;
  int number;
  String title;
  UserInfoModel user;
  List<Labels> labels;
  String state;
  bool locked;
  UserInfoModel assignee;
  List<UserInfoModel> assignees;
  Milestone milestone;
  int comments;
  String createdAt;
  String updatedAt;
  String closedAt;
  String authorAssociation;
  Null activeLockReason;
  String body;
  UserInfoModel closedBy;
  Null performedViaGithubApp;

  IssueModel(
      {this.url,
      this.repositoryUrl,
      this.labelsUrl,
      this.commentsUrl,
      this.eventsUrl,
      this.htmlUrl,
      this.id,
      this.nodeId,
      this.number,
      this.title,
      this.user,
      this.labels,
      this.state,
      this.locked,
      this.assignee,
      this.assignees,
      this.milestone,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.closedAt,
      this.authorAssociation,
      this.activeLockReason,
      this.body,
      this.closedBy,
      this.performedViaGithubApp});

  IssueModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    repositoryUrl = json['repository_url'];
    labelsUrl = json['labels_url'];
    commentsUrl = json['comments_url'];
    eventsUrl = json['events_url'];
    htmlUrl = json['html_url'];
    id = json['id'];
    nodeId = json['node_id'];
    number = json['number'];
    title = json['title'];
    user =
        json['user'] != null ? new UserInfoModel.fromJson(json['user']) : null;
    if (json['labels'] != null) {
      // ignore: deprecated_member_use
      labels = new List<Labels>();
      json['labels'].forEach((v) {
        labels.add(new Labels.fromJson(v));
      });
    }
    state = json['state'];
    locked = json['locked'];
    assignee = json['assignee'] != null
        ? new UserInfoModel.fromJson(json['assignee'])
        : null;
    if (json['assignees'] != null) {
      // ignore: deprecated_member_use
      assignees = new List<UserInfoModel>();
      json['assignees'].forEach((v) {
        assignees.add(new UserInfoModel.fromJson(v));
      });
    }
    milestone = json['milestone'] != null
        ? new Milestone.fromJson(json['milestone'])
        : null;
    comments = json['comments'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    closedAt = json['closed_at'];
    authorAssociation = json['author_association'];
    activeLockReason = json['active_lock_reason'];
    body = json['body'];
    closedBy = json['closed_by'] != null
        ? new UserInfoModel.fromJson(json['closed_by'])
        : null;
    performedViaGithubApp = json['performed_via_github_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['repository_url'] = this.repositoryUrl;
    data['labels_url'] = this.labelsUrl;
    data['comments_url'] = this.commentsUrl;
    data['events_url'] = this.eventsUrl;
    data['html_url'] = this.htmlUrl;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['number'] = this.number;
    data['title'] = this.title;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.labels != null) {
      data['labels'] = this.labels.map((v) => v.toJson()).toList();
    }
    data['state'] = this.state;
    data['locked'] = this.locked;
    if (this.assignee != null) {
      data['assignee'] = this.assignee.toJson();
    }
    if (this.assignees != null) {
      data['assignees'] = this.assignees.map((v) => v.toJson()).toList();
    }
    if (this.milestone != null) {
      data['milestone'] = this.milestone.toJson();
    }
    data['comments'] = this.comments;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['closed_at'] = this.closedAt;
    data['author_association'] = this.authorAssociation;
    data['active_lock_reason'] = this.activeLockReason;
    data['body'] = this.body;
    if (this.closedBy != null) {
      data['closed_by'] = this.closedBy.toJson();
    }
    data['performed_via_github_app'] = this.performedViaGithubApp;
    return data;
  }
}

class Labels {
  int id;
  String nodeId;
  String url;
  String name;
  String color;
  bool defaultBool;
  String description;

  Labels(
      {this.id,
      this.nodeId,
      this.url,
      this.name,
      this.color,
      this.defaultBool,
      this.description});

  Labels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    url = json['url'];
    name = json['name'];
    color = json['color'];
    defaultBool = json['default'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['url'] = this.url;
    data['name'] = this.name;
    data['color'] = this.color;
    data['default'] = this.defaultBool;
    data['description'] = this.description;
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
  String title;
  Null description;
  UserInfoModel creator;
  int openIssues;
  int closedIssues;
  String state;
  String createdAt;
  String updatedAt;
  Null dueOn;
  Null closedAt;

  Milestone(
      {this.url,
      this.htmlUrl,
      this.labelsUrl,
      this.id,
      this.nodeId,
      this.number,
      this.title,
      this.description,
      this.creator,
      this.openIssues,
      this.closedIssues,
      this.state,
      this.createdAt,
      this.updatedAt,
      this.dueOn,
      this.closedAt});

  Milestone.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    htmlUrl = json['html_url'];
    labelsUrl = json['labels_url'];
    id = json['id'];
    nodeId = json['node_id'];
    number = json['number'];
    title = json['title'];
    description = json['description'];
    creator = json['creator'] != null
        ? new UserInfoModel.fromJson(json['creator'])
        : null;
    openIssues = json['open_issues'];
    closedIssues = json['closed_issues'];
    state = json['state'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    dueOn = json['due_on'];
    closedAt = json['closed_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['labels_url'] = this.labelsUrl;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['number'] = this.number;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    data['open_issues'] = this.openIssues;
    data['closed_issues'] = this.closedIssues;
    data['state'] = this.state;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['due_on'] = this.dueOn;
    data['closed_at'] = this.closedAt;
    return data;
  }
}