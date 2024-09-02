
class Quote {

  String text;
  String author;
  String cate;
  String liked;

  Quote({ required this.text, required this.author,required this.liked,required this.cate });

  Map<String, dynamic> toMap() {
    return {
      'cate':cate,

      'text': text,
      'author': author,
      'liked': liked ,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(

      cate: map['cate'],
      text: map['quote'],
      author: map['author'],
      liked: map['like'],
    );
  }
}