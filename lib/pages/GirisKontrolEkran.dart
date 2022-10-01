// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:kariyer_simulator/helpers/storage.dart';
import 'package:kariyer_simulator/pages/Dashboard.dart';
import 'package:kariyer_simulator/pages/ProfilOlusturEkran.dart';

class GirisKontrolEkran extends StatefulWidget {
  const GirisKontrolEkran({Key? key}) : super(key: key);

  @override
  State<GirisKontrolEkran> createState() => _GirisKontrolEkranState();
}

class _GirisKontrolEkranState extends State<GirisKontrolEkran> {

  final ProfilBilgileri _profilBilgileri = ProfilBilgileri();
  bool zatenProfilVar = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    islemBekle();
  }

  islemBekle()async{
    await kayitKontrol();
  }


  Future<void> kayitKontrol() async{
    if(_profilBilgileri.profilOlusturuldu.read('profil') == true){
      setState(() {
        zatenProfilVar = true;
      });
    }else{
      setState(() {
        zatenProfilVar = false;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return zatenProfilVar == true ? DashboardEkran() : ProfilOlusturEkran();
  }
}
