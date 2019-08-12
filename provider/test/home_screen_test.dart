import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/model/AppState.dart';
import 'package:provider_sample/screen/home_screen.dart';

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
      var widget = Provider<AppState>.value(
        value: state,
        child: buildTestableWidget(HomeScreen()),
      );
      await tester.pumpWidget(widget);

      // Assert.
      expect(find.text(userId), findsOneWidget);
    });
  });
}
