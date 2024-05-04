import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:note_taking_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build app and trigger a frame.
      await tester.pumpWidget(NoteApp());

      // Verify if the AppBar title is correct.
      expect(find.text('Note Taking App'), findsOneWidget);

      // Verify no note displayed
      expect(find.byType(ListTile), findsNothing);
      
      // Populate TextFormField
      await tester.enterText(find.byType(TextField), 'My first note');

      // Tap on Add button
      await tester.tap(find.byIcon(Icons.add));

      // Rebuild widget after state changes
      await tester.pumpAndSettle();

      // Verify listing of notes, the entered note is displayed
      expect(find.text('My first note'), findsOneWidget);

      // Tap on Delete button to delete the note
      await tester.tap(find.byIcon(Icons.delete));

      // Rebuild widget after state changes
      await tester.pumpAndSettle();

      // Verify deletion of notes, no note should be displayed
      expect(find.text('My first note'), findsNothing);
  });
}
