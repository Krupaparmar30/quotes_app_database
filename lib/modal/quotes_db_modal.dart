// class QuotesDbModal {
//   // late String message;
//    List<Quotes> quote=[];
//
//   QuotesDbModal({ required this.quote});
//
//   factory QuotesDbModal.fromMap(Map m1) {
//     return QuotesDbModal(
//
//         quote: (m1['Quotes'] as List).map((e) => Quotes.fromMap(e)).toList());
//   }
// }
//
// class Quotes {
//   late int id;
//   late String category, quote, author, description;
//
//   Quotes(
//       {required this.id,
//       required this.category,
//       required this.quote,
//       required this.author,
//       required this.description});
//
//   factory Quotes.fromMap(Map m1) {
//     return Quotes(
//         id: m1['id'],
//         category: m1['category'],
//         quote: m1['quote'],
//         author: m1['author'],
//         description: m1['description']);
//   }
// }

// class Quotes {
//   late String quote, author, cate, like;
//
//   Quotes(
//       {required this.quote,
//       required this.author,
//       required this.cate,
//       required this.like});
//
//   factory Quotes.fromMap(Map m1) {
//     return Quotes(
//         quote: m1['quote'],
//         author: m1['author'],
//         cate: m1['cate'],
//         like: m1['like']);
//   }
// }
class Quote {
  int? id;
  String text;
  String author;
  String cate;
  String liked;

  Quote({this.id, required this.text, required this.author,required this.liked,required this.cate });

  Map<String, dynamic> toMap() {
    return {
      'cate':cate,
      'id': id,
      'text': text,
      'author': author,
      'liked': liked ,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['id'],
      cate: map['cate'],
      text: map['quote'],
      author: map['author'],
      liked: map['like'],
    );
  }
}