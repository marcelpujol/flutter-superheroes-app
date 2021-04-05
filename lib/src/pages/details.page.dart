import 'package:flutter/material.dart';

import 'package:superheroes/src/models/my-hero.dart';
import 'package:superheroes/src/providers/db.provider.dart';
import 'package:superheroes/src/providers/hero-detail.provider.dart';
import 'package:superheroes/src/widgets/details/hero-appearance.widget.dart';
import 'package:superheroes/src/widgets/details/hero-biography.widget.dart';
import 'package:superheroes/src/widgets/details/hero-powerstats.widget.dart';

class DetailsPage extends StatefulWidget {
  final MyHero hero;

  DetailsPage({ @required this.hero });

  @override
  DetailsPageState createState() {
    return new DetailsPageState();
  }
}
class DetailsPageState extends State<DetailsPage> {
  final HeroDetailProvider heroDetailProvider = new HeroDetailProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBarDetails = AppBar(
        title: Text(widget.hero.name),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite), 
            onPressed: () async {
              print('Inserting hero as favorite...');
              await DbProvider.db.insertHero(widget.hero);
              print('Inserting hero done!');
            }
          )
        ],
    );

    return Scaffold(
      appBar: appBarDetails,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height - appBarDetails.preferredSize.height,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _getHeroImage(),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      _getHeroAppearance()
                    ]
                  )
                ]
              ),
              _getHeroBiography(),
              _getHeroPowerStats()
            ]
          ),
        ),
      )
    );
  }

  Widget _getHeroImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Hero(
          tag: 'hero-tag-${widget.hero.id}',
          child: FadeInImage(
          placeholder: AssetImage('assets/img/default-image.png'), 
          image: NetworkImage(widget.hero.images.imgMd),
          fit: BoxFit.cover,
          height: (MediaQuery.of(context).size.height * 0.35)
        )
      )
    );
  }

  Widget _getHeroBiography() {
    return HeroBiographyWidget(biography: widget.hero.biography);
  }

  Widget _getHeroAppearance() {
    return HeroAppearanceWidget(apperance: widget.hero.appearance);
  }

  Widget _getHeroPowerStats() {
    return HeroPowerStatsWidget(powerStats: widget.hero.powerStats);
  }
}
