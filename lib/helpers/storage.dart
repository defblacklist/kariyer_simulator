import 'package:get_storage/get_storage.dart';

class ProfilBilgileri{
  final profilOlusturuldu = GetStorage();
  final defaultDil = GetStorage();
}

class KisiBilgileri{
  final isim = GetStorage();
  final para = GetStorage();
  final yil = GetStorage();
  final ay = GetStorage();
  final mutluluk = GetStorage();
  final saglik = GetStorage();
  final barinma = GetStorage();
  final giyim = GetStorage();
  final iliski = GetStorage();
  final ulasim = GetStorage();
  final beslenme = GetStorage();
  final egitim = GetStorage();
  final meslek = GetStorage();
}

class GorevBilgileri{
  final gorevler = GetStorage();
}

class GelirGiderBilgileri{
  final gelirler = GetStorage();
  final giderler = GetStorage();
}
