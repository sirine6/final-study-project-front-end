class PublicationModel {
  int? id;
  String? status;
  String? video;
  String? image;
  String? startDate;
  bool? visibility;
  Users? users;
  List<Commentaire>? commentaire;
  List<int>? likes;

  PublicationModel(
      {this.id,
      this.status,
      this.video,
      this.image,
      this.startDate,
      this.visibility,
      this.users,
      this.commentaire,
      this.likes});

  PublicationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    video = json['video'];
    image = json['image'];
    startDate = json['start_date'];
    visibility = json['visibility'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
    if (json['commentaire'] != null) {
      commentaire = <Commentaire>[];
      json['commentaire'].forEach((v) {
        commentaire!.add(new Commentaire.fromJson(v));
      });
    }
    likes = json['likes'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['video'] = this.video;
    data['image'] = this.image;
    data['start_date'] = this.startDate;
    data['visibility'] = this.visibility;
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    if (this.commentaire != null) {
      data['commentaire'] = this.commentaire!.map((v) => v.toJson()).toList();
    }
    data['likes'] = this.likes;
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

class Groups {
  int? id;
  String? nameGrp;
  String? descGrp;
  String? creationDate;
  bool? condition;
  Companies? companies;

  Groups(
      {this.id,
      this.nameGrp,
      this.descGrp,
      this.creationDate,
      this.condition,
      this.companies});

  Groups.fromJson(Map<String, dynamic> json) {
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

class Commentaire {
  int? id;
  String? text;
  String? date;
  Users? users;

  Commentaire({this.id, this.text, this.date, this.users});

  Commentaire.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    date = json['date'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['date'] = this.date;
    if (this.users != null) {
      data['users'] = this.users!.toJson();
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
  Null? authorities;
  Null? authoritie;
  bool? enabled;
  String? password;
  bool? credentialsNonExpired;
  StatutUtilisateur? statutUtilisateur;
  bool? accountNonExpired;
  bool? accountNonLocked;
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
      this.password,
      this.credentialsNonExpired,
      this.statutUtilisateur,
      this.accountNonExpired,
      this.accountNonLocked,
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
    password = json['password'];
    credentialsNonExpired = json['credentialsNonExpired'];
    statutUtilisateur = json['statutUtilisateur'] != null
        ? new StatutUtilisateur.fromJson(json['statutUtilisateur'])
        : null;
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
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
    data['password'] = this.password;
    data['credentialsNonExpired'] = this.credentialsNonExpired;
    if (this.statutUtilisateur != null) {
      data['statutUtilisateur'] = this.statutUtilisateur!.toJson();
    }
    data['accountNonExpired'] = this.accountNonExpired;
    data['accountNonLocked'] = this.accountNonLocked;
    data['username'] = this.username;
    return data;
  }
}

class Companie {
  int? id;
  String? name;
  String? currentDomination;
  String? address;
  Null? function;
  String? responsable;
  String? nafCode;
  String? siret;
  String? socialReason;
  String? enabled;
  String? message;

  Companie(
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

  Companie.fromJson(Map<String, dynamic> json) {
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