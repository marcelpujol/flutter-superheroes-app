class Biography {
  String fullName;
  List<String> aliases;
  String placeOfBirth;
  String firstAppearance;
  String publisher;
  String alignment;

  Biography({
    this.fullName,
    this.aliases,
    this.placeOfBirth,
    this.firstAppearance,
    this.publisher,
    this.alignment
  });

  Biography.fromJsonMap(Map<String, dynamic> json) {
    this.fullName = (json['fullName'] != null) ? json['fullName'] : '-';
    this.aliases = (json['aliases'].cast<String>() != null) ? (json['aliases'].cast<String>()) : '-';
    this.placeOfBirth = (json['placeOfBirth'] != null) ? (json['placeOfBirth']) : '-';
    this.firstAppearance = (json['firstAppearance'] != null) ? json['firstAppearance'] : '-';
    this.publisher = (json['publisher'] != null) ? json['publisher'] : '-';
    this.alignment = (json['alignment'] != null) ? json['alignment'] : '-';
  }

  Map<String, dynamic> toJson() {
    return {
      'Fullname': (this.fullName != null) ? this.fullName : '-',
      'Aliases': (this.aliases != null) ? this.aliases[0] : '-',
      'Place': (this.placeOfBirth != null) ? this.placeOfBirth : '-',
      'Appearance': (this.firstAppearance != null) ? this.firstAppearance : '-',
      'Publisher': (this.publisher != null) ? this.publisher : '-',
      'Alignment': (this.alignment != null) ? this.alignment : '-'
    };
  }
}