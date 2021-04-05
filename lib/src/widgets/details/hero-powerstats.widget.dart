import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:superheroes/src/models/power-stats.dart';

class HeroPowerStatsWidget extends StatelessWidget {
  final PowerStats powerStats;
  
  HeroPowerStatsWidget({ @required this.powerStats });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('PowerStats'.toUpperCase(), 
              style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w100)
              )
          ),
          _getRow(context, 'Inteligence', powerStats.intelligence, Colors.lime[100]),
          _getRow(context, 'Strength', powerStats.strength, Colors.lime[300]),
          _getRow(context, 'Speed', powerStats.speed, Colors.lime[600]),
          _getRow(context, 'Durability', powerStats.durability, Colors.green[600]),
          _getRow(context, 'Power', powerStats.power, Colors.green[800]),
          _getRow(context, 'Combat', powerStats.combat, Colors.green[900])
        ]
      )
    ); 
  }

  Widget _getRow(BuildContext context, String title, int value, Color color) {
    double percentValue = (value / 100);
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                child: Text(title.toUpperCase()),
              ),
              new LinearPercentIndicator(
                alignment: MainAxisAlignment.start,
                width: (MediaQuery.of(context).size.width / 1.5) - 250,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: percentValue,
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Color(0xff1d1d1d),
                progressColor: color
              ),
              Container(
                width: 50,
                child: Text('$value%', textAlign: TextAlign.end)
              )
            ]
          )
        ]
      )
    );
  }
}