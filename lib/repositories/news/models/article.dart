class Article {
  const Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    this.read = false,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  final bool read;
  final String? description;

  Article copyWith({
    String? id,
    String? title,
    DateTime? publicationDate,
    String? imageUrl,
    bool? read,
    String? description,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      publicationDate: publicationDate ?? this.publicationDate,
      imageUrl: imageUrl ?? this.imageUrl,
      read: read ?? this.read,
      description: description ?? this.description,
    );
  }
}
