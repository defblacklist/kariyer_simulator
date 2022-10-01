import 'package:get/get.dart';
import 'package:kariyer_simulator/helpers/storage.dart';

class KisiBilgiController extends GetxController{
  var para = KisiBilgileri().para.read('para');
  var yil = KisiBilgileri().yil.read('yil');
  var ay = KisiBilgileri().ay.read('ay');
  var mutluluk = KisiBilgileri().mutluluk.read('mutluluk');
  var saglik = KisiBilgileri().saglik.read('saglik');
  var barinma = KisiBilgileri().barinma.read('barinma');
  var giyim = KisiBilgileri().giyim.read('giyim');
  var iliski = KisiBilgileri().iliski.read('iliski');
  var ulasim = KisiBilgileri().ulasim.read('ulasim');
  var beslenme = KisiBilgileri().beslenme.read('beslenme');
  var egitim = KisiBilgileri().egitim.read('egitim');
  var meslek = KisiBilgileri().meslek.read('meslek');

  zamanControllerFunction(int ayBilgi, int yilBilgi){
    ay = ayBilgi;
    yil = yilBilgi;
    update();
  }

  hayatiBilgiControllerFunction(double mutlulukBilgi, double saglikBilgi){
    mutluluk = mutlulukBilgi;
    saglik = saglikBilgi;
    update();
  }

  mevcutParaControllerFunction(int mevcutPara){
    para = mevcutPara;
    update();
  }

  barinmaControllerFunction(String barinmaBilgi){
    barinma = barinmaBilgi;
    update();
  }

  giyimControllerFunction(String giyimBilgi){
    giyim = giyimBilgi;
    update();
  }

  iliskiControllerFunction(String iliskiBilgi){
    iliski = iliskiBilgi;
    update();
  }

  ulasimControllerFunction(String ulasimBilgi){
    ulasim = ulasimBilgi;
    update();
  }

  beslenmeControllerFunction(String beslenmeBilgi){
    beslenme = beslenmeBilgi;
    update();
  }

  egitimControllerFunction(String egitimBilgi){
    egitim = egitimBilgi;
    update();
  }

  meslekControllerFunction(String meslekBilgi){
    meslek = meslekBilgi;
    update();
  }

}

