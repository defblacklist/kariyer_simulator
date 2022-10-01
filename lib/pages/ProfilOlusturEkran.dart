// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kariyer_simulator/components/colors.dart';
import 'package:kariyer_simulator/components/widget.dart';
import 'package:kariyer_simulator/pages/Dashboard.dart';
import 'package:kariyer_simulator/src/profil_islemler.dart';

class ProfilOlusturEkran extends StatefulWidget {
  const ProfilOlusturEkran({Key? key}) : super(key: key);

  @override
  State<ProfilOlusturEkran> createState() => _ProfilOlusturEkranState();
}

class _ProfilOlusturEkranState extends State<ProfilOlusturEkran> {

  TextEditingController isimTextEditKontrol = TextEditingController();
  final formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Form(
              key: formKey,
              child: Column(
                children: [
                  Text('Karakter Adı', style: GoogleFonts.poppins(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold)),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z 0-9 şıüğöç]')),
                    ],
                    controller: isimTextEditKontrol,
                    decoration: textFieldDecoration(),
                  ),
                  SizedBox(height: 20),

                  GestureDetector(
                    onTap: (){
                      ProfilIslemler().profilOlustur(isimTextEditKontrol);
                      Get.to(() => DashboardEkran());
                    },
                    child: butonContainer('Başla', Colors.green, 0.5),
                  )

                ],
              ),
            ),




          ],
        ),
      ),

    );
  }
}
