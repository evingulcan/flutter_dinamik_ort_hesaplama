import 'package:flutter/material.dart';

import 'dinamik_ortalama_hesaplama/constants/app_colors.dart';
import 'dinamik_ortalama_hesaplama/feature/home/view/average_calculation_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik Ortalama Hesaplama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorsConstants.blueColor,
        // UI'deki bileşenlerin dikey ve yatay "kompaktlığıdır".
        //Diğer ortamlarda da o ortamın  uygun bir şekilde görülmesini sağlayabilir.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AverageCalculationApp(),
    );
  }
}
