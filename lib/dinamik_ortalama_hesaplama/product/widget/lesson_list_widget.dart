import 'package:flutter/material.dart';

import '../../constants/app_strings.dart';
import '../../constants/app_textstyle.dart';
import '../../feature/home/data_help/lesson_data.dart';
import '../../feature/home/model/lessons_model.dart';

class LessonListWidget extends StatelessWidget {
  final Function onElemanCikarildi;
  const LessonListWidget({Key? key, required this.onElemanCikarildi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lessons> tumDersler = DataLessons.tumEklenenDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onElemanCikarildi(index);
                },
                //UniqueKey() = Her bir eleman birbirinden farklı olması adına mutlaka bizden bir key isteniyor.
                //Birbirinden farklı olması için  Flutter bize UniqueKey diye bir sınıf  veriyor.
                //Bu ne yapıyor Listenize eklenen her bir elemana  birbirinden farklı keyler atıyor.
                key: UniqueKey(),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Center(
                          child: Text(
                        tumDersler[index].name,
                        style: TextStyleConstants.dersStyle,
                      )),
                      subtitle: Center(
                        child: Text(
                          '${tumDersler[index].credit} Kredi, Not Değeri ${tumDersler[index].letter}',
                          style: TextStyleConstants.notStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            margin: const EdgeInsets.all(24),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  StringConstants.lutfenText,
                  style: TextStyleConstants.tittleStyle,
                )),
              ),
            ),
          );
  }
}
