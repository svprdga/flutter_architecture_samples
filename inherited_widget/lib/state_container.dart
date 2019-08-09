import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model/AppState.dart';

class StateContainer extends StatefulWidget {

  final AppState state;
  final Widget child;

  StateContainer({
    @required this.child,
    this.state,
  });

  static _StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
    as _InheritedStateContainer)
        .data;
  }

  @override
  _StateContainerState createState() => new _StateContainerState(state: state);
}

class _StateContainerState extends State<StateContainer> {
  AppState state;

  _StateContainerState({this.state});

  @override
  void initState() {
    super.initState();
    if (state == null) {
      state = AppState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {

  final _StateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}