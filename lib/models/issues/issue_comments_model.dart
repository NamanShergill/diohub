import 'package:onehub/models/users/user_info_model.dart';

class IssueCommentsModel {
  String url;
  String htmlUrl;
  String issueUrl;
  int id;
  String nodeId;
  UserInfoModel user;
  String createdAt;
  String updatedAt;
  String authorAssociation;
  String body;
  bool performedViaGithubApp;

  IssueCommentsModel(
      {this.url,
      this.htmlUrl,
      this.issueUrl,
      this.id,
      this.nodeId,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.authorAssociation,
      this.body,
      this.performedViaGithubApp});

  IssueCommentsModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    htmlUrl = json['html_url'];
    issueUrl = json['issue_url'];
    id = json['id'];
    nodeId = json['node_id'];
    user =
        json['user'] != null ? new UserInfoModel.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    authorAssociation = json['author_association'];
    body = json['body'];
    performedViaGithubApp = json['performed_via_github_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['issue_url'] = this.issueUrl;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['author_association'] = this.authorAssociation;
    data['body'] = this.body;
    data['performed_via_github_app'] = this.performedViaGithubApp;
    return data;
  }
}
