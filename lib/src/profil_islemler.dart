import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kariyer_simulator/components/widget.dart';
import 'package:kariyer_simulator/helpers/admob.dart';
import 'package:kariyer_simulator/helpers/storage.dart';
import 'package:kariyer_simulator/helpers/getx_controller.dart';
import 'package:kariyer_simulator/pages/ProfilOlusturEkran.dart';

class ProfilIslemler{

  final ProfilBilgileri _profilBilgileri = ProfilBilgileri();
  final KisiBilgileri _kisiBilgileri = KisiBilgileri();
  final GorevBilgileri _gorevBilgileri = GorevBilgileri();
  final GelirGiderBilgileri _gelirGiderBilgileri = GelirGiderBilgileri();
  final kisiBilgiController = Get.put(KisiBilgiController());

  AdmobHelper _admobHelper = AdmobHelper();

  void profilOlustur(TextEditingController isimTextEditKontrol){
    _profilBilgileri.profilOlusturuldu.write('profil', true);
    _kisiBilgileri.isim.write('isim', isimTextEditKontrol.text);
    _kisiBilgileri.para.write('para', 1000);
    _kisiBilgileri.mutluluk.write('mutluluk', 100.0);
    _kisiBilgileri.saglik.write('saglik', 100.0);
    _kisiBilgileri.yil.write('yil', 18);
    _kisiBilgileri.ay.write('ay', 1);


    _kisiBilgileri.barinma.write('barinma', 'yok');
    _kisiBilgileri.barinma.write('barinmaId', 0);

    _kisiBilgileri.giyim.write('giyim', 'yok');
    _kisiBilgileri.giyim.write('giyimId', 0);

    _kisiBilgileri.iliski.write('iliski', 'yok');
    _kisiBilgileri.iliski.write('iliskiId', 0);

    _kisiBilgileri.ulasim.write('ulasim', 'yok');
    _kisiBilgileri.ulasim.write('ulasimId', 0);

    _kisiBilgileri.beslenme.write('beslenme', 'yok');
    _kisiBilgileri.beslenme.write('beslenmeId', 0);

    // secilen egitimin adı
    _kisiBilgileri.egitim.write('egitim', 'yok');
    _kisiBilgileri.egitim.write('egitimId', 0);

    // secilen egitimde alınması max gereken süre
    _kisiBilgileri.egitim.write('egitim_suresi', 0);

    // alınan egitimlerin hangi seviyeye geldikleri
    _kisiBilgileri.egitim.write('Ehliyet Kursu', 0);
    _kisiBilgileri.egitim.write('Yüksekokul', 0);
    _kisiBilgileri.egitim.write('Yönetici Eğitimi', 0);
    _kisiBilgileri.egitim.write('Satış Yönetimi Eğitimi', 0);
    _kisiBilgileri.egitim.write('Personel Yönetimi Eğitimi', 0);
    _kisiBilgileri.egitim.write('Grafik Tasarım Eğitimi', 0);
    _kisiBilgileri.egitim.write('Yazılımcı Eğitimi', 0);
    _kisiBilgileri.egitim.write('Ekonomi ve Finans Eğitimi', 0);
    _kisiBilgileri.egitim.write('Girişimcilik Okulu', 0);
    _kisiBilgileri.egitim.write('Girişimci Eğitimi 1', 0);
    _kisiBilgileri.egitim.write('Girişimci Eğitimi 2', 0);
    _kisiBilgileri.egitim.write('Girişimci Eğitimi 3', 0);
    _kisiBilgileri.egitim.write('Hukuk Eğitimi', 0);
    _kisiBilgileri.egitim.write('Siyaset Eğitimi', 0);

    _kisiBilgileri.meslek.write('meslek', 'İşsiz');

    _gelirGiderBilgileri.gelirler.write('isGeliri', 0);
    _gelirGiderBilgileri.giderler.write('barinmaGideri', 0);
    _gelirGiderBilgileri.giderler.write('egitimGideri', 0);
    _gelirGiderBilgileri.giderler.write('iliskiGideri', 0);
    _gelirGiderBilgileri.giderler.write('beslenmeGideri', 0);
    _gelirGiderBilgileri.giderler.write('ulasimGideri', 0);
    _gorevBilgileri.gorevler.write('gorev1', true);
    _gorevBilgileri.gorevler.write('gorev2', false);
    _gorevBilgileri.gorevler.write('gorev3', false);
    _gorevBilgileri.gorevler.write('gorev4', false);
    _gorevBilgileri.gorevler.write('gorev5', false);
    _gorevBilgileri.gorevler.write('gorev6', false);
    _gorevBilgileri.gorevler.write('gorev7', false);
    kisiBilgiController.mevcutParaControllerFunction(1000);
    kisiBilgiController.zamanControllerFunction(1, 18);
    kisiBilgiController.hayatiBilgiControllerFunction(100, 100);
  }

