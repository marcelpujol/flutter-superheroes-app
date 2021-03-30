import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:superheroes/src/constants/constants.dart';
import 'package:superheroes/src/theme/theme-styles.dart';
import 'package:superheroes/src/pages/list.page.dart';
import 'package:superheroes/src/widgets/search/search-delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Super Heroes',
      theme: ThemeStyles.themeData(),
      home: new TabScreen()
    );
  }
}

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _getAppBar(context),
        body: Builder(
          builder: (context) => 
            TabBarView(
              children: [
                ListPage(alignment: 'good'),
                ListPage(alignment: 'bad'),
                ListPage(alignment: 'test')
              ],
            )
        )
      )
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
        title: Text(APP_NAME),
        elevation: 0,
        bottom: _getTabs(),
        actions: [
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            }
          )
        ]
      );
  }

  Widget _getTabs() {
    return TabBar(
      tabs: [
        Tab(icon: Icon(Icons.thumb_up_alt)),
        Tab(icon: Icon(Icons.thumb_down_alt)),
        Tab(icon: Icon(Icons.favorite))
      ]
    );
  }
}