import 'package:flutter/material.dart';
import 'package:diary_app/note/days_view.dart';

class Note extends StatelessWidget {
  const Note({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          centerTitle: false,
          title: RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                text: '16 марта',
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
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              'Положительная энергия',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500
              )
            )
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
              // ignore: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings
              'Так просто оглядываться вокруг и замечать что плохо.\n' +
              'Требуется практика, чтобы замечать, что хорошо. \n' +
              'Многие из нас жили окруженные негативом в течение многих лет.' +
              'Мы стали совершенны в навешивании ярлыков, что есть плохого в других людях,' +
              'в нашей жизни, работе, текущем дне, взаимоотношениях, в нас самих, ' +
              'в нашем поведении, в нашем выздоровлении. \n' +
              'Мы хотим быть реалистами, и наша цель - правильно распознавать реальность.' +
              'Однако, часто мы не намерены проживать негатив. ' + 
              'Целью негатива часто является разрушение. \n' + 
              'Негативное мышление питает проблему. Оно лишает нас гармонии. \n' + 
              'Негативная энергия разрушает. Она имеет свою собственную властную жизнь. ' + 
              'Также и позитивная энергия. \n' + 
              'Каждый день мы можем искать правильное и хорошее в других людях, ' + 
              'нашей жизни, работе, текущем дне, в наших взаимоотношениях, в себе, ' + 
              'в нашем поведении, в нашем выздоровлении. ' + 
              'Позитивная энергия лечит, ведет к любви и преобразует. ' + 
              'Выбирайте позитивную энергию. \n' +
              '\n' +  
              'Сегодня, Господи, помоги мне отпустить негатив. ' + 
              'Преобразуй суть моих убеждений и мыслей из негативной в позитивную. ' + 
              'Позволь мне гармонично жить с хорошим.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          )
        ),),
            ),

          
        ],
      ),
    );
  }
}
