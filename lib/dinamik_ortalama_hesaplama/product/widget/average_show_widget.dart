import 'package:flutter/material.dart';

import '../../constants/app_strings.dart';
import '../../constants/app_textstyle.dart';

class AverageShowWidget extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const AverageShowWidget(
      {Key? key, required this.ortalama, required this.dersSayisi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders Girildi' : 'Ders Seciniz',
          style: TextStyleConstants.lessonStyle,
        ),
        Text(
          ortalama >= 0 ? ortalama.toStringAsFixed(2) : '0.0',
          style: TextStyleConstants.averageStyle,
        ),
        Text(
          StringConstants.ortText,
          style: TextStyleConstants.lessonStyle,
        ),
      ],
    );
  }
}
