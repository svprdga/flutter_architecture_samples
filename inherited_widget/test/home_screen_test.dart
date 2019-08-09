import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inherited_widget/model/AppState.dart';
import 'package:inherited_widget/screen/home_screen.dart';
import 'package:inherited_widget/state_container.dart';

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}

void main() {
  group('HomeScreen -', () {
    var userId = "fake_id";

    testWidgets('When screen appears, user id is displayed',
        (WidgetTester tester) async {

      // Set the initial state that we want.
      var state = AppState()..userId = userId;

      // Launch widget.
      var widget = StateContainer(
          child: buildTestableWidget(HomeScreen()), state: state);
      await tester.pumpWidget(widget);

      // Assert.
      expect(find.text(userId), findsOneWidget);
    });
  });
}
