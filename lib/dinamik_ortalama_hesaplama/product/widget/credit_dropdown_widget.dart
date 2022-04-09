import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_radius.dart';
import '../../constants/app_padding.dart';
import '../../feature/home/data_help/credit_data.dart';

class CreditDropDownWidget extends StatefulWidget {
  CreditDropDownWidget({Key? key, required this.onKrediSecildi})
      : super(key: key);
  final Function onKrediSecildi;
  @override
  State<CreditDropDownWidget> createState() => _CreditDropDownWidgetState();
}

class _CreditDropDownWidgetState extends State<CreditDropDownWidget> {
  double secilenKredi = 1;
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
        value: secilenKredi,
        elevation: elevationsize,
        iconEnabledColor: ColorsConstants.blueColor,
        underline: Container(),
        items: DataCredit.tumKrediler(),
        onChanged: (deger) {
          setState(() {
            secilenKredi = deger!;
            widget.onKrediSecildi(secilenKredi);
            // print(deger);
          });
        },
      ),
    );
  }
}
