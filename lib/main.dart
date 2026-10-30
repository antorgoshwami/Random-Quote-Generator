import 'dart:math';

import 'package:flutter/material.dart';

import 'quotes.dart';

void main() => runApp(const QuoteApp());

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF244A64),
          onPrimary: Colors.white,
          secondary: Color(0xFF4A817A),
          onSecondary: Colors.white,
          surface: Color(0xFFFFFEFC),
          onSurface: Color(0xFF263746),
          surfaceContainerLowest: Color(0xFFFFFFFF),
        ),
        scaffoldBackgroundColor: const Color(0xFFF3F5F6),
      ),
      home: const QuotePage(),
    );
  }
}

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  final Random _random = Random();
  late int _index;

  @override
  void initState() {
    super.initState();
    // A random quote is shown every time the app is opened.
    _index = _random.nextInt(quotes.length);
  }

  /// Picks a new random quote that differs from the current one.
  void _newQuote() {
    int next;
    do {
      next = _random.nextInt(quotes.length);
    } while (next == _index && quotes.length > 1);
    setState(() => _index = next);
  }

  @override
  Widget build(BuildContext context) {
    final quote = quotes[_index];
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.format_quote_rounded,
                      size: 56, color: colors.secondary),
                  const SizedBox(height: 24),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    child: Column(
                      key: ValueKey<int>(_index),
                      children: [
                        Text(
                          quote.text,
                          key: const Key('quote-text'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 26,
                            height: 1.4,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF263746),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          '\u2014 ${quote.author}',
                          key: const Key('quote-author'),
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: colors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  FilledButton.icon(
                    onPressed: _newQuote,
                    icon: const Icon(Icons.refresh),
                    label: const Text('New Quote'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 16),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
