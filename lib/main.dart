import 'package:bustle_beats/screens/find_song_screen.dart';
import 'package:bustle_beats/screens/login_screen.dart';
import 'package:bustle_beats/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.transparent,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: FindSongScreen(),
    );
  }
}
