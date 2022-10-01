// ignore_for_file: prefer_const_constructors, file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kariyer_simulator/components/colors.dart';
import 'package:kariyer_simulator/components/widget.dart';
import 'package:kariyer_simulator/helpers/storage.dart';
import 'package:kariyer_simulator/pages/ProfilOlusturEkran.dart';
import 'package:kariyer_simulator/src/profil_islemler.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilAyarEkran extends StatefulWidget {
  const ProfilAyarEkran({Key? key}) : super(key: key);

  @override
  State<ProfilAyarEkran> createState() => _ProfilAyarEkranState();
}

class _ProfilAyarEkranState extends State<ProfilAyarEkran> {

  final ProfilBilgileri _profilBilgileri = ProfilBilgileri();

  void oyunDiliEkGoster(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // UST ÇİZGİ BÖLÜMÜ
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 75,
                    height: 5,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: Get.width,
                    color: Colors.grey,
                    height: 2,
                  ),
                  SizedBox(height: 10),

                  ///////////////////////////////////////////////////////////////////////////////

                  // FOTOGRAF & VIDEO BOLUMU
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.back();
                          _profilBilgileri.defaultDil.write('key', 'tr');
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/icon/tr-flag.png'),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                          _profilBilgileri.defaultDil.write('key', 'en');
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/icon/en-flag.png'),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20),


                ],
              ),
            ),
          );
        }
    );

  }

  Future bizeUlasin(String link) async{
    if(await canLaunch(link)){
      await launch(link);
    }else{
      debugPrint('link acilmadi');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                ),
                SizedBox(width: 16),
                Text('Ayarlar', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    GestureDetector(
                      onTap: (){
                        oyunDiliEkGoster(context);
                      },
                      child: profilDuzenleMenu('Oyun Dilini Değiştir'),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: (){
                        ProfilIslemler().profilSil();
                        Get.offAll(() => ProfilOlusturEkran());
                      },
                      child: profilDuzenleMenu('Yeni Hayata Başla'),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: (){
                        //
                      },
                      child: profilDuzenleMenu('Arkadaşlarını Davet Et'),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: (){
                        //
                      },
                      child: profilDuzenleMenu('Oyunu Değerlendir'),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: (){
                        bizeUlasin('https://alesia.digital/');
                      },
                      child: profilDuzenleMenu('Bize Ulaş'),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 16,),

              Text('Versiyon: 1.0.0', style: GoogleFonts.poppins(fontSize: 15, color: Colors.white)),

            ],
          ),
        ),
      ),

    );
  }
}
