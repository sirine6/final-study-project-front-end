class DossierCompetenceModel {
  int? id;
  String? name;
  String? mail;
  String? phone;
  String? date;
  List<Poste>? poste;
  List<Skills>? skills;
  List<Experiences>? experiences;
  List<Languages>? languages;
  List<Ecole>? ecole;

  DossierCompetenceModel(
      {this.id,
      this.name,
      this.mail,
      this.phone,
      this.date,
      this.poste,
      this.skills,
      this.experiences,
      this.languages,
      this.ecole});

  DossierCompetenceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mail = json['mail'];
    phone = json['phone'];
    date = json['date'];
    if (json['poste'] != null) {
      poste = <Poste>[];
      json['poste'].forEach((v) {
        poste!.add(new Poste.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
    if (json['experiences'] != null) {
      experiences = <Experiences>[];
      json['experiences'].forEach((v) {
        experiences!.add(new Experiences.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(new Languages.fromJson(v));
      });
    }
    if (json['ecole'] != null) {
      ecole = <Ecole>[];
      json['ecole'].forEach((v) {
        ecole!.add(new Ecole.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mail'] = this.mail;
    data['phone'] = this.phone;
    data['date'] = this.date;
    if (this.poste != null) {
      data['poste'] = this.poste!.map((v) => v.toJson()).toList();
    }
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    if (this.experiences != null) {
      data['experiences'] = this.experiences!.map((v) => v.toJson()).toList();
    }
    if (this.languages != null) {
      data['languages'] = this.languages!.map((v) => v.toJson()).toList();
    }
    if (this.ecole != null) {
      data['ecole'] = this.ecole!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Poste {
  int? id;
  String? name;
  bool? delete;

  Poste({this.id, this.name, this.delete});

  Poste.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['delete'] = this.delete;
    return data;
  }
}

class Experiences {
  int? id;
  bool? delete;
  String? title;

  Experiences({this.id, this.delete, this.title});

  Experiences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    delete = json['delete'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['delete'] = this.delete;
    data['title'] = this.title;
    return data;
  }
}

class Languages {
  int? id;
  bool? delete;
  String? langName;

  Languages({this.id, this.delete, this.langName});

  Languages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    delete = json['delete'];
    langName = json['lang_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['delete'] = this.delete;
    data['lang_name'] = this.langName;
    return data;
  }
}

class Skills {
  int? id;
  bool? delete;
  String? name;

  Skills({this.id, this.delete, this.name});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    delete = json['delete'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['delete'] = this.delete;
    data['name'] = this.name;
    return data;
  }
}



class Ecole {
  int? id;
  bool? delete;
  String? name;

  Ecole({this.id, this.delete, this.name});

  Ecole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    delete = json['delete'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['delete'] = this.delete;
    data['name'] = this.name;
    return data;
  }
}



