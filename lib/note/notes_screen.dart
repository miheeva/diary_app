import 'package:flutter/material.dart';
import 'package:diary_app/note/days_view.dart';
import 'const.dart';

class NotesScreenArguments {
  final int month;

  NotesScreenArguments(this.month);
}

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    final month = _getMonth(context);
    final monthName = months[month];
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          centerTitle: false,
          title: RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                text: monthName,
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

  int _getMonth(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NotesScreenArguments;
    return args.month;
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
