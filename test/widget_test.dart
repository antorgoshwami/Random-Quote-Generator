import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_quote_app/main.dart';

String _currentQuote(WidgetTester tester) =>
    tester.widget<Text>(find.byKey(const Key('quote-text'))).data!;

void main() {
  testWidgets('shows a quote, an author and the New Quote button',
      (tester) async {
    await tester.pumpWidget(const QuoteApp());

    expect(find.byKey(const Key('quote-text')), findsOneWidget);
    expect(find.byKey(const Key('quote-author')), findsOneWidget);
    expect(find.text('New Quote'), findsOneWidget);
  });

  testWidgets('tapping New Quote always shows a different quote',
      (tester) async {
    await tester.pumpWidget(const QuoteApp());

    for (var i = 0; i < 10; i++) {
      final before = _currentQuote(tester);
      await tester.tap(find.text('New Quote'));
      await tester.pumpAndSettle();
      expect(_currentQuote(tester), isNot(before));
    }
  });
}
