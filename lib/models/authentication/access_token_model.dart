class AccessTokenModel {
  String accessToken;
  int expiresIn;
  String refreshToken;
  int refreshTokenExpiresIn;
  String tokenType;
  String scope;

  AccessTokenModel(
      {this.accessToken,
      this.expiresIn,
      this.refreshToken,
      this.refreshTokenExpiresIn,
      this.tokenType,
      this.scope});

  AccessTokenModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    refreshToken = json['refresh_token'];
    refreshTokenExpiresIn = json['refresh_token_expires_in'];
    tokenType = json['token_type'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['refresh_token'] = this.refreshToken;
    data['refresh_token_expires_in'] = this.refreshTokenExpiresIn;
    data['token_type'] = this.tokenType;
    data['scope'] = this.scope;
    return data;
  }
}
