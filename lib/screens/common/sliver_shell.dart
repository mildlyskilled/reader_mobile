import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mildly_skilled_reader/screens/common/side_drawer.dart';

import 'header.dart';

class SliverShell extends ConsumerWidget {
  const SliverShell(this.content);

  final Widget content;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      drawer: SideDrawer(),
      body: SafeArea(
        right: false,
        left: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              flexibleSpace: Header(),
              toolbarHeight: 120.0,
              elevation: 10.0,
              backgroundColor: Colors.green,
              expandedHeight: 120.0,
              snap: false,
              pinned: false,
            ),
            content
          ],
        ),
      ),
    );
  }
}
