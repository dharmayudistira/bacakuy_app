class Literacy {
  String? id;
  String? bookTitle;
  String? bookImage;
  String? target;
  String? lastPage;

  Literacy({
    this.id,
    this.bookTitle,
    this.bookImage,
    this.target,
    this.lastPage,
  });

  Literacy.fromSnapshot(String snapshotId, Map<String, dynamic> snapshot) {
    id = snapshotId;
    bookTitle = snapshot["book_title"];
    bookImage = snapshot["book_image"];
    target = snapshot["target"];
    lastPage = snapshot["last_page"];
  }
}
