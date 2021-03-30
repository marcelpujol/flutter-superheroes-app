import 'package:superheroes/src/models/appearance.dart';
import 'package:superheroes/src/models/biography.dart';
import 'package:superheroes/src/models/images.dart';
import 'package:superheroes/src/models/power-stats.dart';
import 'package:superheroes/src/models/work.dart';

class MyHero {
  int id;
  String name;
  String slug;
  PowerStats powerStats;
  Appearance appearance;
  Biography biography;
  Work work;
  Images images;

  MyHero({
    this.id,
    this.name,
    this.slug,
    this.powerStats,
    this.appearance,
    this.biography,
    this.work,
    this.images
  });

  MyHero.formJsonMap(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.slug = json['slug'];
    this.powerStats = new PowerStats.fromJsonMap(json['powerstats']);
    this.appearance = new Appearance.fromJsonMap(json['appearance']);
    this.biography = new Biography.fromJsonMap(json['biography']);
    this.work = new Work.fromJsonMap(json['work']);
    this.images = new Images.fromJsonMap(json['images']);
  }
}