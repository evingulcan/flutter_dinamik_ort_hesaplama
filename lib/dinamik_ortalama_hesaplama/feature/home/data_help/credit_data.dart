import 'package:flutter/material.dart';

class DataCredit {
  static List<DropdownMenuItem<double>> tumKrediler() {
    return List.generate(10, (index) => (index + 1))
        .toList()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }
}
