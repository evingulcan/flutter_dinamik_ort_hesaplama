import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_radius.dart';
import '../../constants/app_padding.dart';
import '../../feature/home/data_help/letters_data.dart';

class DropDownLetterWidget extends StatefulWidget {
  const DropDownLetterWidget({Key? key, required this.onHarfSecildi})
      : super(key: key);
  final Function onHarfSecildi;
  @override
  State<DropDownLetterWidget> createState() => _DropDownLetterWidgetState();
}

class _DropDownLetterWidgetState extends State<DropDownLetterWidget> {
  double secilenHarf = 4;
  int elevationsize = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: PaddingConstant.dropDownPadding,
      decoration: BoxDecoration(
          color: ColorsConstants.blueColor.shade100.withOpacity(0.3),
          borderRadius: RadiusConstant.borderRadius),
      child: DropdownButton<double>(
        value: secilenHarf,
        elevation: elevationsize,
        iconEnabledColor: ColorsConstants.blueColor,
        underline: Container(),
        items: DataLetters.tumDersHarfleri(),
        onChanged: (deger) {
          setState(() {
            secilenHarf = deger!;
            widget.onHarfSecildi(secilenHarf);
            // print(deger);
          });
        },
      ),
    );
  }
}
