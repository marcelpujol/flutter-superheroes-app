import 'package:flutter/material.dart';
import 'package:superheroes/src/models/biography.dart';

class HeroBiographyWidget extends StatelessWidget {
  final Biography biography;

  HeroBiographyWidget({ @required this.biography });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getHeroBiography()
      )
    );
  }

  List<Widget> _getHeroBiography() {
    List<Widget> heroBiographyRows = [];
    Map<String, dynamic> biographyMap = this.biography.toJson();
    heroBiographyRows.add(
      Column(
        children: [
          SizedBox(height: 15.0),
          Text('Biography'.toUpperCase(), 
            style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w100)
          ),
          SizedBox(height: 15.0)
        ]
      )
    );
    for (String key in biographyMap.keys) {
      heroBiographyRows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              child: Text(key.toUpperCase())
            ),
            SizedBox(width: 10),
            Text(biographyMap[key])
          ],
        )
      );
    }
    return heroBiographyRows;
  }
}