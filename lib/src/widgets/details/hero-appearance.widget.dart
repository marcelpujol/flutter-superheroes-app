import 'package:flutter/material.dart';
import 'package:superheroes/src/models/appearance.dart';

class HeroAppearanceWidget extends StatelessWidget {
  final Appearance apperance;

  HeroAppearanceWidget({ @required this.apperance });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getHeroAppearance()
      )
    );
  }

  List<Widget> _getHeroAppearance() {
    List<Widget> heroAppearanceRows = [];
    Map<String, dynamic> appearanceMap = this.apperance.toJson();
    heroAppearanceRows.add(
      Text('Appearance'.toUpperCase(), 
        style: new TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w100)
      )
    );
    for (String key in appearanceMap.keys) {
      heroAppearanceRows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              child: Text(key.toUpperCase())
            ),
            SizedBox(width: 10),
            Text(appearanceMap[key])
          ],
        )
      );
    }

    return heroAppearanceRows;
  }
}