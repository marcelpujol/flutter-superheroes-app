import 'package:flutter/material.dart';
import 'package:superheroes/src/models/my-hero.dart';

class HeroGridPowerStats extends StatelessWidget {
  final MyHero hero;

  HeroGridPowerStats({ @required this.hero });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  hero.powerStats.combat.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                SizedBox(width: 5),
                Text('COM')
              ]
            ),
            Row(
              children: [
                
                Text(
                  hero.powerStats.durability.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                SizedBox(width: 5),
                Text('DUR')
              ]
            ),
            Row(
              children: [
                Text(
                  hero.powerStats.intelligence.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                SizedBox(width: 5),
                Text('INT')
              ]
            )
          ]
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  hero.powerStats.power.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                SizedBox(width: 5),
                Text('POW')
              ]
            ),
            Row(
              children: [
                Text(
                  hero.powerStats.speed.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                SizedBox(width: 5),
                Text('SPE')
              ]
            ),
            Row(
              children: [
                Text(
                  hero.powerStats.strength.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                SizedBox(width: 5),
                Text('STR')
              ]
            )
          ]
        )
      ]
    );
  }

}