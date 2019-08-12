import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/model/AppState.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(title: Text(state.appTitle)),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("User id: "),
              Text(state.userId)
            ],
          ),
        ),
      ),
    );
  }
}