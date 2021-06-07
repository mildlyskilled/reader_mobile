import 'package:flutter/material.dart';
import 'package:mildly_skilled_reader/model/news_item.dart';
import 'package:mildly_skilled_reader/screens/common/shell.dart';
import 'package:mildly_skilled_reader/screens/feed/news_item_page.dart';

class NewsTile extends StatelessWidget {
  const NewsTile(this.newsItem);

  final NewsItem newsItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Shell(NewsItemPage(newsItem)),
        ),
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
                      children: [
                        Expanded(
                          child: Text(
                            newsItem.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.cyanAccent, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        newsItem.description,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        "${newsItem.pubDate}",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
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
