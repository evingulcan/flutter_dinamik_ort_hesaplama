import 'lesson_data.dart';

double ortalamaHesapla() {
  double toplamNot = 0;
  double toplamKredi = 0;

  DataLessons.tumEklenenDersler.forEach((element) {
    toplamNot = toplamNot + (element.credit * element.letter);
    toplamKredi = toplamKredi + element.credit;
  });

  return toplamNot / toplamKredi;
}
