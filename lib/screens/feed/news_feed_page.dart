import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mildly_skilled_reader/model/user_feed.dart';
import 'package:mildly_skilled_reader/provider/news_providers.dart';
import 'package:mildly_skilled_reader/screens/feed/news_tile.dart';

class NewsFeedPage extends ConsumerWidget {
  const NewsFeedPage(this.feed);

  final Feed feed;
  @override
  Widget build(BuildContext context, ScopedReader watch) => SliverList(
          delegate: SliverChildListDelegate(
        watch(newsFeedProvider(feed.id)).when(
            error: (error, stack) {
              return [Icon(Icons.dangerous_sharp)];
            },
            loading: () => [CircularProgressIndicator()],
            data: (newsFeed) =>
                <Widget>[
                  ListTile(
                    onTap: () => Navigator.pop(context),
                    title: Text(
                      "Currently Reading news from: ${feed.name}",
                      style: TextStyle(color: Colors.cyanAccent, fontSize: 14),
                    ),
                    leading: Icon(Icons.arrow_back),
                  ),
                ] +
                newsFeed.newsItems
                    .map((newsItem) => NewsTile(newsItem))
                    .toList()),
      ));
}
