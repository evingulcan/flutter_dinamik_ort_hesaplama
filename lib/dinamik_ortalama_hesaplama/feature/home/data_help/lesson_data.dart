import '../model/lessons_model.dart';

class DataLessons {
  static List<Lessons> tumEklenenDersler = [];

  static dersEkle(Lessons lesson) {
    tumEklenenDersler.add(lesson);
  }
}
