import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kariyer_simulator/components/widget.dart';
import 'package:kariyer_simulator/helpers/getx_controller.dart';
import 'package:kariyer_simulator/helpers/storage.dart';

class SecimIslemleri{

  final KisiBilgileri _kisiBilgileri = KisiBilgileri();
  final kisiBilgiController = Get.put(KisiBilgiController());
  final GelirGiderBilgileri _gelirGiderBilgileri = GelirGiderBilgileri();
  final GorevBilgileri _gorevBilgileri = GorevBilgileri();

  barinmaSecim(int? barinmaId, String? barinmaAd, int? ucret){
    if(ucret! > _kisiBilgileri.para.read('para')){
      getDialog('İşlem Başarısız', 'Paranız yeterli değil.', 'Tamam');
    }else{
      int mevcutPara = _kisiBilgileri.para.read('para');
      int yeniPara = mevcutPara - ucret;

      // Mevcut seçim ile aynı olup olmadığının kontrolü:
      if(_kisiBilgileri.barinma.read('barinma') == barinmaAd){
        return false;
      }

      // Görev sorgusu
      if(_gorevBilgileri.gorevler.read('gorev2') == false){
        _gorevBilgileri.gorevler.write('gorev2', true);
        _kisiBilgileri.para.write('para', yeniPara+1000);
        kisiBilgiController.mevcutParaControllerFunction(yeniPara+1000);
      }else{
        _kisiBilgileri.para.write('para', yeniPara);
        kisiBilgiController.mevcutParaControllerFunction(yeniPara);
      }

      _gelirGiderBilgileri.giderler.write('barinmaGideri', ucret);
      _kisiBilgileri.barinma.write('barinma', barinmaAd);
      _kisiBilgileri.barinma.write('barinmaId', barinmaId);
      kisiBilgiController.barinmaControllerFunction(barinmaAd!);

    }
  }

  giyimSecim(int? giyimId, String? giyimAd, int? ucret){
    if(ucret! > _kisiBilgileri.para.read('para')){
      getDialog('İşlem Başarısız', 'Paranız yeterli değil.', 'Tamam');
    }else{
      int mevcutPara = _kisiBilgileri.para.read('para');
      int yeniPara = mevcutPara - ucret;

      // Mevcut seçim ile aynı olup olmadığının kontrolü:
      if(_kisiBilgileri.giyim.read('giyim') == giyimAd){
        return false;
      }

      // Görev Sorgusu
      if(_gorevBilgileri.gorevler.read('gorev3') == false){
        _gorevBilgileri.gorevler.write('gorev3', true);
        _kisiBilgileri.para.write('para', yeniPara+1000);
        kisiBilgiController.mevcutParaControllerFunction(yeniPara+1000);
      }else{
        _kisiBilgileri.para.write('para', yeniPara);
        kisiBilgiController.mevcutParaControllerFunction(yeniPara);
      }

      _kisiBilgileri.giyim.write('giyim', giyimAd);
      _kisiBilgileri.giyim.write('giyimId', giyimId);
      kisiBilgiController.giyimControllerFunction(giyimAd!);

    }
  }

  iliskiSecim(int? iliskiId, String? iliskiAd, int? ucret){
    if(ucret! > _kisiBilgileri.para.read('para')){
      getDialog('İşlem Başarısız', 'Paranız yeterli değil.', 'Tamam');
    }else{
      int mevcutPara = _kisiBilgileri.para.read('para');
      int yeniPara = mevcutPara - ucret;

      // Mevcut seçim ile aynı olup olmadığının kontrolü:
      if(_kisiBilgileri.iliski.read('iliski') == iliskiAd){
        return false;
      }

      // Görev sorgusu
      if(_gorevBilgileri.gorevler.read('gorev7') == false){
        _gorevBilgileri.gorevler.write('gorev7', true);
        _kisiBilgileri.para.write('para', yeniPara+2000);
        kisiBilgiController.mevcutParaControllerFunction(yeniPara+2000);
      }else{
        _kisiBilgileri.para.write('para', yeniPara);
        kisiBilgiController.mevcutParaControllerFunction(yeniPara);
      }

      _gelirGiderBilgileri.giderler.write('iliskiGideri', ucret);
      _kisiBilgileri.iliski.write('iliski', iliskiAd);
      _kisiBilgileri.iliski.write('iliskiId', iliskiId);
      kisiBilgiController.iliskiControllerFunction(iliskiAd!);
    }
  }

  ulasimSecim(int? ulasimId, String? ulasimAd, int? ucret){
    if(ucret! > _kisiBilgileri.para.read('para')){
      getDialog('İşlem Başarısız', 'Paranız yeterli değil.', 'Tamam');
    }else{
      int mevcutPara = _kisiBilgileri.para.read('para');
      int yeniPara = mevcutPara - ucret;

      // Mevcut seçim ile aynı olup olmadığının kontrolü:
      if(_kisiBilgileri.ulasim.read('ulasim') == ulasimAd){
        return false;
      }

      // Görev sorgusu
      if(_gorevBilgileri.gorevler.read('gorev6') == false){
        _gorevBilgileri.gorevler.write('gorev6', true);
        _kisiBilgileri.para.write('para', yeniPara+1500);
        kisiBilgiController.mevcutParaControllerFunction(yeniPara+1500);
      }else{
        _kisiBilgileri.para.write('para', yeniPara);
        kisiBilgiController.mevcutParaControllerFunction(yeniPara);
      }

      _gelirGiderBilgileri.giderler.write('ulasimGideri', ucret);
      _kisiBilgileri.ulasim.write('ulasim', ulasimAd);
      _kisiBilgileri.ulasim.write('ulasimId', ulasimId);
      kisiBilgiController.ulasimControllerFunction(ulasimAd!);

    }
  }

