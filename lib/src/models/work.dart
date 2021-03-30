class Work {
  String occupation;
  String base;

  Work({
    this.occupation,
    this.base
  });

  Work.fromJsonMap(Map<String, dynamic> json) {
    this.occupation = json['occupation'];
    this.base = json['base'];
  }
}