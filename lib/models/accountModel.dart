class Account {
  int? totalItems;
  List<PagedItems>? pagedItems;

  Account({this.totalItems, this.pagedItems});

  Account.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    if (json['pagedItems'] != null) {
      pagedItems = <PagedItems>[];
      json['pagedItems'].forEach((v) {
        pagedItems!.add(new PagedItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalItems'] = this.totalItems;
    if (this.pagedItems != null) {
      data['pagedItems'] = this.pagedItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PagedItems {
  int? id;
  Null? token;
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
  Null? lastConnexion;
  String? picture;
  Null? authorities;
  Null? authoritie;
  bool? enabled;
  String? password;
  StatutUtilisateur? statutUtilisateur;
  String? username;
  bool? accountNonLocked;
  bool? accountNonExpired;
  bool? credentialsNonExpired;

  PagedItems(
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
      this.statutUtilisateur,
      this.username,
      this.accountNonLocked,
      this.accountNonExpired,
      this.credentialsNonExpired});

  PagedItems.fromJson(Map<String, dynamic> json) {
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
    statutUtilisateur = json['statutUtilisateur'] != null
        ? new StatutUtilisateur.fromJson(json['statutUtilisateur'])
        : null;
    username = json['username'];
    accountNonLocked = json['accountNonLocked'];
    accountNonExpired = json['accountNonExpired'];
    credentialsNonExpired = json['credentialsNonExpired'];
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
    if (this.statutUtilisateur != null) {
      data['statutUtilisateur'] = this.statutUtilisateur!.toJson();
    }
    data['username'] = this.username;
    data['accountNonLocked'] = this.accountNonLocked;
    data['accountNonExpired'] = this.accountNonExpired;
    data['credentialsNonExpired'] = this.credentialsNonExpired;
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
