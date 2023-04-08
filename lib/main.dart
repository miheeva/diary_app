import 'package:flutter/material.dart';
import 'package:diary_app/note/month_view.dart';
import 'package:diary_app/note/notes_screen.dart';
import 'package:diary_app/note/note_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/days':(context) => Notes(),
        '/note':(context) => Note()
      },
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(115, 79, 150, 1),
          colorScheme: const ColorScheme(
            background: Color.fromRGBO(255, 255, 255, 1),
            primary: Color.fromRGBO(115, 79, 150, 1),
            onPrimary: Colors.black,
            onBackground: Colors.black,
            secondary: Colors.red,
            onSecondary: Colors.white,
            error: Colors.black,
            onError: Colors.white,
            surface: Colors.white,
            onSurface: Colors.orange,
            brightness: Brightness.light,
          )),
      title: 'Flutter layout demo',
      home: const Screen(),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          centerTitle: false,
          title: RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                text: 'Ежедневник \nМелоди \nБитти',
                style: TextStyle(
                    overflow: TextOverflow.visible,
                    height: 1.2,
                    fontSize: 38,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.error),
              )),
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
        ),
        body: const MounthGrid());
  }
}