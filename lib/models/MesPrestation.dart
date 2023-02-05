class MesPrestaionList {
  int? id;
  bool? visibility;
  bool? enable;
  String? title;
  String? description;
  String? link;
  int? duration;
  String? dateCreation;
  String? startDate;
  String? closingDate;
  User? user;

  MesPrestaionList(
      {this.id,
      this.visibility,
      this.enable,
      this.title,
      this.description,
      this.link,
      this.duration,
      this.dateCreation,
      this.startDate,
      this.closingDate,
      this.user});

  MesPrestaionList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    visibility = json['visibility'];
    enable = json['enable'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    duration = json['duration'];
    dateCreation = json['dateCreation'];
    startDate = json['start_date'];
    closingDate = json['closing_date'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['visibility'] = this.visibility;
    data['enable'] = this.enable;
    data['title'] = this.title;
    data['description'] = this.description;
    data['link'] = this.link;
    data['duration'] = this.duration;
    data['dateCreation'] = this.dateCreation;
    data['start_date'] = this.startDate;
    data['closing_date'] = this.closingDate;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  Null? token;
  String? nameUser;
  String? firstName;
  String? email;
  Null? title;
  String? login;
  String? pwd;
  Null? confirmPassword;
  Null? gender;
  int? age;
  Null? pays;
  Null? phone;
  Null? dateBirth;
  Null? description;
  bool? isEnabled;
  Companies? companies;
  Null? etat;
  Null? lastConnexion;
  String? picture;
  Null? authorities;
  Null? authoritie;
  bool? enabled;
  bool? accountNonLocked;
  bool? accountNonExpired;
  StatutUtilisateur? statutUtilisateur;
  bool? credentialsNonExpired;
  String? password;
  String? username;

  User(
      {this.id,
      this.token,
      this.nameUser,
      this.firstName,
      this.email,
      this.title,
      this.login,
      this.pwd,
      this.confirmPassword,
      this.gender,
      this.age,
      this.pays,
      this.phone,
      this.dateBirth,
      this.description,
      this.isEnabled,
      this.companies,
      this.etat,
      this.lastConnexion,
      this.picture,
      this.authorities,
      this.authoritie,
      this.enabled,
      this.accountNonLocked,
      this.accountNonExpired,
      this.statutUtilisateur,
      this.credentialsNonExpired,
      this.password,
      this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    nameUser = json['name_user'];
    firstName = json['first_name'];
    email = json['email'];
    title = json['title'];
    login = json['login'];
    pwd = json['pwd'];
    confirmPassword = json['confirmPassword'];
    gender = json['gender'];
    age = json['age'];
    pays = json['pays'];
    phone = json['phone'];
    dateBirth = json['date_birth'];
    description = json['description'];
    isEnabled = json['isEnabled'];
    companies = json['companies'] != null
        ? new Companies.fromJson(json['companies'])
        : null;
    etat = json['etat'];
    lastConnexion = json['last_connexion'];
    picture = json['picture'];
    authorities = json['authorities'];
    authoritie = json['authoritie'];
    enabled = json['enabled'];
    accountNonLocked = json['accountNonLocked'];
    accountNonExpired = json['accountNonExpired'];
    statutUtilisateur = json['statutUtilisateur'] != null
        ? new StatutUtilisateur.fromJson(json['statutUtilisateur'])
        : null;
    credentialsNonExpired = json['credentialsNonExpired'];
    password = json['password'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['name_user'] = this.nameUser;
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    data['title'] = this.title;
    data['login'] = this.login;
    data['pwd'] = this.pwd;
    data['confirmPassword'] = this.confirmPassword;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['pays'] = this.pays;
    data['phone'] = this.phone;
    data['date_birth'] = this.dateBirth;
    data['description'] = this.description;
    data['isEnabled'] = this.isEnabled;
    if (this.companies != null) {
      data['companies'] = this.companies!.toJson();
    }
    data['etat'] = this.etat;
    data['last_connexion'] = this.lastConnexion;
    data['picture'] = this.picture;
    data['authorities'] = this.authorities;
    data['authoritie'] = this.authoritie;
    data['enabled'] = this.enabled;
    data['accountNonLocked'] = this.accountNonLocked;
    data['accountNonExpired'] = this.accountNonExpired;
    if (this.statutUtilisateur != null) {
      data['statutUtilisateur'] = this.statutUtilisateur!.toJson();
    }
    data['credentialsNonExpired'] = this.credentialsNonExpired;
    data['password'] = this.password;
    data['username'] = this.username;
    return data;
  }
}

class Companies {
  int? id;
  Null? name;
  Null? currentDomination;
  Null? address;
  Null? function;
  String? responsable;
  String? nafCode;
  String? siret;
  String? socialReason;
  Null? enabled;
  Null? message;

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

class StatutUtilisateur {
  int? id;
  String? statut;

  StatutUtilisateur({this.id, this.statut});

  StatutUtilisateur.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statut = json['statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['statut'] = this.statut;
    return data;
  }
}
