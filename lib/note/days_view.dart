import 'package:flutter/material.dart';


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

// ignore: camel_case_extensions
extension stringX on String {
  String get overflow => Characters(this)
      .replaceAll(Characters(''), Characters('\u{200B}'))
      .toString();
}
