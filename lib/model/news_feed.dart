import 'package:mildly_skilled_reader/model/news_item.dart';

class NewsFeed {
  NewsFeed(this.id, this.name, this.title, this.type, this.xmlUrl, this.htmlUrl,
      this.icon, this.newsItems);

  factory NewsFeed.fromJson(Map<String, dynamic> json) => NewsFeed(
        json["id"],
        json["name"],
        json["title"],
        json["type"],
        json["xmlUrl"],
        json["htmlUrl"],
        json["icon"],
        List<NewsItem>.from(json['newsItems']
            .map((dynamic newsItem) => NewsItem.fromJson(newsItem))
            .toList()),
      );
  String id;
  String name;
  String title;
  String type;
  String xmlUrl;
  String htmlUrl;
  String? icon;
  List<NewsItem> newsItems;
}
