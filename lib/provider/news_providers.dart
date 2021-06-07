import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mildly_skilled_reader/model/news_feed.dart';
import 'package:mildly_skilled_reader/model/user_feed.dart';

final userFeedProvider = FutureProvider<UserFeed>((ref) async {
  return rootBundle.loadString('assets/json/news_feed.json').then((userFeed) {
    return UserFeed.fromJson(json.decode(userFeed));
  });
});

final newsFeedProvider =
    FutureProvider.family<NewsFeed, String>((ref, id) async {
  return rootBundle.loadString('assets/json/bbc_feed.json').then((newsFeed) {
    return NewsFeed.fromJson(json.decode(newsFeed));
  });
});
