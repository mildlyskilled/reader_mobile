import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mildly_skilled_reader/model/user_feed.dart';
import 'package:mildly_skilled_reader/provider/news_providers.dart';

class Header extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final AsyncValue<UserFeed> userFeed = watch(userFeedProvider);

    return Stack(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(
            height: 120.0,
          ),
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/reader.jpeg'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        DecoratedBox(
            child: Container(
              constraints: BoxConstraints.expand(),
            ),
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            )),
        Container(
          constraints: BoxConstraints.expand(height: 120),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: CircleAvatar(
                    child: userFeed.when(
                      data: (userFeed) => Text(
                        _formatName(userFeed.name),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      loading: () => Text("U"),
                      error: (err, stack) => Text("ERR"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: userFeed.when(
                    data: (userFeed) => Text(
                      userFeed.name,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    loading: () => Text("Getting User"),
                    error: (err, stack) => Text("Reader Data not Received"),
                  ),
                ),
                Text(
                  DateFormat('d MMM y').format(DateTime.now()),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        offset: Offset(0.3, 0.3),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _formatName(String name) {
    final List<String> nameArray = name.split(" ");
    var initials = "";
    if (nameArray.length > 1) {
      for (name in nameArray) {
        initials += name.substring(0, 1).toUpperCase();
      }
    }
    return initials;
  }
}
