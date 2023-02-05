class Groups {
  int? id;
  String? nameGrp;
  String? descGrp;
  String? creationDate;
  bool? condition;
  List<Roles>? roles;
  List<Users>? users;

  Groups(
      {this.id,
      this.nameGrp,
      this.descGrp,
      this.creationDate,
      this.condition,
      this.roles,
      this.users});

  Groups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameGrp = json['name_grp'];
    descGrp = json['desc_grp'];
    creationDate = json['creation_date'];
    condition = json['condition'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_grp'] = this.nameGrp;
    data['desc_grp'] = this.descGrp;
    data['creation_date'] = this.creationDate;
    data['condition'] = this.condition;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? nameRoles;
  String? descRoles;
  bool? condition;

  Roles({this.id, this.nameRoles, this.descRoles, this.condition});

  Roles.fromJson(Map<String, dynamic> json) {
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

class Users {
  int? id;
  int? convId;
  String? nameUser;
  String? firstName;
  String? email;
  String? title;
  String? login;
  String? pwd;
  String? gender;
  String? pays;
  int? age;
  String? phone;
  String? dateBirth;
  String? description;
  String? etat;
  String? picture;
  int? companieId;
  List<Groups>? groups;

  Users(
      {this.id,
      this.convId,
      this.nameUser,
      this.firstName,
      this.email,
      this.title,
      this.login,
      this.pwd,
      this.gender,
      this.pays,
      this.age,
      this.phone,
      this.dateBirth,
      this.description,
      this.etat,
      this.picture,
      this.companieId,
      this.groups});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    convId = json['conv_id'];
    nameUser = json['name_user'];
    firstName = json['first_name'];
    email = json['email'];
    title = json['title'];
    login = json['login'];
    pwd = json['pwd'];
    gender = json['gender'];
    pays = json['pays'];
    age = json['age'];
    phone = json['phone'];
    dateBirth = json['date_birth'];
    description = json['description'];
    etat = json['etat'];
    picture = json['picture'];
    companieId = json['companieId'];
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(new Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['conv_id'] = this.convId;
    data['name_user'] = this.nameUser;
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    data['title'] = this.title;
    data['login'] = this.login;
    data['pwd'] = this.pwd;
    data['gender'] = this.gender;
    data['pays'] = this.pays;
    data['age'] = this.age;
    data['phone'] = this.phone;
    data['date_birth'] = this.dateBirth;
    data['description'] = this.description;
    data['etat'] = this.etat;
    data['picture'] = this.picture;
    data['companieId'] = this.companieId;
    if (this.groups != null) {
      data['groups'] = this.groups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Groupss {
  int? id;
  String? nameGrp;
  String? descGrp;
  String? creationDate;
  bool? condition;
  Companies? companies;

  Groupss(
      {this.id,
      this.nameGrp,
      this.descGrp,
      this.creationDate,
      this.condition,
      this.companies});

  Groupss.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameGrp = json['name_grp'];
    descGrp = json['desc_grp'];
    creationDate = json['creation_date'];
    condition = json['condition'];
    companies = json['companies'] != null
        ? new Companies.fromJson(json['companies'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_grp'] = this.nameGrp;
    data['desc_grp'] = this.descGrp;
    data['creation_date'] = this.creationDate;
    data['condition'] = this.condition;
    if (this.companies != null) {
      data['companies'] = this.companies!.toJson();
    }
    return data;
  }
}

class Companies {
  int? id;
  String? name;
  String? currentDomination;
  String? address;
  String? function;
  String? responsable;
  String? nafCode;
  String? siret;
  String? socialReason;
  bool? enabled;
  String? message;

  Companies(
      {this.id,
      this.name,
      this.currentDomination,
      this.address,
      this.function,
      this.responsable,
      this.nafCode,
      this.siret,
      this.socialReason,
      this.enabled,
      this.message});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    currentDomination = json['current_domination'];
    address = json['address'];
    function = json['function'];
    responsable = json['responsable'];
    nafCode = json['naf_code'];
    siret = json['siret'];
    socialReason = json['social_reason'];
    enabled = json['enabled'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['current_domination'] = this.currentDomination;
    data['address'] = this.address;
    data['function'] = this.function;
    data['responsable'] = this.responsable;
    data['naf_code'] = this.nafCode;
    data['siret'] = this.siret;
    data['social_reason'] = this.socialReason;
    data['enabled'] = this.enabled;
    data['message'] = this.message;
    return data;
  }
}
