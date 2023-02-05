class EmailModel {
  int? id;
  String? token;
  String? nameUser;
  String? firstName;
  String? email;
  String? title;
  String? login;
  String? pwd;
  String? confirmPassword;
  String? gender;
  int? age;
  String? pays;
  String? phone;
  String? dateBirth;
  String? description;
  bool? isEnabled;
  Companies? companies;
  String? etat;
  String? lastConnexion;
  String? picture;
  String? authorities;
  String? authoritie;
  bool? enabled;
  String? password;
  String? username;
  StatutUtilisateur? statutUtilisateur;
  bool? credentialsNonExpired;
  bool? accountNonExpired;
  bool? accountNonLocked;

  EmailModel(
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
      this.password,
      this.username,
      this.statutUtilisateur,
      this.credentialsNonExpired,
      this.accountNonExpired,
      this.accountNonLocked});

  EmailModel.fromJson(Map<String, dynamic> json) {
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
    password = json['password'];
    username = json['username'];
    statutUtilisateur = json['statutUtilisateur'] != null
        ? new StatutUtilisateur.fromJson(json['statutUtilisateur'])
        : null;
    credentialsNonExpired = json['credentialsNonExpired'];
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
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
    data['password'] = this.password;
    data['username'] = this.username;
    if (this.statutUtilisateur != null) {
      data['statutUtilisateur'] = this.statutUtilisateur!.toJson();
    }
    data['credentialsNonExpired'] = this.credentialsNonExpired;
    data['accountNonExpired'] = this.accountNonExpired;
    data['accountNonLocked'] = this.accountNonLocked;
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
  String? enabled;
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