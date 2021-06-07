class NewsItem {
  NewsItem(this.title, this.description, this.feed, this.pubDate, this.link,
      {this.readAt});

  factory NewsItem.fromJson(Map<String, dynamic> json) => NewsItem(
        json["title"],
        json["description"],
        json["feed"],
        json["pubDate"],
        json["link"],
        readAt: json["readAt"],
      );

  String title;
  String description;
  String feed;
  String pubDate;
  String link;
  String? readAt;
}
