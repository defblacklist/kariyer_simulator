// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kariyer_simulator/components/colors.dart';
import 'package:kariyer_simulator/components/widget.dart';
import 'package:kariyer_simulator/helpers/admob.dart';
import 'package:kariyer_simulator/helpers/getx_controller.dart';
import 'package:kariyer_simulator/helpers/storage.dart';
import 'package:kariyer_simulator/sub_pages/dashboard_pages/menuler.dart';
import 'package:kariyer_simulator/sub_pages/dashboard_pages/profil_hayat_degeri_bilgileri.dart';
import 'package:kariyer_simulator/sub_pages/dashboard_pages/profil_hayat_degeri_yukselt.dart';
import 'package:kariyer_simulator/sub_pages/dashboard_pages/tarih_degistir_buton.dart';
import 'package:kariyer_simulator/sub_pages/dashboard_pages/ust_menu.dart';
import 'package:kariyer_simulator/sub_pages/dashboard_pages/profil_bilgileri.dart';

class DashboardEkran extends StatefulWidget {
  const DashboardEkran({Key? key}) : super(key: key);

  @override
  State<DashboardEkran> createState() => _DashboardEkranState();
}

class _DashboardEkranState extends State<DashboardEkran> {

  AdmobHelper admobHelper = AdmobHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    admobHelper.odulluReklamOlustur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DashboardUstMenu(),
                SizedBox(height: 8),
                DashboardProfilBilgileri(),
                SizedBox(height: 8),
                DashboardMenuler(),
                GestureDetector(
                  onTap: (){
                    admobHelper.odulluReklamGoster();
                  },
                  child: butonContainer('Ücretsiz  +₺500 Kazan', Colors.green, 1),
                ),
                SizedBox(height: 16),
                DashboardCanBilgiYukselt(),
                SizedBox(height: 20,),
                //Spacer(),
                TarihDegistirButon(),
                SizedBox(height: 10),
                ProfilCanBilgileriBar(),
              ],
            ),

          ),
        ),


      ),

    );
  }


}
