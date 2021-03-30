import 'package:flutter/material.dart';
import 'package:superheroes/src/models/my-hero.dart';
import 'package:superheroes/src/providers/db.provider.dart';
import 'package:superheroes/src/providers/heroes.provider.dart';
import 'package:superheroes/src/widgets/hero-gridview.widget.dart';

class ListPage extends StatefulWidget {
  final String alignment;

  ListPage({ @required this.alignment });

  @override
  State<StatefulWidget> createState() {
    return new ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  final HeroesProvider heroesProvider = new HeroesProvider();
  Future<List<MyHero>> _heroes;
  
  @override
  void initState() {
      super.initState();
      _getHeroesData();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    DbProvider.db.database;
    
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _heroes,
          builder: (BuildContext context, AsyncSnapshot<List<MyHero>> heroes) {
            if (heroes.hasData) {
              return HeroGridViewWidget(heroes: heroes.data);
            }
            else return _displayLoading(_screenSize);
          }
        )
      )
    );
  }

  void _getHeroesData() {
    this._heroes = heroesProvider.getHeroes(widget.alignment);
  }

  Widget _displayLoading(Size screenSize) {
    return Container(
      height: screenSize.height * 0.5,
      child: Center(
        child: CircularProgressIndicator()
      )
    );
  }
}