class Lessons {
  late final String name;
  late final double letter;
  late final double credit;

  Lessons({required this.name, required this.letter, required this.credit});

  @override
  String toString() {
    return ' $name $letter $credit';
  }
}
