class Appearance {
  String gender;
  String race;
  List<String> height;
  List<String> weight;
  String eyeColor;
  String hairColor;

  Appearance({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor
  });

  Appearance.fromJsonMap(Map<String, dynamic> json) {
    this.gender = json['gender'];
    this.race = (json['race'] != null) ? json['race'] : 'None';
    this.height = json['height'].cast<String>();
    this.weight = json['weight'].cast<String>();
    this.eyeColor = json['eyeColor'];
    this.hairColor = json['hairColor'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Gender': (this.gender != null) ? this.gender : '-',
      'Race': (this.race != null) ? this.race : '-',
      'Height': (this.height[1] != null) ? this.height[1] : '-',
      'Weight': (this.weight[1] != null) ? this.weight[1] : '-',
      'Eye': (this.eyeColor != null) ? this.eyeColor : '-',
      'Hair': (this.hairColor != null) ? this.hairColor : '-'
    };
  }
}