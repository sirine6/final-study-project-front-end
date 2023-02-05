class RoleModel {
  int? id;
  String? nameRoles;
  String? descRoles;
  bool? condition;

  RoleModel({this.id, this.nameRoles, this.descRoles, this.condition});

  RoleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameRoles = json['name_roles'];
    descRoles = json['desc_roles'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_roles'] = this.nameRoles;
    data['desc_roles'] = this.descRoles;
    data['condition'] = this.condition;
    return data;
  }
}
