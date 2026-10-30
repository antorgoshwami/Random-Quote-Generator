/// A single quote with its text and author.
class Quote {
  const Quote({required this.text, required this.author});

  final String text;
  final String author;
}

/// The collection of quotes the app picks from.
const List<Quote> quotes = [
  Quote(
    text: 'The only way to do great work is to love what you do.',
    author: 'Steve Jobs',
  ),
  Quote(
    text: 'In the middle of difficulty lies opportunity.',
    author: 'Albert Einstein',
  ),
  Quote(
    text: 'It always seems impossible until it is done.',
    author: 'Nelson Mandela',
  ),
  Quote(
    text: 'The journey of a thousand miles begins with a single step.',
    author: 'Lao Tzu',
  ),
  Quote(
    text: 'Whether you think you can, or you think you can\u2019t, you\u2019re right.',
    author: 'Henry Ford',
  ),
  Quote(
    text: 'Happiness depends upon ourselves.',
    author: 'Aristotle',
  ),
  Quote(
    text: 'What we think, we become.',
    author: 'Buddha',
  ),
  Quote(
    text: 'Do what you can, with what you have, where you are.',
    author: 'Theodore Roosevelt',
  ),
  Quote(
    text: 'Well done is better than well said.',
    author: 'Benjamin Franklin',
  ),
  Quote(
    text: 'The best way to predict the future is to create it.',
    author: 'Peter Drucker',
  ),
  Quote(
    text: 'Action is the foundational key to all success.',
    author: 'Pablo Picasso',
  ),
  Quote(
    text: 'Simplicity is the ultimate sophistication.',
    author: 'Leonardo da Vinci',
  ),
];
