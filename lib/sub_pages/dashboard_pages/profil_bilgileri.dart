// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kariyer_simulator/helpers/getx_controller.dart';
import 'package:kariyer_simulator/helpers/storage.dart';

class DashboardProfilBilgileri extends StatelessWidget {
  DashboardProfilBilgileri({Key? key}) : super(key: key);

  final kisiBilgiController = Get.put(KisiBilgiController());
  final KisiBilgileri _kisiBilgileri = KisiBilgileri();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),

      child: Column(
        children: [
          Row(
            children: [
              Text('${_kisiBilgileri.isim.read('isim')}', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              Spacer(),
              GetBuilder<KisiBilgiController>(
                  builder: (_) => Text('₺ ${kisiBilgiController.para}', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.yellow))
              ),
            ],
          ),
          Row(
            children: [
              GetBuilder<KisiBilgiController>(
                builder: (_) => Text('${kisiBilgiController.meslek}', style: GoogleFonts.poppins(fontSize: 14, color: Colors.white)),
              ),
              Spacer(),
              GetBuilder<KisiBilgiController>(
                  builder: (_) => Text('${kisiBilgiController.yil}Yıl ${kisiBilgiController.ay}Ay', style: GoogleFonts.poppins(fontSize: 14, color: Colors.white))
              ),

            ],
          ),
        ],
      ),
    );
  }
}
