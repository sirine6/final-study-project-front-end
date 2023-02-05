class UserModel {
  String? username;
  String? authorities;
  int? id;
  bool? enabled;
  String? tokenType;
  String? accessToken;

  UserModel(
      {this.username,
      this.authorities,
      this.id,
      this.enabled,
      this.tokenType,
      this.accessToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    authorities = json['authorities'];
    id = json['id'];
    enabled = json['enabled'];
    tokenType = json['tokenType'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['authorities'] = this.authorities;
    data['id'] = this.id;
    data['enabled'] = this.enabled;
    data['tokenType'] = this.tokenType;
    data['accessToken'] = this.accessToken;
    return data;
  }
}
