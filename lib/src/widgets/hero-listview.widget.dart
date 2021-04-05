import 'package:flutter/material.dart';
import 'package:superheroes/src/models/my-hero.dart';
import 'package:superheroes/src/pages/details.page.dart';

import 'hero-grid-powerstats.widget.dart';

class HeroListViewWidget extends StatelessWidget {
  final List<MyHero> heroes;

  HeroListViewWidget({ @required this.heroes });
  
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        child: ListView.separated(
          padding: EdgeInsets.all(50.0),
          itemCount: heroes.length,
          itemBuilder: (BuildContext context, int index) {
            MyHero hero = heroes[index];
            return _getListHeroItem(context, hero);
          }, 
          separatorBuilder: (BuildContext context, int index) {  
            return const Divider();
          },
        )
      )
    );
  }


  Widget _getListHeroItem(BuildContext context, MyHero hero) {
    var _listItem = Container(
      height: 150,
      child: Card(
        color: Color.fromRGBO(45, 47, 57, 1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('Media', style: TextStyle(color: Colors.white, fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify)  
                ),
                Container(
                    child: Text(hero.powerStats.media.toString(), style: TextStyle(color: Colors.white54, fontSize: 30), maxLines: 5, overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify)
                )
              ]
            ),
            SizedBox(width: 10.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: 'hero-tag-${hero.id}', 
                child: FadeInImage(
                  placeholder: AssetImage('assets/img/default-image.png'), 
                  image: NetworkImage(hero.images.imgMd),
                  fit: BoxFit.cover,
                  width: 80,
                  height: 130,
                )
              )
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  child: Text(hero.name, style: TextStyle(color: Colors.white, fontSize: 18), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify)  
                ),
                Container(
                    width: 250,
                    child: Text(hero.biography.publisher, style: TextStyle(color: Colors.white54, fontSize: 15), maxLines: 5, overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify)
                )
              ]
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeroGridPowerStats(hero: hero)
              ]
            ),
            SizedBox(width: 10.0),
          ]
        )
      )
    );

    return GestureDetector(
      child: _listItem,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              FocusScope.of(context).unfocus();
              return DetailsPage(hero: hero);
            }
          )
        );
      },
    );
  }
}