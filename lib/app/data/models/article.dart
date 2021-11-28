class Article {
  String? id;
  String? authorName;
  String? releaseDate;
  String? imageUrl;
  String? sourceUrl;
  String? title;
  String? description;

  Article({
    this.id,
    this.authorName,
    this.releaseDate,
    this.imageUrl,
    this.sourceUrl,
    this.title,
    this.description,
  });

  Article.fromSnapshot(String snapshotId, Map<String, dynamic> snapshot) {
    id = snapshotId;
    authorName = snapshot['author_name'];
    releaseDate = snapshot['release_date'];
    imageUrl = snapshot['image_url'];
    sourceUrl = snapshot['source_url'];
    title = snapshot['title'];
    description = snapshot['description'];
  }
}
