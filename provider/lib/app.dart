import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/screen/login_screen.dart';

import 'model/AppState.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AppState>(
        builder: (context) => AppState(),
        child: MaterialApp(
          title: 'Inherited Widget',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen(),
        ));
  }
}
