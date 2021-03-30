import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:superheroes/src/constants/constants.dart';
import 'package:superheroes/src/models/my-hero.dart';

class HeroesProvider {
  Future<List<MyHero>> getHeroes(String alignment) async {
    Uri url = Uri.parse('$API_BASE_URL/all.json');
    final response = await http.get(url);  
    final decodedData = json.decode(response.body);
    return this._mapHeroes(decodedData, alignment);
  }

  Future<List<MyHero>> getHeroesBySearch(String searchTerm) async {
    Uri url = Uri.parse('$API_BASE_URL/all.json');
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    return this._mapHeroesBySearch(decodedData, searchTerm);
  }

  List<MyHero> _mapHeroes(List<dynamic> jsonList, String alignment) {
    List<MyHero> heroes = [];
    for (var item in jsonList) {
      final hero = new MyHero.formJsonMap(item);
      heroes.add(hero);
    }

    return heroes.where((hero) => hero.biography.alignment == alignment).toList();
  }

  List<MyHero> _mapHeroesBySearch(List<dynamic> jsonList, String searchTerm) {
    List<MyHero> heroes = [];
    for (var item in jsonList) {
      final hero = new MyHero.formJsonMap(item);
      heroes.add(hero);
    }

    return heroes.where((hero) {
      return hero.name.toLowerCase().contains(searchTerm.toLowerCase()) || 
      hero.biography.aliases.contains(searchTerm);
    }).toList(); 
  }
}