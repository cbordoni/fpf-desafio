class Book {
  final int id;
  final String title;
  final String subtitle;
  final String text;

  const Book({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.text,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: int.parse(json['id']),
      title: json['title'],
      subtitle: json['subtitle'],
      text: json['text'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'text': text,
    };
  }
}
