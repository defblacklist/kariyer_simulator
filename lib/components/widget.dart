// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kariyer_simulator/helpers/listeler.dart';
import 'package:kariyer_simulator/helpers/storage.dart';
import 'package:kariyer_simulator/src/secim_islemleri.dart';

KisiBilgileri _kisiBilgileri = KisiBilgileri();

Container butonContainer(String yazi, Color renk, double wSize) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: Get.width*wSize,
    ),

    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(color: renk, borderRadius: BorderRadius.circular(10)),
    child: Text(yazi, style: GoogleFonts.poppins(fontWeight: FontWeight.w400, color: Colors.white),),
  );
}

InputDecoration textFieldDecoration(){
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),

    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
          color: Colors.white),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    ),

  );
}

Row profilDuzenleMenu(String baslik) {
  return Row(
    children: [
      Text(baslik, style: GoogleFonts.poppins(fontSize: 15)),
      Spacer(),
      Icon(Icons.keyboard_arrow_right),
    ],
  );
}

Future<dynamic> getDialog(String title, String middleText, String textConfirm) {
  return Get.defaultDialog(
    title: title,
    middleText: middleText,
    textConfirm: textConfirm,
    confirmTextColor: Colors.white,
    onConfirm: (){Get.back();},
  );
}

Future<dynamic> meslekSecimShowDialog(context, String meslekKategori, String meslekAdi, int ucret, int barinmaGereksinimId, String barinmaGereksinimText, int giyimGereksinimId, String giyimGereksinimText, int iliskiGereksinimId, String iliskiGereksinimText, int ulasimGereksinimId, String ulasimGereksinimText, int egitimGereksinimId, String egitimGereksinimText, int beslenmeGereksinimId, String beslenmeGereksinimText,){
  return showDialog(context: context,
    builder: (context) => AlertDialog(
      content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Meslek Gereksinimleri', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),

              _kisiBilgileri.barinma.read('barinmaId') >= barinmaGereksinimId ?
                Text('Barınma: $barinmaGereksinimText+', style: TextStyle(color: Colors.green)) :
                Text('Barınma: $barinmaGereksinimText+', style: TextStyle(color: Colors.red)),

              _kisiBilgileri.giyim.read('giyimId') >= giyimGereksinimId ?
              Text('Giyim: $giyimGereksinimText+', style: TextStyle(color: Colors.green)) :
              Text('Giyim: $giyimGereksinimText+', style: TextStyle(color: Colors.red)),

              _kisiBilgileri.iliski.read('iliskiId') >= iliskiGereksinimId ?
              Text('İlişki: $iliskiGereksinimText+', style: TextStyle(color: Colors.green)) :
              Text('İlişki: $iliskiGereksinimText+', style: TextStyle(color: Colors.red)),

              _kisiBilgileri.ulasim.read('ulasimId') >= ulasimGereksinimId ?
              Text('Ulaşım: $ulasimGereksinimText+', style: TextStyle(color: Colors.green)) :
              Text('Ulaşım: $ulasimGereksinimText+', style: TextStyle(color: Colors.red)),

              _kisiBilgileri.egitim.read('egitimId') >= egitimGereksinimId ?
              Text('Eğitim: $egitimGereksinimText+', style: TextStyle(color: Colors.green)) :
              Text('Eğitim: $egitimGereksinimText+', style: TextStyle(color: Colors.red)),

              _kisiBilgileri.beslenme.read('beslenmeId') >= beslenmeGereksinimId ?
              Text('Beslenme: $beslenmeGereksinimText+', style: TextStyle(color: Colors.green)) :
              Text('Beslenme: $beslenmeGereksinimText+', style: TextStyle(color: Colors.red)),

              SizedBox(height: 10),
              GestureDetector(
                onTap: (){
                  Get.back();
                  // Eger tum sartlar uyuyorsa mesleği seçtir:
                  if(
                    _kisiBilgileri.barinma.read('barinmaId') >= barinmaGereksinimId &&
                    _kisiBilgileri.giyim.read('giyimId') >= giyimGereksinimId &&
                    _kisiBilgileri.iliski.read('iliskiId') >= iliskiGereksinimId &&
                    _kisiBilgileri.ulasim.read('ulasimId') >= ulasimGereksinimId &&
                    _kisiBilgileri.egitim.read('egitimId') >= egitimGereksinimId &&
                    _kisiBilgileri.beslenme.read('beslenmeId') >= beslenmeGereksinimId
                  ){
                    SecimIslemleri().meslekSecim(meslekAdi,ucret);
                    getDialog('İşlem Başarılı!', 'Mesleği seçtin.', 'Tamam');
                  }else{
                    getDialog('İşlem Başarısız!', 'Meslek gereksinimlerini tamamlamıyorsun.', 'Tamam');
                  }

                },
                child: butonContainer('Seç', Colors.blue, 1),
              )
            ],
          )
      ),
    ),
  );
}

Future<dynamic> egitimSecimShowDialog(context, int secilenEgitimId, int gerekenEgitimId, String gerekenEgitimText,String egitimAd, int ucret, int sure){
  return showDialog(context: context,
    builder: (context) => AlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Eğitim Gereksinimleri', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),

            _kisiBilgileri.egitim.read('egitimId') >= gerekenEgitimId ?
            Text('Eğitim: $gerekenEgitimText+', style: TextStyle(color: Colors.green)) :
            Text('Eğitim: $gerekenEgitimText+', style: TextStyle(color: Colors.red)),

            SizedBox(height: 10),
            GestureDetector(
              onTap:(){
                Get.back();
                // Eger tum sartlar uyuyorsa eğtimi seçtir:
                if(
                _kisiBilgileri.barinma.read('egitimId') >= gerekenEgitimId){
                  SecimIslemleri().egitimSecim(secilenEgitimId, egitimAd, ucret, sure);
                  getDialog('İşlem Başarılı!', 'Eğitimi seçtin.', 'Tamam');
                }else{
                  getDialog('İşlem Başarısız!', 'Eğitim gereksinimlerini tamamlamıyorsun.', 'Tamam');
                }




              },
              child: butonContainer('Seç', Colors.blue, 1),
            ),
          ],
        ),
      ),
    ),
  );
}

