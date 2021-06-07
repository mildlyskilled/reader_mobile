class Feed {
  Feed(
    this.id,
    this.name,
    this.title,
    this.type,
    this.xmlUrl,
    this.htmlUrl,
    this.icon,
  );

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        json["id"],
        json["name"],
        json["title"],
        json["type"],
        json["xmlUrl"],
        json["htmlUrl"],
        json["icon"],
      );

  String id;
  String name;
  String title;
  String type;
  String? xmlUrl;
  String? htmlUrl;
  String? icon;
}

class Section {
  Section(
    this.id,
    this.name,
    this.owner,
    this.created,
    this.updated,
    this.feeds,
  );

  factory Section.fromJson(Map<String, dynamic> json) => Section(
      json["id"],
      json["name"],
      json["owner"],
      json["created"],
      json["updated"],
      List<Feed>.from(
          json['feeds'].map((dynamic feed) => Feed.fromJson(feed)).toList()));
  String id;
  String name;
  String owner;
  String created;
  String? updated;
  List<Feed> feeds;
}

class UserFeed {
  UserFeed(
    this.name,
    this.sections,
  );

  factory UserFeed.fromJson(Map<String, dynamic> json) => UserFeed(
      json["name"],
      List<Section>.from(json['sections']
          .map((dynamic section) => Section.fromJson(section))
          .toList()));

  String name;
  List<Section> sections;
}