  void profilSil(){
    _profilBilgileri.profilOlusturuldu.write('profil', false);
  }

  void tarihDegistir(){
    zamanBilgileriniGuncelle();
    calismaGeliriniGuncelle();
    hayatBilgisiAzalt();
    egitimBilgileriniGuncelle();
    barinmaGideriGuncelle();
    iliskiGideriGuncelle();
    ulasimGideriGuncelle();
    beslenmeGideriGuncelle();
  }

  void zamanBilgileriniGuncelle(){
    int cacheAyBilgisi = _kisiBilgileri.ay.read('ay');
    int cacheYilBilgisi = _kisiBilgileri.yil.read('yil');
    cacheAyBilgisi++;

    if(cacheAyBilgisi > 12){
      cacheAyBilgisi = 1;
      cacheYilBilgisi++;
    }

    kisiBilgiController.zamanControllerFunction(cacheAyBilgisi, cacheYilBilgisi);
    _kisiBilgileri.ay.write('ay', cacheAyBilgisi);
    _kisiBilgileri.yil.write('yil', cacheYilBilgisi);
  }

  void calismaGeliriniGuncelle(){
    int mevcutPara = _kisiBilgileri.para.read('para');
    int meslekGelirUcreti = _gelirGiderBilgileri.gelirler.read('isGeliri');
    int yeniPara = mevcutPara + meslekGelirUcreti;

    _kisiBilgileri.para.write('para', yeniPara);
    kisiBilgiController.mevcutParaControllerFunction(yeniPara);

  }

  void hayatBilgisiAzalt(){

    double mevcutMutluluk = _kisiBilgileri.mutluluk.read('mutluluk');
    double yeniMutlulukDeger = mevcutMutluluk - 25;

    double mevcutSaglik = _kisiBilgileri.saglik.read('saglik');
    double yeniSaglikDeger = mevcutSaglik - 25;

    if(yeniMutlulukDeger < 0 || yeniSaglikDeger < 0){
      _admobHelper.gecisReklamOlustur();
      Get.defaultDialog(
        title: 'Öldün!',
        middleText: 'Tekrar yeni bir hayata başlayabilirsin.',
        textConfirm: 'Tamam',
        confirmTextColor: Colors.white,
        onConfirm: (){
          _admobHelper.gecisReklamGoster();
          ProfilIslemler().profilSil();
          Get.offAll(() => ProfilOlusturEkran());
        },
      );

      // oyun bitti
      return;
    }

    _kisiBilgileri.mutluluk.write('mutluluk', yeniMutlulukDeger);
    _kisiBilgileri.saglik.write('saglik', yeniSaglikDeger);
    kisiBilgiController.hayatiBilgiControllerFunction(yeniMutlulukDeger, yeniSaglikDeger);

  }

  void egitimBilgileriniGuncelle(){
    int mevcutPara = _kisiBilgileri.para.read('para');
    int egitimUcreti = _gelirGiderBilgileri.giderler.read('egitimGideri');
    int yeniPara = mevcutPara - egitimUcreti;

    if(yeniPara < 0 && _kisiBilgileri.egitim.read('egitim') != 'yok'){
      getDialog('Eğitim Alamazsınız!', 'Eğitim alabilecek maddi durumun yok.', 'Tamam');
      _kisiBilgileri.egitim.write('egitim', 'yok');
      _kisiBilgileri.egitim.write('egitimId', 0);
      _gelirGiderBilgileri.giderler.write('egitimGideri', 0);
      kisiBilgiController.egitimControllerFunction('yok');
    }else{

      String mevcutEgitim = _kisiBilgileri.egitim.read('egitim');
      int mevcutEgitimSuresi;

      if(mevcutEgitim == 'yok'){
        mevcutEgitimSuresi = 0;
      }else{
        mevcutEgitimSuresi = _kisiBilgileri.egitim.read('$mevcutEgitim');
      }

      int maxEgitimSuresi = _kisiBilgileri.egitim.read('egitim_suresi');
      mevcutEgitimSuresi++;

      // eger max egitim suresini doldurduysak egitime devam etme ve mezun yap

      if(mevcutEgitimSuresi > maxEgitimSuresi){
        _kisiBilgileri.egitim.write('$mevcutEgitim', 99);
        return;
      }

      _kisiBilgileri.para.write('para', yeniPara);
      kisiBilgiController.mevcutParaControllerFunction(yeniPara);
      _kisiBilgileri.egitim.write('$mevcutEgitim', mevcutEgitimSuresi);

    }

  }

