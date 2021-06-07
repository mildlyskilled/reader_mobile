import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mildly_skilled_reader/model/user_feed.dart';
import 'package:mildly_skilled_reader/provider/news_providers.dart';
import 'package:mildly_skilled_reader/screens/feed/feed_tile.dart';

class FrontMatter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) => SliverList(
          delegate: SliverChildListDelegate(
        watch(userFeedProvider).when(
            error: (error, stack) => [Icon(Icons.dangerous_sharp)],
            loading: () => [CircularProgressIndicator()],
            data: (feed) => feed.sections
                .expand((section) => parseSection(section))
                .toList()),
      ));

  List<Widget> parseSection(Section section) => section.feeds.isNotEmpty
      ? <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8.0, bottom: 8.0),
              child: Text(
                section.name,
                style: TextStyle(color: Colors.cyanAccent, fontSize: 16),
              ),
            )
          ] +
          section.feeds.map((feed) => FeedTile(feed)).toList()
      : [];
}
