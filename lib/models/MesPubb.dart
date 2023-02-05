class Mespubb {
  int? id;
  String? status;
  int? signaler;
  int? aimes;
  String? video;
  String? image;
  String? startDate;
  Null? lastModif;
  bool? visibility;
  Users? users;
  List<Aime>? aime;
  List<Commentaire>? commentaire;

  Mespubb(
      {this.id,
      this.status,
      this.signaler,
      this.aimes,
      this.video,
      this.image,
      this.startDate,
      this.lastModif,
      this.visibility,
      this.users,
      this.aime,
      this.commentaire});

  Mespubb.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    signaler = json['signaler'];
    aimes = json['aimes'];
    video = json['video'];
    image = json['image'];
    startDate = json['start_date'];
    lastModif = json['last_modif'];
    visibility = json['visibility'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
    if (json['aime'] != null) {
      aime = <Aime>[];
      json['aime'].forEach((v) {
        aime!.add(new Aime.fromJson(v));
      });
    }
    if (json['commentaire'] != null) {
      commentaire = <Commentaire>[];
      json['commentaire'].forEach((v) {
        commentaire!.add(new Commentaire.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['signaler'] = this.signaler;
    data['aimes'] = this.aimes;
    data['video'] = this.video;
    data['image'] = this.image;
    data['start_date'] = this.startDate;
    data['last_modif'] = this.lastModif;
    data['visibility'] = this.visibility;
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    if (this.aime != null) {
      data['aime'] = this.aime!.map((v) => v.toJson()).toList();
    }
    if (this.commentaire != null) {
      data['commentaire'] = this.commentaire!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? id;
  Null? token;
  String? nameUser;
  String? firstName;
  String? email;
  Null? title;
  String? login;
  String? pwd;
  String? confirmPassword;
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
  String? password;
  bool? accountNonLocked;
  String? username;
  StatutUtilisateur? statutUtilisateur;
  bool? credentialsNonExpired;
  bool? accountNonExpired;

  Users(
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
      this.accountNonLocked,
      this.username,
      this.statutUtilisateur,
      this.credentialsNonExpired,
      this.accountNonExpired});

  Users.fromJson(Map<String, dynamic> json) {
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
    accountNonLocked = json['accountNonLocked'];
    username = json['username'];
    statutUtilisateur = json['statutUtilisateur'] != null
        ? new StatutUtilisateur.fromJson(json['statutUtilisateur'])
        : null;
    credentialsNonExpired = json['credentialsNonExpired'];
    accountNonExpired = json['accountNonExpired'];
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
    data['accountNonLocked'] = this.accountNonLocked;
    data['username'] = this.username;
    if (this.statutUtilisateur != null) {
      data['statutUtilisateur'] = this.statutUtilisateur!.toJson();
    }
    data['credentialsNonExpired'] = this.credentialsNonExpired;
    data['accountNonExpired'] = this.accountNonExpired;
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

class Aime {
  int? id;
  int? etat;

  Aime({this.id, this.etat});

  Aime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    etat = json['etat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['etat'] = this.etat;
    return data;
  }
}
class Commentaire {
  int? id;
  int? etat;

  Commentaire({this.id, this.etat});

  Commentaire.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    etat = json['etat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['etat'] = this.etat;
    return data;
  }
}
