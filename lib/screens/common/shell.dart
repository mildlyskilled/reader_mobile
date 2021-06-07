import 'package:flutter/material.dart';

class Shell extends StatelessWidget {
  Shell(this.content);
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: content);
  }
}
