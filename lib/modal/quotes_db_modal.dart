class QuotesDbModal {
  // late String message;
   List<Quotes> quote=[];

  QuotesDbModal({ required this.quote});

  factory QuotesDbModal.fromMap(Map m1) {
    return QuotesDbModal(

        quote: (m1['Quotes'] as List).map((e) => Quotes.fromMap(e)).toList());
  }
}

class Quotes {
  late int id;
  late String category, quote, author, description;

  Quotes(
      {required this.id,
      required this.category,
      required this.quote,
      required this.author,
      required this.description});

  factory Quotes.fromMap(Map m1) {
    return Quotes(
        id: m1['id'],
        category: m1['category'],
        quote: m1['quote'],
        author: m1['author'],
        description: m1['description']);
  }
}
