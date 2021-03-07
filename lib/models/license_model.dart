// Todo: Redo Model. Ref: https://app.quicktype.io/

class LicenseModel {
  String key;
  String name;
  String spdxId;
  String url;
  String nodeId;
  String htmlUrl;
  String description;
  String implementation;
  List<String> permissions;
  List<String> conditions;
  List<String> limitations;
  String body;
  bool featured;

  LicenseModel(
      {this.key,
      this.name,
      this.spdxId,
      this.url,
      this.nodeId,
      this.htmlUrl,
      this.description,
      this.implementation,
      this.permissions,
      this.conditions,
      this.limitations,
      this.body,
      this.featured});

  LicenseModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    spdxId = json['spdx_id'];
    url = json['url'];
    nodeId = json['node_id'];
    htmlUrl = json['html_url'];
    description = json['description'];
    implementation = json['implementation'];
    permissions = json['permissions'].cast<String>();
    conditions = json['conditions'].cast<String>();
    limitations = json['limitations'].cast<String>();
    body = json['body'];
    featured = json['featured'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['name'] = this.name;
    data['spdx_id'] = this.spdxId;
    data['url'] = this.url;
    data['node_id'] = this.nodeId;
    data['html_url'] = this.htmlUrl;
    data['description'] = this.description;
    data['implementation'] = this.implementation;
    data['permissions'] = this.permissions;
    data['conditions'] = this.conditions;
    data['limitations'] = this.limitations;
    data['body'] = this.body;
    data['featured'] = this.featured;
    return data;
  }
}
