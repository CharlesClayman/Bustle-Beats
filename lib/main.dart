import 'package:bustle_beats/screens/artist_profile_screen.dart';
import 'package:bustle_beats/screens/find_song_screen.dart';
import 'package:bustle_beats/screens/login_screen.dart';
import 'package:bustle_beats/screens/playing_song_screen.dart';
import 'package:bustle_beats/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        primaryColor: mainAppColor,
        canvasColor: Colors.transparent,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return FindSongScreen();
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: secondaryAppColor,
                ),
              );
            }
            return const LoginScreen();
          }),
    );
  }
}
