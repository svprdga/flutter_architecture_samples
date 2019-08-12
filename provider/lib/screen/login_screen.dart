import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/model/AppState.dart';
import 'package:provider_sample/network/fake_client.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FakeClient _client = FakeClient();

  _showError(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.appTitle),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                  "Use the following credentials to fake a login, type any other value to provoke an error:"),
              Text("Username: ${FakeClient.USERNAME}"),
              Text("Password: ${FakeClient.PWD_OK}"),
            ],
          ),
          Center(
            child: Container(
              width: 200,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (String value) {
                        return value.isEmpty ? 'Enter username' : null;
                      },
                      decoration: InputDecoration(labelText: "Username"),
                      controller: _usernameController,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.send,
                      validator: (String value) {
                        return value.isEmpty ? 'Enter password' : null;
                      },
                      decoration: InputDecoration(labelText: "Password"),
                      controller: _passwordController,
                    ),
                    RaisedButton(
                      child: Text("Submit"),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          try {
                            var response = await _client.login(
                                _usernameController.text,
                                _passwordController.text);
                            state.userId = response.userId;
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                          } on KoException catch (e) {
                            print(e);
                            _showError(e.message);
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }
}
