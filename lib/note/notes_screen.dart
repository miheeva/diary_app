import 'package:flutter/material.dart';
import 'package:diary_app/note/days_view.dart';
import 'package:diary_app/utils/assets.dart';
import 'const.dart';
import 'repository.dart';
import 'package:diary_app/database/provider.dart';
import 'package:diary_app/database/data.dart';
import 'package:diary_app/utils/date.dart';

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
    // final repo = DiaryNoteRepository();
    // repo.list().then((r) {
    //   print(r);
    // });
    // AssetManager(context).load('assets/data/result.json').then((p) {
    //   DBProvider dbProvider = DBProvider.db;
    //   dbProvider.database.then((d) {
    //     DatabaseTables(d).deployNotes(p);
    //   });
    // });
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
        body: Days());
  }

  int _getMonth(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as NotesScreenArguments;
    return args.month;
  }
}

class Days extends StatelessWidget {
  Days({super.key});

  final DiaryNoteRepository _repo = DiaryNoteRepository();
  final DateFormatter _dateFormatter = DateFormatter();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/note');
        },
        child: FutureBuilder<List<DiaryModel>>(
          future: _repo.list(),
          builder: ((context, snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = snapshot.data!.map((e) {
                return ListContainer(
                    header: _dateFormatter.beautifulFormat(e.date), description: e.label
                    );
              }).toList();
              return ListView(children: children);
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Загрузка...'),
                ),
              ];
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ));
            }
          }),
        ),
      ),
    );
  }
}
