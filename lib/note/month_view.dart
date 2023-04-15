import 'package:flutter/material.dart';
import 'const.dart';
import 'notes_screen.dart';

class MounthGrid extends StatelessWidget {
  const MounthGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
            crossAxisCount: 2,
            children: months.asMap().entries.map((entry) {
              var mIndex = entry.key;
              var month = entry.value;
              return Center(
                  child: InkWell(
                      onTap: () {
                        final args = NotesScreenArguments(mIndex);
                        Navigator.pushNamed(context, '/days', arguments: args);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(25),
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 12,
                                offset: const Offset(
                                    0, 6), // changes position of shadow
                              )
                            ],
                          ),
                          child: Align(
                            child: Text(
                            month,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )))));
            }).toList()));
  }
}
