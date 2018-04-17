import 'package:flutter/material.dart';
import 'ProjectBrowsePage.dart';
import 'ProjectListPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: new Scaffold(
          appBar: new AppBar(
            bottom: new TabBar(
              tabs: [
                new Tab(icon: new Icon(Icons.view_list)),
                new Tab(icon: new Icon(Icons.insert_emoticon)),
                new Tab(icon: new Icon(Icons.person)),
              ],
            ),
            title: new Text('LANCELOT'),
          ),
          body: new TabBarView(
            children: [
              new ProjectListPage(),
              new ProjectBrowsePage(),
              new Icon(Icons.person)
            ],
          ),
        ),
      ),
    );
  }
}

