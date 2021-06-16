import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:photo_album_lab8/screen/home_screen.dart';
import 'package:photo_album_lab8/screen/upload_screen.dart';
import 'package:photo_album_lab8/blocs/theme.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
              child: MaterialAppWithTheme(),
              // child: MaterialApp(
              //   title: 'Flutter Demo',
              //   theme: ThemeData(
              //     primarySwatch: Colors.blue,
              //     visualDensity: VisualDensity.adaptivePlatformDensity,
              //   ),
              //   home: HomeScreen()
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      home: HomeScreen(),
      theme: theme.getTheme(),
    );
  }
}

