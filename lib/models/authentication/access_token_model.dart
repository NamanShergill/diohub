class AccessTokenModel {
  String? accessToken;
  String? scope;

  AccessTokenModel({this.accessToken, this.scope});

  AccessTokenModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['scope'] = this.scope;
    return data;
  }
}
