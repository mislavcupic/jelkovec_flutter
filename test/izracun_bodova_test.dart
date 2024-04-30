import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jelkovec_flutter_app/IzracunBodova.dart'; // Adjust the import path accordingly

void main() {
  group('IzracunBodova', () {
    testWidgets('Initial widget test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(home: IzracunBodova()));

      // Verify that AppBar title is correct
      expect(find.text('Izračunaj svoje bodove'), findsOneWidget);

      // Verify that initial smjer value is null
      expect(find.text('Elektrotehničar'), findsNothing);
      expect(find.text('Tehničar za elektroniku'), findsNothing);
      expect(find.text('Tehničar za računalstvo'), findsNothing);

      // Verify that initial text input values are empty
      expect(find.text('0'), findsNWidgets(16));
    });

    testWidgets('Selecting smjer', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: IzracunBodova()));

      // Tap on radio button to select smjer
      await tester.tap(find.text('Tehničar za elektroniku'));
      await tester.pump();

      // Verify that selected smjer is updated
      expect(find.text('Tehničar za elektroniku'), findsOneWidget);
    });

    testWidgets('Calculate button with empty input fields', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: IzracunBodova()));

      // Tap on calculate button with empty input fields
      await tester.tap(find.text('Izračunaj'));
      await tester.pump();

      // Verify that alert dialog is shown for empty input fields
    //  expect(find.text('Upozorenje'), findsOneWidget);
    });

    testWidgets('Calculate button with filled input fields', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: IzracunBodova()));

      // Fill input fields with values
      await tester.enterText(find.text('Opći uspjeh 5. razred'), '4');
      await tester.enterText(find.text('Opći uspjeh 6. razred'), '5');
      await tester.enterText(find.text('Opći uspjeh 7. razred'), '5');
      await tester.enterText(find.text('Opći uspjeh 8. razred'), '5');
      await tester.enterText(find.text('Hrvatski jezik (7. razred)'), '4');
      await tester.enterText(find.text('Matematika (7. razred)'), '5');
      await tester.enterText(find.text('Hrvatski jezik (8. razred)'), '5');
      await tester.enterText(find.text('Matematika (8. razred)'), '4');
      await tester.enterText(find.text('Strani jezik (7. razred)'), '5');
      await tester.enterText(find.text('Strani jezik (8. razred)'), '4');
      await tester.enterText(find.text('Kemija (7. razred)'), '5');
      await tester.enterText(find.text('Kemija (8. razred)'), '4');
      await tester.enterText(find.text('Fizika (7. razred)'), '5');
      await tester.enterText(find.text('Fizika (8. razred)'), '4');
      await tester.enterText(find.text('Tehnička kultura (7. razred)'), '5');
      await tester.enterText(find.text('Tehnička kultura (8. razred)'), '4');
      await tester.tap(find.text('Tehničar za elektroniku')); // Select smjer
      await tester.pump();

      // Tap on calculate button with filled input fields
      await tester.tap(find.text('Izračunaj'));
      await tester.pump();

      // Verify that alert dialog is shown with correct message


      expect(find.text('Čestitamo! Procijenjeni broj bodova je '), findsOneWidget);

    });
  });
}