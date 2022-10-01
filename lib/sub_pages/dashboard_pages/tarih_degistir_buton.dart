// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kariyer_simulator/src/profil_islemler.dart';

class TarihDegistirButon extends StatelessWidget {
  const TarihDegistirButon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        ProfilIslemler().tarihDegistir();
      },
      child: Center(
        child: Container(
          height: 60,
          width: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Text('+Tarih'),
        ),
      ),
    );
  }
}
