import 'package:flutter/material.dart';


class MounthGrid extends StatelessWidget {
  const MounthGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> text = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    return Scaffold(
        body: GridView.count(
            crossAxisCount: 2,
            children: 
            List.generate(12, (index) {
              return Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/days');
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
                          child: const Align(
                              child: Text(
                            'Январь',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )))));
            })));
  }
}
