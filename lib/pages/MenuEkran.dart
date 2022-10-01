// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kariyer_simulator/components/colors.dart';
import 'package:kariyer_simulator/components/widget.dart';
import 'package:kariyer_simulator/helpers/getx_controller.dart';
import 'package:kariyer_simulator/helpers/listeler.dart';
import 'package:kariyer_simulator/helpers/storage.dart';
import 'package:kariyer_simulator/src/secim_islemleri.dart';

class MenuEkran extends StatefulWidget {
  final String menuAdi;


  MenuEkran({Key? key, required this.menuAdi}) : super(key: key);

  @override
  State<MenuEkran> createState() => _MenuEkranState();
}

class _MenuEkranState extends State<MenuEkran> {
  final KisiBilgileri _kisiBilgileri = KisiBilgileri();
  String? secilenMeslekKategori;

  menuListView(){
    if(widget.menuAdi == 'Görevler'){
      return ListView.builder(
        itemCount: GorevlerListesi().gorev!.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text('${GorevlerListesi().gorev![index].gorevAdi}', style: TextStyle(color: GorevBilgileri().gorevler.read('gorev${index+1}') == true ? Colors.green : Colors.black)),
              leading: GorevBilgileri().gorevler.read('gorev${index+1}') == true ? Icon(Icons.check, color: Colors.green) : Icon(Icons.highlight_off, color: Colors.black54),
              trailing: Text('₺ ${GorevlerListesi().gorev![index].odul}', style: TextStyle(color: GorevBilgileri().gorevler.read('gorev${index+1}') == true ? Colors.green : Colors.black)),
            ),
          );

        },
      );
    }
    else if(widget.menuAdi == 'Meslekler'){
      if(secilenMeslekKategori == null){
        return  Container(
          child: Column(
            children: [
              GestureDetector(
                onTap:(){setState(() {secilenMeslekKategori = 'Servis';});},
                child: butonContainer('Servis', Colors.blue, 1),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap:(){setState(() {secilenMeslekKategori = 'Ofis';});},
                child: butonContainer('Ofis', Colors.blue, 1),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap:(){setState(() {secilenMeslekKategori = 'Bilgi Teknolojileri';});},
                child: butonContainer('Bilgi Teknolojileri', Colors.blue, 1),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap:(){setState(() {secilenMeslekKategori = 'Finans';});},
                child: butonContainer('Finans', Colors.blue, 1),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap:(){setState(() {secilenMeslekKategori = 'İşletme Sahipliği';});},
                child: butonContainer('İşletme Sahipliği', Colors.blue, 1),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap:(){setState(() {secilenMeslekKategori = 'Devlet Yönetimi';});},
                child: butonContainer('Devlet Yönetimi', Colors.blue, 1),
              ),
            ],
          ),
        );
      }
      else{
        return  Column(
          children: [
            GestureDetector(
              onTap:(){setState(() {
                secilenMeslekKategori = null;
              });},
              child: butonContainer(secilenMeslekKategori!, Colors.blue, 1),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: secilenMeslekKategori == 'Servis' ?
                              MeslekServisListeleri().meslekServis.length :
                           secilenMeslekKategori == 'Ofis' ?
                              MeslekOfisListeleri().meslekOfis.length :
                           secilenMeslekKategori == 'Bilgi Teknolojileri' ?
                              MeslekBTListeleri().meslekBT.length :
                           secilenMeslekKategori == 'Finans' ?
                              MeslekFinansListeleri().meslekFinans.length :
                           secilenMeslekKategori == 'İşletme Sahipliği' ?
                              MeslekYuksekIsletmeListeleri().meslekYuksekIsletme.length :
                           secilenMeslekKategori == 'Devlet Yönetimi' ?
                              MeslekDevletListeleri().meslekDevlet.length : 0,

                itemBuilder: (context, index){
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              secilenMeslekKategori == 'Servis' ?
                                Text('${MeslekServisListeleri().meslekServis[index].meslekServisAd}', style: GoogleFonts.poppins()) :
                              secilenMeslekKategori == 'Ofis' ?
                                Text('${MeslekOfisListeleri().meslekOfis[index].meslekOfisAd}', style: GoogleFonts.poppins()) :
                              secilenMeslekKategori == 'Bilgi Teknolojileri' ?
                                Text('${MeslekBTListeleri().meslekBT[index].meslekBTAd}', style: GoogleFonts.poppins()) :
                              secilenMeslekKategori == 'Finans' ?
                                Text('${MeslekFinansListeleri().meslekFinans[index].meslekFinansAd}', style: GoogleFonts.poppins()) :
                              secilenMeslekKategori == 'İşletme Sahipliği' ?
                                Text('${MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].meslekYuksekIsletmeAd}', style: GoogleFonts.poppins()) :
                              secilenMeslekKategori == 'Devlet Yönetimi' ?
                                Text('${MeslekDevletListeleri().meslekDevlet[index].meslekDevletAd}', style: GoogleFonts.poppins()) :
                              Text(''),

                              Spacer(),

                              secilenMeslekKategori == 'Servis' ?
                                Text('₺ ${MeslekServisListeleri().meslekServis[index].ucret}/Ay', style: GoogleFonts.poppins()) :
                              secilenMeslekKategori == 'Ofis' ?
                                Text('₺ ${MeslekOfisListeleri().meslekOfis[index].ucret}/Ay', style: GoogleFonts.poppins()) :
                              secilenMeslekKategori == 'Bilgi Teknolojileri' ?
                                Text('₺ ${MeslekBTListeleri().meslekBT[index].ucret}/Ay', style: GoogleFonts.poppins()) :
                              secilenMeslekKategori == 'Finans' ?
                                Text('₺ ${MeslekFinansListeleri().meslekFinans[index].ucret}/Ay', style: GoogleFonts.poppins()) :
                              secilenMeslekKategori == 'İşletme Sahipliği' ?
                                Text('₺ ${MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].ucret}/Ay', style: GoogleFonts.poppins()) :
                              secilenMeslekKategori == 'Devlet Yönetimi' ?
                                Text('₺ ${MeslekDevletListeleri().meslekDevlet[index].ucret}/Ay', style: GoogleFonts.poppins()) :
                              Text(''),


                            ],
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap:(){
                              String barinmaGereksinimText = 'Yok';
                              String giyimGereksinimText = 'Yok';
                              String iliskiGereksinimText = 'Yok';
                              String ulasimGereksinimText = 'Yok';
                              String egitimGereksinimText = 'Yok';
                              String beslenmeGereksinimText = 'Yok';



                              if(secilenMeslekKategori == 'Servis'){

                                int barinmaGereksinimId = MeslekServisListeleri().meslekServis[index].barinmaGereksinim!;
                                int giyimGereksinimId = MeslekServisListeleri().meslekServis[index].giyimGereksinim!;
                                int iliskiGereksinimId = MeslekServisListeleri().meslekServis[index].iliskiGereksinim!;
                                int ulasimGereksinimId = MeslekServisListeleri().meslekServis[index].ulasimGereksinim!;
                                int egitimGereksinimId = MeslekServisListeleri().meslekServis[index].egitimGereksinim!;
                                int beslenmeGereksinimId = MeslekServisListeleri().meslekServis[index].beslenmeGereksinim!;


                                // Meslek zaten seciliyse tekrar dialog açma
                                if(_kisiBilgileri.meslek.read('meslek') == MeslekServisListeleri().meslekServis[index].meslekServisAd){
                                  return;
                                }

                                if(MeslekServisListeleri().meslekServis[index].barinmaGereksinim! != 0){
                                  barinmaGereksinimText = BarinmaListeleri().barinma[barinmaGereksinimId-1].barinmaAd!;
                                }

                                if(MeslekServisListeleri().meslekServis[index].giyimGereksinim! != 0){
                                  giyimGereksinimText = GiyimListeleri().giyim[giyimGereksinimId-1].giyimAd!;
                                }

                                if(MeslekServisListeleri().meslekServis[index].iliskiGereksinim! != 0){
                                  iliskiGereksinimText = IliskiListeleri().iliski[iliskiGereksinimId-1].iliskiAd!;
                                }

                                if(MeslekServisListeleri().meslekServis[index].ulasimGereksinim! != 0){
                                  ulasimGereksinimText = UlasimListeleri().ulasim[ulasimGereksinimId-1].ulasimAd!;
                                }

                                if(MeslekServisListeleri().meslekServis[index].egitimGereksinim! != 0){
                                  egitimGereksinimText = EgitimListeleri().egitim[egitimGereksinimId-1].egitimAd!;
                                }

                                if(MeslekServisListeleri().meslekServis[index].beslenmeGereksinim! != 0){
                                  beslenmeGereksinimText = YemekListeleri().yemek[beslenmeGereksinimId-1].yemekAdi!;
                                }

                                meslekSecimShowDialog(
                                  context,
                                  secilenMeslekKategori!,
                                  MeslekServisListeleri().meslekServis[index].meslekServisAd!,
                                  MeslekServisListeleri().meslekServis[index].ucret!,
                                  barinmaGereksinimId,
                                  barinmaGereksinimText,
                                  giyimGereksinimId,
                                  giyimGereksinimText,
                                  iliskiGereksinimId,
                                  iliskiGereksinimText,
                                  ulasimGereksinimId,
                                  ulasimGereksinimText,
                                  egitimGereksinimId,
                                  egitimGereksinimText,
                                  beslenmeGereksinimId,
                                  beslenmeGereksinimText
                                );
                              }
                              else if(secilenMeslekKategori == 'Ofis'){

                                int barinmaGereksinimId = MeslekOfisListeleri().meslekOfis[index].barinmaGereksinim!;
                                int giyimGereksinimId = MeslekOfisListeleri().meslekOfis[index].giyimGereksinim!;
                                int iliskiGereksinimId = MeslekOfisListeleri().meslekOfis[index].iliskiGereksinim!;
                                int ulasimGereksinimId = MeslekOfisListeleri().meslekOfis[index].ulasimGereksinim!;
                                int egitimGereksinimId = MeslekOfisListeleri().meslekOfis[index].egitimGereksinim!;
                                int beslenmeGereksinimId = MeslekOfisListeleri().meslekOfis[index].beslenmeGereksinim!;

                                // Meslek zaten seciliyse tekrar dialog açma
                                if(_kisiBilgileri.meslek.read('meslek') == MeslekOfisListeleri().meslekOfis[index].meslekOfisAd){
                                  return;
                                }

                                if(MeslekOfisListeleri().meslekOfis[index].barinmaGereksinim! != 0){
                                  barinmaGereksinimText = BarinmaListeleri().barinma[barinmaGereksinimId-1].barinmaAd!;
                                }

                                if(MeslekOfisListeleri().meslekOfis[index].giyimGereksinim! != 0){
                                  giyimGereksinimText = GiyimListeleri().giyim[giyimGereksinimId-1].giyimAd!;
                                }

                                if(MeslekOfisListeleri().meslekOfis[index].iliskiGereksinim! != 0){
                                  iliskiGereksinimText = IliskiListeleri().iliski[iliskiGereksinimId-1].iliskiAd!;
                                }

                                if(MeslekOfisListeleri().meslekOfis[index].ulasimGereksinim! != 0){
                                  ulasimGereksinimText = UlasimListeleri().ulasim[ulasimGereksinimId-1].ulasimAd!;
                                }

                                if(MeslekOfisListeleri().meslekOfis[index].egitimGereksinim! != 0){
                                  egitimGereksinimText = EgitimListeleri().egitim[egitimGereksinimId-1].egitimAd!;
                                }

                                if(MeslekOfisListeleri().meslekOfis[index].beslenmeGereksinim! != 0){
                                  beslenmeGereksinimText = YemekListeleri().yemek[beslenmeGereksinimId-1].yemekAdi!;
                                }

                                meslekSecimShowDialog(
                                    context,
                                    secilenMeslekKategori!,
                                    MeslekOfisListeleri().meslekOfis[index].meslekOfisAd!,
                                    MeslekOfisListeleri().meslekOfis[index].ucret!,
                                    barinmaGereksinimId,
                                    barinmaGereksinimText,
                                    giyimGereksinimId,
                                    giyimGereksinimText,
                                    iliskiGereksinimId,
                                    iliskiGereksinimText,
                                    ulasimGereksinimId,
                                    ulasimGereksinimText,
                                    egitimGereksinimId,
                                    egitimGereksinimText,
                                    beslenmeGereksinimId,
                                    beslenmeGereksinimText
                                );





                              }
                              else if(secilenMeslekKategori == 'Bilgi Teknolojileri'){

                                int barinmaGereksinimId = MeslekBTListeleri().meslekBT[index].barinmaGereksinim!;
                                int giyimGereksinimId = MeslekBTListeleri().meslekBT[index].giyimGereksinim!;
                                int iliskiGereksinimId = MeslekBTListeleri().meslekBT[index].iliskiGereksinim!;
                                int ulasimGereksinimId = MeslekBTListeleri().meslekBT[index].ulasimGereksinim!;
                                int egitimGereksinimId = MeslekBTListeleri().meslekBT[index].egitimGereksinim!;
                                int beslenmeGereksinimId = MeslekBTListeleri().meslekBT[index].beslenmeGereksinim!;

                                // Meslek zaten seciliyse tekrar dialog açma
                                if(_kisiBilgileri.meslek.read('meslek') == MeslekBTListeleri().meslekBT[index].meslekBTAd){
                                  return;
                                }

                                if(MeslekBTListeleri().meslekBT[index].barinmaGereksinim! != 0){
                                  barinmaGereksinimText = BarinmaListeleri().barinma[barinmaGereksinimId-1].barinmaAd!;
                                }

                                if(MeslekBTListeleri().meslekBT[index].giyimGereksinim! != 0){
                                  giyimGereksinimText = GiyimListeleri().giyim[giyimGereksinimId-1].giyimAd!;
                                }

                                if(MeslekBTListeleri().meslekBT[index].iliskiGereksinim! != 0){
                                  iliskiGereksinimText = IliskiListeleri().iliski[iliskiGereksinimId-1].iliskiAd!;
                                }

                                if(MeslekBTListeleri().meslekBT[index].ulasimGereksinim! != 0){
                                  ulasimGereksinimText = UlasimListeleri().ulasim[ulasimGereksinimId-1].ulasimAd!;
                                }

                                if(MeslekBTListeleri().meslekBT[index].egitimGereksinim! != 0){
                                  egitimGereksinimText = EgitimListeleri().egitim[egitimGereksinimId-1].egitimAd!;
                                }

                                if(MeslekBTListeleri().meslekBT[index].beslenmeGereksinim! != 0){
                                  beslenmeGereksinimText = YemekListeleri().yemek[beslenmeGereksinimId-1].yemekAdi!;
                                }

                                meslekSecimShowDialog(
                                    context,
                                    secilenMeslekKategori!,
                                    MeslekBTListeleri().meslekBT[index].meslekBTAd!,
                                    MeslekBTListeleri().meslekBT[index].ucret!,
                                    barinmaGereksinimId,
                                    barinmaGereksinimText,
                                    giyimGereksinimId,
                                    giyimGereksinimText,
                                    iliskiGereksinimId,
                                    iliskiGereksinimText,
                                    ulasimGereksinimId,
                                    ulasimGereksinimText,
                                    egitimGereksinimId,
                                    egitimGereksinimText,
                                    beslenmeGereksinimId,
                                    beslenmeGereksinimText
                                );





                              }
                              else if(secilenMeslekKategori == 'Finans'){

                                int barinmaGereksinimId = MeslekFinansListeleri().meslekFinans[index].barinmaGereksinim!;
                                int giyimGereksinimId = MeslekFinansListeleri().meslekFinans[index].giyimGereksinim!;
                                int iliskiGereksinimId = MeslekFinansListeleri().meslekFinans[index].iliskiGereksinim!;
                                int ulasimGereksinimId = MeslekFinansListeleri().meslekFinans[index].ulasimGereksinim!;
                                int egitimGereksinimId = MeslekFinansListeleri().meslekFinans[index].egitimGereksinim!;
                                int beslenmeGereksinimId = MeslekFinansListeleri().meslekFinans[index].beslenmeGereksinim!;

                                // Meslek zaten seciliyse tekrar dialog açma
                                if(_kisiBilgileri.meslek.read('meslek') == MeslekFinansListeleri().meslekFinans[index].meslekFinansAd){
                                  return;
                                }

                                if(MeslekFinansListeleri().meslekFinans[index].barinmaGereksinim! != 0){
                                  barinmaGereksinimText = BarinmaListeleri().barinma[barinmaGereksinimId-1].barinmaAd!;
                                }

                                if(MeslekFinansListeleri().meslekFinans[index].giyimGereksinim! != 0){
                                  giyimGereksinimText = GiyimListeleri().giyim[giyimGereksinimId-1].giyimAd!;
                                }

                                if(MeslekFinansListeleri().meslekFinans[index].iliskiGereksinim! != 0){
                                  iliskiGereksinimText = IliskiListeleri().iliski[iliskiGereksinimId-1].iliskiAd!;
                                }

                                if(MeslekFinansListeleri().meslekFinans[index].ulasimGereksinim! != 0){
                                  ulasimGereksinimText = UlasimListeleri().ulasim[ulasimGereksinimId-1].ulasimAd!;
                                }

                                if(MeslekFinansListeleri().meslekFinans[index].egitimGereksinim! != 0){
                                  egitimGereksinimText = EgitimListeleri().egitim[egitimGereksinimId-1].egitimAd!;
                                }

                                if(MeslekFinansListeleri().meslekFinans[index].beslenmeGereksinim! != 0){
                                  beslenmeGereksinimText = YemekListeleri().yemek[beslenmeGereksinimId-1].yemekAdi!;
                                }

                                meslekSecimShowDialog(
                                    context,
                                    secilenMeslekKategori!,
                                    MeslekFinansListeleri().meslekFinans[index].meslekFinansAd!,
                                    MeslekFinansListeleri().meslekFinans[index].ucret!,
                                    barinmaGereksinimId,
                                    barinmaGereksinimText,
                                    giyimGereksinimId,
                                    giyimGereksinimText,
                                    iliskiGereksinimId,
                                    iliskiGereksinimText,
                                    ulasimGereksinimId,
                                    ulasimGereksinimText,
                                    egitimGereksinimId,
                                    egitimGereksinimText,
                                    beslenmeGereksinimId,
                                    beslenmeGereksinimText
                                );





                              }
                              else if(secilenMeslekKategori == 'İşletme Sahipliği'){

                                int barinmaGereksinimId = MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].barinmaGereksinim!;
                                int giyimGereksinimId = MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].giyimGereksinim!;
                                int iliskiGereksinimId = MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].iliskiGereksinim!;
                                int ulasimGereksinimId = MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].ulasimGereksinim!;
                                int egitimGereksinimId = MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].egitimGereksinim!;
                                int beslenmeGereksinimId = MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].beslenmeGereksinim!;

                                // Meslek zaten seciliyse tekrar dialog açma
                                if(_kisiBilgileri.meslek.read('meslek') == MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].meslekYuksekIsletmeAd){
                                  return;
                                }

                                if(MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].barinmaGereksinim! != 0){
                                  barinmaGereksinimText = BarinmaListeleri().barinma[barinmaGereksinimId-1].barinmaAd!;
                                }

                                if(MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].giyimGereksinim! != 0){
                                  giyimGereksinimText = GiyimListeleri().giyim[giyimGereksinimId-1].giyimAd!;
                                }

                                if(MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].iliskiGereksinim! != 0){
                                  iliskiGereksinimText = IliskiListeleri().iliski[iliskiGereksinimId-1].iliskiAd!;
                                }

                                if(MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].ulasimGereksinim! != 0){
                                  ulasimGereksinimText = UlasimListeleri().ulasim[ulasimGereksinimId-1].ulasimAd!;
                                }

                                if(MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].egitimGereksinim! != 0){
                                  egitimGereksinimText = EgitimListeleri().egitim[egitimGereksinimId-1].egitimAd!;
                                }

                                if(MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].beslenmeGereksinim! != 0){
                                  beslenmeGereksinimText = YemekListeleri().yemek[beslenmeGereksinimId-1].yemekAdi!;
                                }

                                meslekSecimShowDialog(
                                    context,
                                    secilenMeslekKategori!,
                                    MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].meslekYuksekIsletmeAd!,
                                    MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].ucret!,
                                    barinmaGereksinimId,
                                    barinmaGereksinimText,
                                    giyimGereksinimId,
                                    giyimGereksinimText,
                                    iliskiGereksinimId,
                                    iliskiGereksinimText,
                                    ulasimGereksinimId,
                                    ulasimGereksinimText,
                                    egitimGereksinimId,
                                    egitimGereksinimText,
                                    beslenmeGereksinimId,
                                    beslenmeGereksinimText
                                );





                              }
                              else if(secilenMeslekKategori == 'Devlet Yönetimi'){

                                int barinmaGereksinimId = MeslekDevletListeleri().meslekDevlet[index].barinmaGereksinim!;
                                int giyimGereksinimId = MeslekDevletListeleri().meslekDevlet[index].giyimGereksinim!;
                                int iliskiGereksinimId = MeslekDevletListeleri().meslekDevlet[index].iliskiGereksinim!;
                                int ulasimGereksinimId = MeslekDevletListeleri().meslekDevlet[index].ulasimGereksinim!;
                                int egitimGereksinimId = MeslekDevletListeleri().meslekDevlet[index].egitimGereksinim!;
                                int beslenmeGereksinimId = MeslekDevletListeleri().meslekDevlet[index].beslenmeGereksinim!;

                                // Meslek zaten seciliyse tekrar dialog açma
                                if(_kisiBilgileri.meslek.read('meslek') == MeslekDevletListeleri().meslekDevlet[index].meslekDevletAd){
                                  return;
                                }

                                if(MeslekDevletListeleri().meslekDevlet[index].barinmaGereksinim! != 0){
                                  barinmaGereksinimText = BarinmaListeleri().barinma[barinmaGereksinimId-1].barinmaAd!;
                                }

                                if(MeslekDevletListeleri().meslekDevlet[index].giyimGereksinim! != 0){
                                  giyimGereksinimText = GiyimListeleri().giyim[giyimGereksinimId-1].giyimAd!;
                                }

                                if(MeslekDevletListeleri().meslekDevlet[index].iliskiGereksinim! != 0){
                                  iliskiGereksinimText = IliskiListeleri().iliski[iliskiGereksinimId-1].iliskiAd!;
                                }

                                if(MeslekDevletListeleri().meslekDevlet[index].ulasimGereksinim! != 0){
                                  ulasimGereksinimText = UlasimListeleri().ulasim[ulasimGereksinimId-1].ulasimAd!;
                                }

                                if(MeslekDevletListeleri().meslekDevlet[index].egitimGereksinim! != 0){
                                  egitimGereksinimText = EgitimListeleri().egitim[egitimGereksinimId-1].egitimAd!;
                                }

                                if(MeslekDevletListeleri().meslekDevlet[index].beslenmeGereksinim! != 0){
                                  beslenmeGereksinimText = YemekListeleri().yemek[beslenmeGereksinimId-1].yemekAdi!;
                                }

                                meslekSecimShowDialog(
                                    context,
                                    secilenMeslekKategori!,
                                    MeslekDevletListeleri().meslekDevlet[index].meslekDevletAd!,
                                    MeslekDevletListeleri().meslekDevlet[index].ucret!,
                                    barinmaGereksinimId,
                                    barinmaGereksinimText,
                                    giyimGereksinimId,
                                    giyimGereksinimText,
                                    iliskiGereksinimId,
                                    iliskiGereksinimText,
                                    ulasimGereksinimId,
                                    ulasimGereksinimText,
                                    egitimGereksinimId,
                                    egitimGereksinimText,
                                    beslenmeGereksinimId,
                                    beslenmeGereksinimText
                                );





                              }

                            },
                            child: secimButon(index),
                          ),
                        ],
                      ),

                    ),



                  );

                },
              ),
            ),
          ],
        );
      }

    }
    else{
      return ListView.builder(
        itemCount:  widget.menuAdi == 'Beslenme' ?
                      YemekListeleri().yemek.length :
                    widget.menuAdi == 'İlişki' ?
                      IliskiListeleri().iliski.length :
                    widget.menuAdi == 'Barınma' ?
                      BarinmaListeleri().barinma.length :
                    widget.menuAdi == 'Giyim' ?
                      GiyimListeleri().giyim.length :
                    widget.menuAdi == 'Ulaşım' ?
                      UlasimListeleri().ulasim.length :
                    widget.menuAdi == 'Eğitim' ?
                      EgitimListeleri().egitim.length : 0,


        itemBuilder: (context, index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      widget.menuAdi == 'Beslenme' ?
                        Text('${YemekListeleri().yemek[index].yemekAdi}', style: GoogleFonts.poppins()) :
                      widget.menuAdi == 'İlişki' ?
                        Text('${IliskiListeleri().iliski[index].iliskiAd}', style: GoogleFonts.poppins()) :
                      widget.menuAdi == 'Barınma' ?
                        Text('${BarinmaListeleri().barinma[index].barinmaAd}', style: GoogleFonts.poppins()):
                      widget.menuAdi == 'Giyim' ?
                        Text('${GiyimListeleri().giyim[index].giyimAd}', style: GoogleFonts.poppins()):
                      widget.menuAdi == 'Ulaşım' ?
                        Text('${UlasimListeleri().ulasim[index].ulasimAd}', style: GoogleFonts.poppins()):
                      widget.menuAdi == 'Eğitim' ?
                        Text('${EgitimListeleri().egitim[index].egitimAd}', style: GoogleFonts.poppins()):
                        Text(''),

                      Spacer(),

                      widget.menuAdi == 'Beslenme' ?
                        Text('₺ ${YemekListeleri().yemek[index].ucret}/Ay', style: GoogleFonts.poppins()) :
                      widget.menuAdi == 'İlişki' ?
                        Text('₺ ${IliskiListeleri().iliski[index].ucret}/Ay', style: GoogleFonts.poppins()) :
                      widget.menuAdi == 'Barınma' ?
                        Text('₺ ${BarinmaListeleri().barinma[index].ucret}/Ay', style: GoogleFonts.poppins()) :
                      widget.menuAdi == 'Giyim' ?
                        Text('₺ ${GiyimListeleri().giyim[index].ucret}', style: GoogleFonts.poppins()) :
                      widget.menuAdi == 'Ulaşım' ?
                        Text('₺ ${UlasimListeleri().ulasim[index].ucret}/Ay', style: GoogleFonts.poppins()) :
                      widget.menuAdi == 'Eğitim' ?
                        Text('₺ ${EgitimListeleri().egitim[index].ucret}/Ay ${EgitimListeleri().egitim[index].sure}x', style: GoogleFonts.poppins()) :
                      Text(''),


                    ],
                  ),
                  SizedBox(height: 10),


                  GestureDetector(
                    onTap: (){
                      if(widget.menuAdi == 'Beslenme'){
                        SecimIslemleri().beslenmeSecim(YemekListeleri().yemek[index].id, '${YemekListeleri().yemek[index].yemekAdi}', YemekListeleri().yemek[index].ucret);
                      }else if(widget.menuAdi == 'İlişki'){
                        SecimIslemleri().iliskiSecim(IliskiListeleri().iliski[index].id, '${IliskiListeleri().iliski[index].iliskiAd}', IliskiListeleri().iliski[index].ucret);
                      }else if(widget.menuAdi == 'Barınma'){
                        SecimIslemleri().barinmaSecim(BarinmaListeleri().barinma[index].id, '${BarinmaListeleri().barinma[index].barinmaAd}', BarinmaListeleri().barinma[index].ucret);
                      }else if(widget.menuAdi == 'Giyim'){
                        SecimIslemleri().giyimSecim(GiyimListeleri().giyim[index].id, '${GiyimListeleri().giyim[index].giyimAd}', GiyimListeleri().giyim[index].ucret);
                      }else if(widget.menuAdi == 'Ulaşım'){
                        SecimIslemleri().ulasimSecim(UlasimListeleri().ulasim[index].id, '${UlasimListeleri().ulasim[index].ulasimAd}', UlasimListeleri().ulasim[index].ucret);
                      }
                    },
                    child: secimButon(index),
                  ),
                ],
              ),

            ),



          );

        },
      );
    }


  }

  secimButon(int index) {
    if(widget.menuAdi == 'Barınma'){
      if(BarinmaListeleri().barinma[index].ucret! > _kisiBilgileri.para.read('para')  && _kisiBilgileri.barinma.read('barinma') != '${BarinmaListeleri().barinma[index].barinmaAd}'){
        return butonContainer('Seç', Colors.grey, 0.25);
      }else{
        return GetBuilder<KisiBilgiController>(
            builder: (_) => _kisiBilgileri.barinma.read('barinma') == '${BarinmaListeleri().barinma[index].barinmaAd}' ? butonContainer('Seçildi', Colors.green, 0.25) : butonContainer('Seç', Colors.blue, 0.25)
        );
      }
    }
    else if(widget.menuAdi == 'Giyim'){
      if(GiyimListeleri().giyim[index].ucret! > _kisiBilgileri.para.read('para') && _kisiBilgileri.giyim.read('giyim') != '${GiyimListeleri().giyim[index].giyimAd}'){
        return butonContainer('Seç', Colors.grey, 0.25);
      }else{
        return GetBuilder<KisiBilgiController>(
            builder: (_) => _kisiBilgileri.giyim.read('giyim') == '${GiyimListeleri().giyim[index].giyimAd}' ? butonContainer('Seçildi', Colors.green, 0.25) : butonContainer('Seç', Colors.blue, 0.25)
        );
      }
    }
    else if(widget.menuAdi == 'İlişki'){
      if(IliskiListeleri().iliski[index].ucret! > _kisiBilgileri.para.read('para') && _kisiBilgileri.iliski.read('iliski') != '${IliskiListeleri().iliski[index].iliskiAd}' ){
        return butonContainer('Seç', Colors.grey, 0.25);
      }else{
        return GetBuilder<KisiBilgiController>(
            builder: (_) => _kisiBilgileri.iliski.read('iliski') == '${IliskiListeleri().iliski[index].iliskiAd}' ? butonContainer('Seçildi', Colors.green, 0.25) : butonContainer('Seç', Colors.blue, 0.25)
        );
      }
    }
    else if(widget.menuAdi == 'Ulaşım'){
      if(UlasimListeleri().ulasim[index].ucret! > _kisiBilgileri.para.read('para') && _kisiBilgileri.ulasim.read('ulasim') != '${UlasimListeleri().ulasim[index].ulasimAd}' ){
        return butonContainer('Seç', Colors.grey, 0.25);
      }else{
        return GetBuilder<KisiBilgiController>(
            builder: (_) => _kisiBilgileri.ulasim.read('ulasim') == '${UlasimListeleri().ulasim[index].ulasimAd}' ? butonContainer('Seçildi', Colors.green, 0.25) : butonContainer('Seç', Colors.blue, 0.25)
        );
      }

    }
    else if(widget.menuAdi == 'Beslenme'){
      if(YemekListeleri().yemek[index].ucret! > _kisiBilgileri.para.read('para') && _kisiBilgileri.beslenme.read('beslenme') != '${YemekListeleri().yemek[index].yemekAdi}' ){
        return butonContainer('Seç', Colors.grey, 0.25);
      }else{
        return GetBuilder<KisiBilgiController>(
            builder: (_) => _kisiBilgileri.beslenme.read('beslenme') == '${YemekListeleri().yemek[index].yemekAdi}' ? butonContainer('Seçildi', Colors.green, 0.25) : butonContainer('Seç', Colors.blue, 0.25)
        );
      }
    }
    else if(widget.menuAdi == 'Eğitim'){
      if(EgitimListeleri().egitim[index].ucret! > _kisiBilgileri.para.read('para') && _kisiBilgileri.egitim.read('egitim') != '${EgitimListeleri().egitim[index].egitimAd}' ){
        return Row(
          children: [
            butonContainer('Seç', Colors.grey, 0.25),
            SizedBox(width: 8),
            Text('${_kisiBilgileri.egitim.read('${EgitimListeleri().egitim[index].egitimAd}')}x eğitim alındı.')
          ],
        );
      }else if(_kisiBilgileri.egitim.read('${EgitimListeleri().egitim[index].egitimAd}') == 99){
        return butonContainer('Mezun', Colors.grey, 0.25);
      }else{
        return GetBuilder<KisiBilgiController>(
            builder: (_) => _kisiBilgileri.egitim.read('egitim') == '${EgitimListeleri().egitim[index].egitimAd}' ?
              Row(
                children: [
                  butonContainer('Seçildi', Colors.green, 0.25),
                  SizedBox(width: 8),
                  Text('${_kisiBilgileri.egitim.read('${EgitimListeleri().egitim[index].egitimAd}')}x eğitim alındı.')
                ],
              ) :
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      String gerekenEgitimText = 'Yok';

                      int gerekenEgitimId = EgitimListeleri().egitim[index].gerekenEgitimId!;

                      if(EgitimListeleri().egitim[index].gerekenEgitimId != 0){
                        gerekenEgitimText = EgitimListeleri().egitim[gerekenEgitimId-1].egitimAd!;
                      }

                      egitimSecimShowDialog(
                        context,
                        EgitimListeleri().egitim[index].id!,
                        EgitimListeleri().egitim[index].gerekenEgitimId!,
                        gerekenEgitimText,
                        EgitimListeleri().egitim[index].egitimAd!,
                        EgitimListeleri().egitim[index].ucret!,
                        EgitimListeleri().egitim[index].sure!,
                      );
                    },
                    child: butonContainer('Seç', Colors.blue, 0.25),
                  ),
                  SizedBox(width: 8),
                  Text('${_kisiBilgileri.egitim.read('${EgitimListeleri().egitim[index].egitimAd}')}x eğitim alındı.')
                ],
              )
        );
      }

    }
    else if(widget.menuAdi == 'Meslekler'){
      if(secilenMeslekKategori == 'Servis'){
        return GetBuilder<KisiBilgiController>(
            builder: (_) => _kisiBilgileri.meslek.read('meslek') == '${MeslekServisListeleri().meslekServis[index].meslekServisAd}' ? butonContainer('Seçildi', Colors.green, 0.25) : butonContainer('Seç', Colors.blue, 0.25)
        );
      }
      else if(secilenMeslekKategori == 'Ofis'){
        return GetBuilder<KisiBilgiController>(
            builder: (_) => _kisiBilgileri.meslek.read('meslek') == '${MeslekOfisListeleri().meslekOfis[index].meslekOfisAd}' ? butonContainer('Seçildi', Colors.green, 0.25) : butonContainer('Seç', Colors.blue, 0.25)
        );
      }
      else if(secilenMeslekKategori == 'Bilgi Teknolojileri'){
        return GetBuilder<KisiBilgiController>(
            builder: (_) => _kisiBilgileri.meslek.read('meslek') == '${MeslekBTListeleri().meslekBT[index].meslekBTAd}' ? butonContainer('Seçildi', Colors.green, 0.25) : butonContainer('Seç', Colors.blue, 0.25)
        );
      }
      else if(secilenMeslekKategori == 'Finans'){
        return GetBuilder<KisiBilgiController>(
            builder: (_) => _kisiBilgileri.meslek.read('meslek') == '${MeslekFinansListeleri().meslekFinans[index].meslekFinansAd}' ? butonContainer('Seçildi', Colors.green, 0.25) : butonContainer('Seç', Colors.blue, 0.25)
        );
      }
      else if(secilenMeslekKategori == 'İşletme Sahipliği'){
        return GetBuilder<KisiBilgiController>(
            builder: (_) => _kisiBilgileri.meslek.read('meslek') == '${MeslekYuksekIsletmeListeleri().meslekYuksekIsletme[index].meslekYuksekIsletmeAd}' ? butonContainer('Seçildi', Colors.green, 0.25) : butonContainer('Seç', Colors.blue, 0.25)
        );
      }
      else if(secilenMeslekKategori == 'Devlet Yönetimi'){
        return GetBuilder<KisiBilgiController>(
            builder: (_) => _kisiBilgileri.meslek.read('meslek') == '${MeslekDevletListeleri().meslekDevlet[index].meslekDevletAd}' ? butonContainer('Seçildi', Colors.green, 0.25) : butonContainer('Seç', Colors.blue, 0.25)
        );
      }


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
                Text('${widget.menuAdi}', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: menuListView(),
      ),

    );
  }
}
