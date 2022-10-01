// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kariyer_simulator/pages/ProfilAyarEkran.dart';

class DashboardUstMenu extends StatelessWidget {
  const DashboardUstMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Get.to(() => ProfilAyarEkran());
      },
      child: Icon(Icons.menu, color: Colors.white),
    );
  }
}