  void barinmaGideriGuncelle(){
    int mevcutPara = _kisiBilgileri.para.read('para');
    int barinmaUcreti = _gelirGiderBilgileri.giderler.read('barinmaGideri');
    int yeniPara = mevcutPara - barinmaUcreti;

    if(yeniPara < 0 && _kisiBilgileri.barinma.read('barinma') != 'yok'){
      getDialog('Evsiz Kaldın!', 'Ev kiranı ödeyemediğin için evden atıldın.', 'Tamam');
      _kisiBilgileri.barinma.write('barinma', 'yok');
      _kisiBilgileri.barinma.write('barinmaId', 0);
      _gelirGiderBilgileri.giderler.write('barinmaGideri', 0);
      kisiBilgiController.barinmaControllerFunction('yok');
    }else{
      _kisiBilgileri.para.write('para', yeniPara);
      kisiBilgiController.mevcutParaControllerFunction(yeniPara);
    }

  }

  void iliskiGideriGuncelle(){
    int mevcutPara = _kisiBilgileri.para.read('para');
    int iliskiUcreti = _gelirGiderBilgileri.giderler.read('iliskiGideri');
    int yeniPara = mevcutPara - iliskiUcreti;

    if(yeniPara < 0 && _kisiBilgileri.iliski.read('iliski') != 'yok'){
      getDialog('Yalnız Kaldın!', 'Maddi durumun ilişkini sürdürmene yetmiyor.', 'Tamam');
      _kisiBilgileri.iliski.write('iliski', 'yok');
      _kisiBilgileri.iliski.write('iliskiId', 0);
      _gelirGiderBilgileri.giderler.write('iliskiGideri', 0);
      kisiBilgiController.iliskiControllerFunction('yok');
    }else{
      _kisiBilgileri.para.write('para', yeniPara);
      kisiBilgiController.mevcutParaControllerFunction(yeniPara);
    }
  }

  void ulasimGideriGuncelle(){
    int mevcutPara = _kisiBilgileri.para.read('para');
    int ulasimUcreti = _gelirGiderBilgileri.giderler.read('ulasimGideri');
    int yeniPara = mevcutPara - ulasimUcreti;

    if(yeniPara < 0 && _kisiBilgileri.ulasim.read('ulasim') != 'yok'){
      getDialog('Araçsız Kaldın!', 'Maddi durumun araç kullanmana yetmiyor.', 'Tamam');
      _kisiBilgileri.ulasim.write('ulasim', 'yok');
      _kisiBilgileri.ulasim.write('ulasimId', 0);
      _gelirGiderBilgileri.giderler.write('ulasimGideri', 0);
      kisiBilgiController.ulasimControllerFunction('yok');
    }else{
      _kisiBilgileri.para.write('para', yeniPara);
      kisiBilgiController.mevcutParaControllerFunction(yeniPara);
    }

  }

  void beslenmeGideriGuncelle(){
    int mevcutPara = _kisiBilgileri.para.read('para');
    int beslenmeUcreti = _gelirGiderBilgileri.giderler.read('beslenmeGideri');
    int yeniPara = mevcutPara - beslenmeUcreti;

    if(yeniPara < 0 && _kisiBilgileri.beslenme.read('beslenme') != 'yok'){
      getDialog('Yemeksiz Kaldın!', 'Maddi durumun bu yemekleri yemene yetmiyor.', 'Tamam');
      _kisiBilgileri.beslenme.write('beslenme', 'yok');
      _kisiBilgileri.beslenme.write('beslenmeId', 0);
      _gelirGiderBilgileri.giderler.write('beslenmeGideri', 0);
      kisiBilgiController.beslenmeControllerFunction('yok');
    }else{
      _kisiBilgileri.para.write('para', yeniPara);
      kisiBilgiController.mevcutParaControllerFunction(yeniPara);
    }


  }



}