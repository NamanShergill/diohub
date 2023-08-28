class DeviceCodeModel {
  String? deviceCode;
  String? userCode;
  String? verificationUri;
  int? expiresIn;
  int? interval;
  int? parsedOn;

  DeviceCodeModel(
      {this.deviceCode,
      this.userCode,
      this.verificationUri,
      this.expiresIn,
      this.parsedOn,
      this.interval});

  DeviceCodeModel.fromJson(Map<String, dynamic> json) {
    deviceCode = json['device_code'];
    userCode = json['user_code'];
    verificationUri = json['verification_uri'];
    expiresIn = DateTime.now().millisecondsSinceEpoch +
        json['expires_in'] * 1000 as int?;
    parsedOn = DateTime.now().millisecondsSinceEpoch;
    interval = json['interval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_code'] = this.deviceCode;
    data['user_code'] = this.userCode;
    data['verification_uri'] = this.verificationUri;
    data['expires_in'] = this.expiresIn;
    data['parsed_on'] = this.parsedOn;
    data['interval'] = this.interval;
    return data;
  }
}
