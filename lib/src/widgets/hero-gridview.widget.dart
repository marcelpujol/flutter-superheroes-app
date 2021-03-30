import 'package:flutter/material.dart';
import 'package:superheroes/src/models/my-hero.dart';
import 'package:superheroes/src/pages/details.page.dart';
import 'package:superheroes/src/widgets/hero-grid-powerstats.widget.dart';

class HeroGridViewWidget extends StatelessWidget {
  final List<MyHero> heroes;

  HeroGridViewWidget({ @required this.heroes });

  @override
  Widget build(BuildContext context) {
   return _getListView(context);
  }

  Widget _getListView(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 2.3;
    double cardHeight = MediaQuery.of(context).size.height / 2.6;



    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (cardWidth / cardHeight),
      children: List.generate(this.heroes.length, (index) {
        return _getListItem(context, heroes[index]);
      }),
    );
  }

  Widget _getListItem(BuildContext context, MyHero hero) {
    var _listItem = Container(
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hero.appearance.race,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)
                  ),
                  Text(
                    hero.powerStats.media.toString(),
                    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w100)
                  )
                ],
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                    tag: 'hero-tag-${hero.id}',
                    child: FadeInImage(
                    placeholder: AssetImage('assets/img/default-image.png'), 
                    image: NetworkImage(hero.images.imgMd),
                    fit: BoxFit.cover,
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.height * 0.20)
                  )
                )
              ),
              SizedBox(height: 10),
              Text(
                hero.name.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 10),
              HeroGridPowerStats(hero: hero)
            ],
          ),
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
      }
    );
  }
}