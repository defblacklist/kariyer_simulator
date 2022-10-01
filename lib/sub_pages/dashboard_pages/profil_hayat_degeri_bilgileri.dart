// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kariyer_simulator/helpers/getx_controller.dart';
import 'package:kariyer_simulator/helpers/storage.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfilCanBilgileriBar extends StatefulWidget {
  ProfilCanBilgileriBar({Key? key}) : super(key: key);

  @override
  State<ProfilCanBilgileriBar> createState() => _ProfilCanBilgileriBarState();
}

class _ProfilCanBilgileriBarState extends State<ProfilCanBilgileriBar> {

  final kisiBilgiController = Get.put(KisiBilgiController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('🙂'),
            GetBuilder<KisiBilgiController>(
              builder: (_) => LinearPercentIndicator(
                width: Get.width*0.50,
                lineHeight: 14.0,
                percent: kisiBilgiController.mutluluk/100,
                center: Text("${kisiBilgiController.mutluluk}", style: TextStyle(fontSize: 12.0),),
                backgroundColor: Colors.white,
                progressColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('❤'),
            GetBuilder<KisiBilgiController>(
              builder: (_) => LinearPercentIndicator(
                width: Get.width*0.50,
                lineHeight: 14.0,
                percent: kisiBilgiController.saglik/100,
                center: Text("${kisiBilgiController.saglik}", style: TextStyle(fontSize: 12.0)),
                backgroundColor: Colors.white,
                progressColor: Colors.green,
              ),
            ),

          ],
        ),
      ],
    );
  }
}
