import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      body: Scaffold(
          body: GridView.count(
            scrollDirection:,
            crossAxisCount: 2,
            children: List.generate(12, (index) {
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 12,
                      offset: const Offset(0, 6), // changes position of shadow
                    )
                  ],
                ),
                  child: Align(
                    child: Text(
                    'Январь',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center,
                    
                    ),
                  )
                ),);
            }

          )
        
      ))
    );
  }
}

// ignore: camel_case_extensions
extension stringX on String {
  String get overflow => Characters(this)
      .replaceAll(Characters(''), Characters('\u{200B}'))
      .toString();
}

class ListContainer extends StatelessWidget {
  final String header;
  final String description;

  const ListContainer(
      {super.key, required this.header, required this.description});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 100,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 12,
                  offset: const Offset(0, 6), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Flexible(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(header,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(description,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                            overflow: TextOverflow.fade,
                            maxLines: 2))
                  ],
                ))
              ],
            )));
  }
}
