import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mildly_skilled_reader/provider/shared_preferences.provider.dart';
import 'package:mildly_skilled_reader/screens/common/sliver_shell.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home/front_matter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [sharedPreferencesProvider.overrideWithValue(sharedPrefs)],
    child: MildlySkilledReader(),
  ));
}

class MildlySkilledReader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MildlySkilled Reader',
      home: SliverShell(
        FrontMatter(),
      ),
      theme: ThemeData.dark().copyWith(textTheme: GoogleFonts.latoTextTheme()),
      themeMode: ThemeMode.system,
    );
  }
}
