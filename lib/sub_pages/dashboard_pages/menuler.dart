// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kariyer_simulator/pages/MenuEkran.dart';


class DashboardMenuler extends StatelessWidget {
  const DashboardMenuler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [

              // Sol Taraf
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(() => MenuEkran(menuAdi: 'Görevler',));
                    },
                    child: Row(
                      children: [
                        Text('🗞 ', style: TextStyle(fontSize: 22)),
                        Text('Görevler', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      Get.to(() => MenuEkran(menuAdi: 'Meslekler'));
                    },
                    child: Row(
                      children: [
                        Text('💵 ', style: TextStyle(fontSize: 22)),
                        Text('Meslekler', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap:(){
                      Get.to(() => MenuEkran(menuAdi: 'Eğitim'));
                    },
                    child: Row(
                      children: [
                        Text('👨🏻‍🎓 ', style: TextStyle(fontSize: 22)),
                        Text('Eğitim', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      Get.to(() => MenuEkran(menuAdi: 'Beslenme'));
                    },
                    child: Row(
                      children: [
                        Text('🍔 ', style: TextStyle(fontSize: 22)),
                        Text('Beslenme', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),

              Spacer(),

              // Sağ Taraf
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap:(){
                      Get.to(() => MenuEkran(menuAdi: 'Barınma'));
                    },
                    child: Row(
                      children: [
                        Text('🏘️ ', style: TextStyle(fontSize: 22)),
                        Text('Barınma', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      Get.to(() => MenuEkran(menuAdi: 'Giyim'));
                    },
                    child: Row(
                      children: [
                        Text('👔 ', style: TextStyle(fontSize: 22)),
                        Text('Giyim', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      Get.to(() => MenuEkran(menuAdi: 'İlişki'));
                    },
                    child: Row(
                      children: [
                        Text('👫 ', style: TextStyle(fontSize: 22)),
                        Text('İlişki', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      Get.to(() => MenuEkran(menuAdi: 'Ulaşım'));
                    },
                    child: Row(
                      children: [
                        Text('🚗 ', style: TextStyle(fontSize: 22)),
                        Text('Ulaşım', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
          SizedBox(height: 10),

        ],
      ),
    );
  }
}
