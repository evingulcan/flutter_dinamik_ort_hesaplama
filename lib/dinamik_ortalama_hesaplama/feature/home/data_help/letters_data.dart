import 'package:flutter/material.dart';

class DataLetters {
  static List<String> _createDersHarfNotlari() {
    return [
      'AA',
      'BA',
      'BB',
      'CB',
      'CC',
      'DC',
      'DD',
      'FD',
      'FF',
    ];
  }

  static double _harfiNotaCevir(String letter) {
    switch (letter) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDersHarfleri() {
    return _createDersHarfNotlari()
        .map(
          (e) => DropdownMenuItem<double>(
            child: Text(e),
            value: _harfiNotaCevir(e),
          ),
        )
        .toList();
  }
}
