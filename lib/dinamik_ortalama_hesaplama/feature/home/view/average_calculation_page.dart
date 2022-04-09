import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_radius.dart';
import '../../../constants/app_padding.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyle.dart';
import '../../../product/widget/average_show_widget.dart';
import '../../../product/widget/credit_dropdown_widget.dart';
import '../../../product/widget/lesson_list_widget.dart';
import '../../../product/widget/letter_dropdown_widget.dart';
import '../data_help/average_calculation_data.dart';
import '../data_help/lesson_data.dart';
import '../model/lessons_model.dart';

class AverageCalculationApp extends StatefulWidget {
  const AverageCalculationApp({Key? key}) : super(key: key);

  @override
  State<AverageCalculationApp> createState() => _AverageCalculationAppState();
}

var formKey = GlobalKey<FormState>();
double secilenHarf = 4;
double secilenKredi = 1;
String girilenDersAdi = '';
double elevationsize = 0;

class _AverageCalculationAppState extends State<AverageCalculationApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: elevationsize,
        title: Text(StringConstants.tittleText,
            style: TextStyleConstants.tittleStyle),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Form
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: AverageShowWidget(
                  dersSayisi: DataLessons.tumEklenenDersler.length,
                  ortalama: ortalamaHesapla(),
                ),
              ),
            ],
          ),
          //List
          Expanded(
            child: LessonListWidget(
              onElemanCikarildi: (index) {
                DataLessons.tumEklenenDersler.removeAt(index);
                setState(() {});
                // print('Eleman cıkarıldı. $index');
              },
            ),
          ),
        ],
      ),
    );
  }

  Form _buildForm() {
    double size = 30;
    return Form(
      key: formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: PaddingConstant.horizontalPadding,
              child: _buildTextFormField(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: PaddingConstant.horizontalPadding,
                    child: DropDownLetterWidget(
                      onHarfSecildi: (harf) {
                        secilenHarf = harf;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: PaddingConstant.horizontalPadding,
                    child: CreditDropDownWidget(onKrediSecildi: (kredi) {
                      secilenKredi = kredi;
                    }),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var eklenecekDers = Lessons(
                        name: girilenDersAdi,
                        letter: secilenHarf,
                        credit: secilenKredi,
                      );
                      DataLessons.dersEkle(eklenecekDers);
                      ortalamaHesapla();
                      setState(() {});
                    }
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: ColorsConstants.blueColor,
                    size: size,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
          ]),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        girilenDersAdi = deger!;
      },
      validator: (s) {
        if (s!.isEmpty) {
          return StringConstants.bosText;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: StringConstants.hintText,
          border: OutlineInputBorder(
            borderRadius: RadiusConstant.borderRadius,
            borderSide: BorderSide(
              width: MediaQuery.of(context).size.width * 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: ColorsConstants.blueColor.shade100.withOpacity(0.3)),
    );
  }
}
