import 'package:flutter/material.dart';

import '../state_container.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var state = StateContainer
        .of(context)
        .state;

    return Scaffold(
      appBar: AppBar(title: Text(state.appTitle)),
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            children: <Widget>[
              Text("User id ${state.userId}"),
            ],
          ),
        ),
      ),
    );
  }
}