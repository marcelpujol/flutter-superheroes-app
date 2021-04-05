import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:superheroes/src/constants/constants.dart';
import 'package:superheroes/src/models/my-hero.dart';

class DbProvider {
 
  static Database _database;
  static final DbProvider db = DbProvider._();
  DbProvider._();

  Future<Database> get database async {
    if (!kIsWeb) {
      if (_database != null) return _database;
      _database = await initDatabase();
      return _database;
    }
  }

  Future<Database> initDatabase() async {
    //get database path
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, DB_NAME);
    print('database path: $path');

    //create database
    return await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) async {
        _createHeroTable(db);
        _createAppearancesTable(db);
        _createBiographiesTable(db);
        _createPowerStatsTable(db);
      }
    );
  }

  void _createHeroTable(Database db) async {
    await db.execute('''
      CREATE TABLE Heroes(
        id INTEGER PRIMARY KEY,
        name TEXT,
        image TEXT
      );
    ''');
  }

  void _createAppearancesTable(Database db) async {
    await db.execute('''
      CREATE TABLE Appearances (
        id INTEGER PRIMARY KEY,
        gender TEXT,
        race TEXT,
        height TEXT,
        weight TEXT,
        eye TEXT,
        hair TEXT,
        heroId INTEGER NOT NULL,
        FOREIGN KEY (heroId) REFERENCES Heroes(id)
      );
    ''');
  }

  void _createBiographiesTable(Database db) async {
    await db.execute('''
      CREATE TABLE Biographies (
        id INTEGER PRIMARY KEY,
        fullName TEXT,
        aliases TEXT,
        place TEXT,
        appearance TEXT,
        publisher TEXT,
        alignment TEXT,
        heroId INTEGER NOT NULL,
        FOREIGN KEY (heroId) REFERENCES Heroes(id)
      );
    ''');
  }

  void _createPowerStatsTable(Database db) async {
    await db.execute('''
      CREATE TABLE Powerstats (
        id INTEGER PRIMARY KEY,
        media INTEGER,
        combat INTEGER,
        durability INTEGER,
        intelligence INTEGER,
        power INTEGER,
        speed INTEGER,
        streight INTEGER,
        heroId INTEGER NOT NULL,
        FOREIGN KEY (heroId) REFERENCES Heroes(id)
      );
    ''');
  }

  insertHero(MyHero hero) async {
    final db = await database;
    Batch batch = db.batch();

    batch.insert('Heroes', { 
        'id':  hero.id,
        'name': '${hero.name}',
        'image': '${hero.images.imgMd}'
    });
    
    batch.insert('Appearances', {
      'gender': '${hero.appearance.gender}',
      'race': '${hero.appearance.race}',
      'height': '${hero.appearance.height}',
      'weight': '${hero.appearance.weight}',
      'eye': '${hero.appearance.eyeColor}',
      'hair': '${hero.appearance.hairColor}',
      'heroId': hero.id
    });
    
    batch.insert('Biographies', {
      'fullName': '${hero.biography.fullName}',
      'aliases': '${hero.biography.aliases}',
      'place': '${hero.biography.placeOfBirth}',
      'appearance': '${hero.biography.firstAppearance}',
      'publisher': '${hero.biography.publisher}',
      'alignment': '${hero.biography.alignment}',
      'heroId': hero.id
    });

    batch.insert('Powerstats', {
      'media': hero.powerStats.media,
      'combat': hero.powerStats.combat,
      'durability': hero.powerStats.durability,
      'intelligence': hero.powerStats.intelligence,
      'power': hero.powerStats.power,
      'speed': hero.powerStats.speed,
      'streight': hero.powerStats.strength,
      'heroId': hero.id
    });

    await batch.commit(noResult: true);
  }

}