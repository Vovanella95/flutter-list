import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'file:///D:/flutter-list/flutter-list/hello_world/test/unit/open_closed_panel.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(OpenClosedPanel());

    expect(find.text('I am closed'), findsOneWidget);

    var gesture = find.byType(GestureDetector);

    await tester.tap(gesture);
    await tester.pump();

    expect(find.text('I am opened'), findsOneWidget);
  });
}
