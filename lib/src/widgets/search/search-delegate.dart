import 'package:flutter/material.dart';
import 'package:superheroes/src/models/my-hero.dart';
import 'package:superheroes/src/pages/details.page.dart';
import 'package:superheroes/src/providers/heroes.provider.dart';
import 'package:superheroes/src/theme/theme-styles.dart';

class DataSearch extends SearchDelegate {
  final heroesProvider = new HeroesProvider();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeStyles.themeData();
    // return ThemeData(
    //   primaryColor: ThemeStyles.themeData().primaryColor,
    //   textTheme: ThemeStyles.themeData().textTheme,
    //   backgroundColor: ThemeStyles.themeData().backgroundColor
    // );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
      //available actions (right side) of the search text field
      return <Widget>[
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          }
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      //available action (left side) of the search text field
      return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        }
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return FutureBuilder(
        future: heroesProvider.getHeroesBySearch(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return _getHeroListResults(context, snapshot.data);
          }
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      return FutureBuilder(
        future: heroesProvider.getHeroesBySearch(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return _getHeroListResults(context, snapshot.data);
          }
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      );
    }

    Widget _getHeroListResults(BuildContext context, List<MyHero> heroResults) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          child: ListView(
            children: heroResults.map((hero) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: 'hero-tag-${hero.id}',
                    child: FadeInImage(
                      image: NetworkImage(hero.images.imgSm),
                      placeholder: AssetImage('assets/img/default-image.png'),
                      width: 80.0,
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                title: Text(hero.name),
                subtitle: Text(hero.biography.publisher),
                onTap: () {
                  close(context, null);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        FocusScope.of(context).unfocus();
                        return DetailsPage(hero: hero);
                      }
                    )
                  );
                }
              );
            }).toList()
          )
        )
      );
    }
}