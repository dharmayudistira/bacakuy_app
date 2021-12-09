class Quote {
  String? quote;

  Quote({this.quote});

  Quote.fromSnapshot(Map<String, dynamic> snapshot) {
    quote = snapshot["quote"];
  }
}
