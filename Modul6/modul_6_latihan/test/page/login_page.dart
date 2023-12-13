import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modul_6_latihan/app/modules/login/views/login_page.dart';

void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify the title text
    expect(find.text('Login'), findsOneWidget);

    // Verify the presence of the email and password fields
    expect(find.byType(TextField), findsNWidgets(2));

    // You can add more widget-specific tests based on your UI

    // Verify the presence of the login button
    expect(find.text('Login'), findsOneWidget);

    // Tap the login button
    await tester.tap(find.text('Login'));

    // Trigger a frame
    await tester.pump();
  });
}