  beslenmeSecim(int? beslenmeId, String? beslenmeAd, int? ucret){
    if(ucret! > _kisiBilgileri.para.read('para')){
      getDialog('İşlem Başarısız', 'Paranız yeterli değil.', 'Tamam');
    }else{
      int mevcutPara = _kisiBilgileri.para.read('para');
      int yeniPara = mevcutPara - ucret;

      // Mevcut seçim ile aynı olup olmadığının kontrolü:
      if(_kisiBilgileri.beslenme.read('beslenme') == beslenmeAd){
        return false;
      }

      _kisiBilgileri.para.write('para', yeniPara);
      kisiBilgiController.mevcutParaControllerFunction(yeniPara);

      _gelirGiderBilgileri.giderler.write('beslenmeGideri', ucret);
      _kisiBilgileri.beslenme.write('beslenme', beslenmeAd);
      _kisiBilgileri.beslenme.write('beslenmeId', beslenmeId);
      kisiBilgiController.beslenmeControllerFunction(beslenmeAd!);

    }
  }

  egitimSecim(int? egitimId, String? egitimAd, int? ucret, int? sure){
    if(ucret! > _kisiBilgileri.para.read('para')){
      getDialog('İşlem Başarısız', 'Paranız yeterli değil.', 'Tamam');
    }else{
      int mevcutPara = _kisiBilgileri.para.read('para');
      int yeniPara = mevcutPara - ucret;

      // Mevcut seçim ile aynı olup olmadığının kontrolü:
      if(_kisiBilgileri.egitim.read('egitim') == egitimAd){
        return false;
      }

      // Görev sorgusu
      if(_gorevBilgileri.gorevler.read('gorev5') == false){
        _gorevBilgileri.gorevler.write('gorev5', true);
        _kisiBilgileri.para.write('para', yeniPara+1000);
        kisiBilgiController.mevcutParaControllerFunction(yeniPara+1000);
      }else{
        _kisiBilgileri.para.write('para', yeniPara);
        kisiBilgiController.mevcutParaControllerFunction(yeniPara);
      }

      // Seçilen eğitimden daha önce mezun olunup olunmadığının kontrolü:
      if(_kisiBilgileri.egitim.read('$egitimAd') == 99){
        return false;
      }

      _kisiBilgileri.egitim.write('egitim_suresi', sure);
      _gelirGiderBilgileri.giderler.write('egitimGideri', ucret);
      _kisiBilgileri.egitim.write('egitim', egitimAd);
      _kisiBilgileri.egitim.write('egitimId', egitimId);
      kisiBilgiController.egitimControllerFunction(egitimAd!);


    }
  }

  meslekSecim(String? meslekAdi, int? ucret){

    // İlk meslek seciminde para bugu olmaması için para ekleyemiyoruz...
    int mevcutPara = _kisiBilgileri.para.read('para');

    if(_kisiBilgileri.meslek.read('meslek') == meslekAdi){
      return;
    }


    // Görev Sorgusu
    if(_gorevBilgileri.gorevler.read('gorev4') == false){
      _gorevBilgileri.gorevler.write('gorev4', true);
      _kisiBilgileri.para.write('para', mevcutPara+1000);
      kisiBilgiController.mevcutParaControllerFunction(mevcutPara+1000);
    }else{
      _kisiBilgileri.para.write('para', mevcutPara);
      kisiBilgiController.mevcutParaControllerFunction(mevcutPara);
    }

    _gelirGiderBilgileri.gelirler.write('isGeliri', ucret);
    _kisiBilgileri.meslek.write('meslek', meslekAdi);
    kisiBilgiController.meslekControllerFunction(meslekAdi!);
    Get.back();



  }

  hayatDegeriArttir(double mutluluk, double saglik, int ucret){

    double mevcutMutluluk = _kisiBilgileri.mutluluk.read('mutluluk');
    double mevcutSaglik = _kisiBilgileri.saglik.read('saglik');
    int mevcutToplamPara = _kisiBilgileri.para.read('para');

    double yeniMutlulukDeger = mevcutMutluluk + mutluluk;
    double yeniSaglikDeger = mevcutSaglik + saglik;
    int yeniToplamPara = mevcutToplamPara - ucret;

    // her ikisi zaten 100 ise bosuna arttırma
    if(mevcutMutluluk == 100 && mevcutSaglik == 100){
      return false;
    }

    // eger yeni degerler 100'ün üzerindeyse 100'e al
    if(yeniMutlulukDeger > 100){
      yeniMutlulukDeger = 100;
    }

    if(yeniSaglikDeger > 100){
      yeniSaglikDeger = 100;
    }

    // Eğer para yetmiyorsa işlemi yapma
    if(yeniToplamPara < 0){
      getDialog('İşlem Başarısız', 'Paranız yeterli değil.', 'Tamam');
      return false;
    }

    _kisiBilgileri.mutluluk.write('mutluluk', yeniMutlulukDeger);
    _kisiBilgileri.saglik.write('saglik', yeniSaglikDeger);
    kisiBilgiController.hayatiBilgiControllerFunction(yeniMutlulukDeger, yeniSaglikDeger);
    _kisiBilgileri.para.write('para', yeniToplamPara);
    kisiBilgiController.mevcutParaControllerFunction(yeniToplamPara);

  }


}