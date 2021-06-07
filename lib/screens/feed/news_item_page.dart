import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mildly_skilled_reader/model/news_item.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsItemPage extends StatefulWidget {
  NewsItemPage(this.newsItem);

  final NewsItem newsItem;

  @override
  _NewsItemPageState createState() => _NewsItemPageState();
}

class _NewsItemPageState extends State<NewsItemPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    _progress = 0;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => Future.value(null),
            child: _controller.isCompleted
                ? Icon(Icons.bookmark_add)
                : CircularProgressIndicator(
                    value: _progress.toDouble(),
                  )),
        appBar: AppBar(
          title: Text(widget.newsItem.title),
          leading: IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: WebView(
              initialUrl: widget.newsItem.link,
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (int progress) {
                setState(() {
                  _progress = progress;
                });
                debugPrint("Loading $progress");
              },
              onWebViewCreated: (WebViewController c) {
                _controller.complete(c);
              },
            ),
          ),
        ),
      );
}
