import 'package:flutter/material.dart';
import 'package:diary_app/note/days_view.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          centerTitle: false,
          title: RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                text: 'Январь',
                style: TextStyle(
                    overflow: TextOverflow.visible,
                    height: 1.2,
                    fontSize: 38,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onPrimary),
              )),
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
        ),
        body: const Days());
  }
}

class Days extends StatelessWidget {
  const Days({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/note');
        },
        child: ListView(
      children: const [
        ListContainer(header: '1 янsваря', description: 'Какой-то заголовок'),
        ListContainer(header: '1 января', description: 'Какой-то заголовок')
      ],

    ),
      ),
    );
  }
}
