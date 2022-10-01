// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kariyer_simulator/components/widget.dart';
import 'package:kariyer_simulator/src/secim_islemleri.dart';

class DashboardCanBilgiYukselt extends StatefulWidget {
  const DashboardCanBilgiYukselt({Key? key}) : super(key: key);

  @override
  State<DashboardCanBilgiYukselt> createState() => _DashboardCanBilgiYukseltState();
}

class _DashboardCanBilgiYukseltState extends State<DashboardCanBilgiYukselt> {

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
              Text('🙂 +10  ❤ +10', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              Spacer(),
              GestureDetector(
                onTap: (){SecimIslemleri().hayatDegeriArttir(10, 10, 50);},
                child: butonContainer('₺ 50', Colors.lightBlueAccent, 0.25),
              )
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Text('🙂 +25  ❤ +25', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              Spacer(),
              GestureDetector(
                onTap: (){SecimIslemleri().hayatDegeriArttir(25, 25, 100);},
                child: butonContainer('₺ 100', Colors.lightBlueAccent, 0.25),
              )
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Text('🙂 +50  ❤ +50', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              Spacer(),
              GestureDetector(
                onTap: (){SecimIslemleri().hayatDegeriArttir(50, 50, 150);},
                child: butonContainer('₺ 150', Colors.lightBlueAccent, 0.25),
              )
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Text('🙂 +75  ❤ +75', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              Spacer(),
              GestureDetector(
                onTap: (){SecimIslemleri().hayatDegeriArttir(75, 75, 200);},
                child: butonContainer('₺ 200', Colors.lightBlueAccent, 0.25),
              )
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Text('🙂 +100  ❤ +100', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              Spacer(),
              GestureDetector(
                onTap: (){SecimIslemleri().hayatDegeriArttir(100, 100, 250);},
                child: butonContainer('₺ 250', Colors.lightBlueAccent, 0.25),
              )
            ],
          ),
        ],
      ),
    );
  }
}
