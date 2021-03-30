import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:superheroes/src/models/my-hero.dart';
import 'package:superheroes/src/constants/constants.dart';

class HeroDetailProvider {
  Future<MyHero> getHero(String id) async {
    Uri url = Uri.parse('$API_BASE_URL/id/$id.json');
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    return this._mapHero(decodedData);
  }

  MyHero _mapHero(dynamic json) {
    return new MyHero.formJsonMap(json);
  }
}