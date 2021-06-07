import 'package:flutter/material.dart';
import 'package:mildly_skilled_reader/model/user_feed.dart';
import 'package:mildly_skilled_reader/screens/common/sliver_shell.dart';
import 'package:mildly_skilled_reader/screens/feed/news_feed_page.dart';

class FeedTile extends StatelessWidget {
  const FeedTile(this.feed);

  final Feed feed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SliverShell(NewsFeedPage(feed))),
      ),
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: 100.00,
              height: 100.0,
              child: Icon(Icons.new_releases),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            feed.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.cyanAccent, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Text(
                        feed.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Text(
                      "${feed.type} // 28/05/2021",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
