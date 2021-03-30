class PowerStats {
  int intelligence;
  int strength;
  int speed;
  int durability;
  int power;
  int combat;
  int media;

  PowerStats({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat
  });

  PowerStats.fromJsonMap(Map<String, dynamic> json) {
    this.intelligence = json['intelligence'];
    this.strength = json['strength'];
    this.speed = json['speed'];
    this.durability = json['durability'];
    this.power = json['power'];
    this.combat = json['combat'];
    this.media = this._calculateMedia();
  }

  int _calculateMedia() {
    var sum = this.intelligence + this.strength + this.speed + this.durability + this.power + this.combat;
    return (sum / 6).floor();
  }
}