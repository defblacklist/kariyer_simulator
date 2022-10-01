class Gorevler{
  String? gorevAdi;
  int? odul;
  Gorevler(this.gorevAdi, this.odul);

}

class GorevlerListesi{
  List<Gorevler>? gorev = [
    Gorevler('Yeni hayat oluştur.', 1000),
    Gorevler('Barınabileceğin bir yer bul.', 1000),
    Gorevler('Yeni bir kıyafet satın al.', 1000),
    Gorevler('Bir işe başla.', 1000),
    Gorevler('Eğitim almaya başla.', 1000),
    Gorevler('Ulaşım aracı bul.', 1500),
    Gorevler('İlişkiye başla.', 2000),
  ];

}

class Yemekler{
  int? id;
  String? yemekAdi;
  int? ucret;
  Yemekler(this.id, this.yemekAdi, this.ucret);
}

class YemekListeleri{
  List<Yemekler> yemek = [
    Yemekler(1, 'Ücretsiz iş yemeği', 0),
    Yemekler(2, 'Ucuz tost', 100),
    Yemekler(3, 'Ortalama fast food', 500),
    Yemekler(4, 'Ucuz kafe', 750),
    Yemekler(5, 'Ev yemeği', 1300),
    Yemekler(6, 'Ev yemeği + iyi restaurant', 2500),
    Yemekler(7, 'İyi restaurant', 3500),
    Yemekler(8, 'Pahalı restaurant', 5000),
    Yemekler(9, 'Influencerlar ile yemek', 10000),
    Yemekler(10, 'İş insanları ile elit restaurant', 20000),
    Yemekler(11, 'Politikacılar ile elit restaurant', 50000),
  ];
}

class Iliskiler{
  int? id;
  String? iliskiAd;
  int? ucret;
  Iliskiler(this.id, this.iliskiAd, this.ucret);
}

class IliskiListeleri{
  List<Iliskiler> iliski = [
    Iliskiler(1, 'Kız arkadaş', 100),
    Iliskiler(2, 'Eş', 1500),
    Iliskiler(3, 'Eş + çocuk', 2500),
    Iliskiler(4, 'Eş + 2 çocuk', 3500),
    Iliskiler(5, 'Eş + 2 çocuk + 1 torun', 5000),
    Iliskiler(6, 'Eş + 2 çocuk + 2 torun', 7500),
  ];
}

class Barinma{
  int? id;
  String? barinmaAd;
  int? ucret;
  Barinma(this.id, this.barinmaAd, this.ucret);
}

class BarinmaListeleri{
  List<Barinma> barinma = [
    Barinma(1, 'Paylaşımlı Oda', 100),
    Barinma(2, 'Tek Oda', 200),
    Barinma(3, 'Ucuz Apartman', 450),
    Barinma(4, 'Orta Apartman', 800),
    Barinma(5, 'Konforlu Apartman', 2500),
    Barinma(6, 'Rezidans Dairesi', 5000),
    Barinma(7, 'Villa', 7500),
    Barinma(8, 'Lüks Villa', 15000),
    Barinma(9, 'Malikane', 25000),
    Barinma(10, 'Saray', 50000),
    Barinma(11, 'Özel Ada', 250000),
  ];
}

class Giyim{
  int? id;
  String? giyimAd;
  int? ucret;
  Giyim(this.id, this.giyimAd, this.ucret);
}

class GiyimListeleri{
  List<Giyim> giyim = [
    Giyim(1, 'Tişört + Şort + Terlik', 50),
    Giyim(2, 'Tişört + Jean + Ayakkabı', 150),
    Giyim(3, 'Ucuz kıyafetler', 250),
    Giyim(4, 'Lüks marka kıyafetler', 2500),
    Giyim(5, 'Takım elbise + kravat + ayakkabı', 7500),
    Giyim(6, 'Lüks takım elbise + kravat + ayakkabı', 20000),
  ];
}

class Ulasim{
  int? id;
  String? ulasimAd;
  int? ucret;
  Ulasim(this.id, this.ulasimAd, this.ucret);
}

class UlasimListeleri{
  List<Ulasim> ulasim = [
    Ulasim(1, 'Bisiklet', 50),
    Ulasim(2, 'Eski Model Araba', 1500),
    Ulasim(3, 'Kullanılmış Yeni Model Araba', 3000),
    Ulasim(4, 'Yeni Araba', 5000),
    Ulasim(5, 'Orta Düzey Araba', 7000),
    Ulasim(6, 'Premium Araba', 15000),
    Ulasim(7, 'Lüks Araba', 20000),
    Ulasim(8, 'Spor Araba + Elit Araba', 50000),
    Ulasim(9, 'Küçük özel uçak', 150000),
    Ulasim(10, 'Orta özel uçak', 250000),
    Ulasim(11, 'Lüks özel uçak', 500000),
  ];
}

class Egitim{
  int? id;
  String? egitimAd;
  int? ucret;
  int? sure;
  int? gerekenEgitimId;
  Egitim(this.id, this.egitimAd, this.ucret, this.sure, this.gerekenEgitimId);
}

class EgitimListeleri{
  List<Egitim> egitim = [
    Egitim(1, 'Ehliyet Kursu', 100, 6, 0),
    Egitim(2, 'Yüksekokul', 500, 24, 0),
    Egitim(3, 'Yönetici Eğitimi', 1500, 2, 2),
    Egitim(4, 'Satış Yönetimi Eğitimi', 2000, 2, 3),
    Egitim(5, 'Personel Yönetimi Eğitimi', 2500, 2, 4),
    Egitim(6, 'Grafik Tasarım Eğitimi', 500, 6, 2),
    Egitim(7, 'Yazılımcı Eğitimi', 750, 12, 2),
    Egitim(8, 'Ekonomi ve Finans Eğitimi', 750, 24, 2),
    Egitim(9, 'Girişimcilik Okulu', 1000, 6, 8),
    Egitim(10, 'Girişimci Eğitimi 1', 2000, 2, 9),
    Egitim(11, 'Girişimci Eğitimi 2', 4000, 4, 10),
    Egitim(12, 'Girişimci Eğitimi 3', 7000, 6, 11),
    Egitim(13, 'Hukuk Eğitimi', 1500, 24, 2),
    Egitim(14, 'Siyaset Eğitimi', 2000, 36, 2),
  ];
}


class MeslekServis{
  String? meslekServisAd;
  int? ucret;
  int? barinmaGereksinim;
  int? giyimGereksinim;
  int? iliskiGereksinim;
  int? ulasimGereksinim;
  int? egitimGereksinim;
  int? beslenmeGereksinim;
  MeslekServis(
    this.meslekServisAd,
    this.ucret,
    this.barinmaGereksinim,
    this.giyimGereksinim,
    this.iliskiGereksinim,
    this.ulasimGereksinim,
    this.egitimGereksinim,
    this.beslenmeGereksinim,
  );
}

class MeslekServisListeleri{
  List<MeslekServis> meslekServis = [
    MeslekServis('Organizatör', 1500, 1, 0, 0, 0, 0, 0),
    MeslekServis('Bilet Denetçisi', 2000, 0, 0, 0, 0, 0, 0),
    MeslekServis('Garson', 3000, 0, 0, 0, 0, 0, 0),
    MeslekServis('Kasiyer', 4500, 0, 0, 0, 0, 0, 0),
    MeslekServis('Taksi Şoförü', 5500, 0, 0, 0, 0, 0, 0),
  ];
}

class MeslekOfis{
  String? meslekOfisAd;
  int? ucret;
  int? barinmaGereksinim;
  int? giyimGereksinim;
  int? iliskiGereksinim;
  int? ulasimGereksinim;
  int? egitimGereksinim;
  int? beslenmeGereksinim;
  MeslekOfis(
    this.meslekOfisAd,
    this.ucret,
    this.barinmaGereksinim,
    this.giyimGereksinim,
    this.iliskiGereksinim,
    this.ulasimGereksinim,
    this.egitimGereksinim,
    this.beslenmeGereksinim,
  );
}

class MeslekOfisListeleri{
  List<MeslekOfis> meslekOfis = [
    MeslekOfis('Satış Temsilcisi', 6000, 0, 0, 0, 0, 0, 0),
    MeslekOfis('Satış Uzmanı', 7500, 0, 0, 0, 0, 0, 0),
    MeslekOfis('Senior Yönetici', 8500, 0, 0, 0, 0, 0, 0),
    MeslekOfis('Supervisor', 11000, 0, 0, 0, 0, 0, 0),
    MeslekOfis('Genel Müdür', 15000, 0, 0, 0, 0, 0, 0),
  ];
}

class MeslekBT{
  String? meslekBTAd;
  int? ucret;
  int? barinmaGereksinim;
  int? giyimGereksinim;
  int? iliskiGereksinim;
  int? ulasimGereksinim;
  int? egitimGereksinim;
  int? beslenmeGereksinim;
  MeslekBT(
    this.meslekBTAd,
    this.ucret,
    this.barinmaGereksinim,
    this.giyimGereksinim,
    this.iliskiGereksinim,
    this.ulasimGereksinim,
    this.egitimGereksinim,
    this.beslenmeGereksinim,
  );
}

class MeslekBTListeleri{
  List<MeslekBT> meslekBT = [
    MeslekBT('Editör', 6000, 0, 0, 0, 0, 0, 0),
    MeslekBT('Grafik Tasarımcı', 7500, 0, 0, 0, 0, 0, 0),
    MeslekBT('Junior Geliştirici', 8000, 0, 0, 0, 0, 0, 0),
    MeslekBT('Senior Geliştirici', 15000, 0, 0, 0, 0, 0, 0),
    MeslekBT('Yazılım Proje Yöneticisi', 20000, 0, 0, 0, 0, 0, 0),
    MeslekBT('Yazılım Şirketi Yöneticisi', 25000, 0, 0, 0, 0, 0, 0),
  ];
}

class MeslekFinans{
  String? meslekFinansAd;
  int? ucret;
  int? barinmaGereksinim;
  int? giyimGereksinim;
  int? iliskiGereksinim;
  int? ulasimGereksinim;
  int? egitimGereksinim;
  int? beslenmeGereksinim;
  MeslekFinans(
    this.meslekFinansAd,
    this.ucret,
    this.barinmaGereksinim,
    this.giyimGereksinim,
    this.iliskiGereksinim,
    this.ulasimGereksinim,
    this.egitimGereksinim,
    this.beslenmeGereksinim,
  );
}

class MeslekFinansListeleri{
  List<MeslekFinans> meslekFinans = [
    MeslekFinans('Muhasebeci', 7000, 0, 0, 0, 0, 0, 0),
    MeslekFinans('Şube Müdürü', 15000, 0, 0, 0, 0, 0, 0),
    MeslekFinans('Denetçi', 20000, 0, 0, 0, 0, 0, 0),
    MeslekFinans('Bölge Müdürü', 25000, 0, 0, 0, 0, 0, 0),
    MeslekFinans('Genel Müdür', 30000, 0, 0, 0, 0, 0, 0),
  ];
}

class MeslekYuksekIsletme{
  String? meslekYuksekIsletmeAd;
  int? ucret;
  int? barinmaGereksinim;
  int? giyimGereksinim;
  int? iliskiGereksinim;
  int? ulasimGereksinim;
  int? egitimGereksinim;
  int? beslenmeGereksinim;
  MeslekYuksekIsletme(
    this.meslekYuksekIsletmeAd,
    this.ucret,
    this.barinmaGereksinim,
    this.giyimGereksinim,
    this.iliskiGereksinim,
    this.ulasimGereksinim,
    this.egitimGereksinim,
    this.beslenmeGereksinim,
  );
}

class MeslekYuksekIsletmeListeleri{
  List<MeslekYuksekIsletme> meslekYuksekIsletme = [
    MeslekYuksekIsletme('Orta Düzey 1 İş Yeri Sahibi', 7500, 0, 0, 0, 0, 0, 0),
    MeslekYuksekIsletme('Yüksek Düzey 2 İş Yeri Sahibi', 20000, 0, 0, 0, 0, 0, 0),
    MeslekYuksekIsletme('Orta Düzey İş Yeri Zincirleri', 30000, 0, 0, 0, 0, 0, 0),
    MeslekYuksekIsletme('Yüksek Düzey İş Yeri Zincirleri', 50000, 0, 0, 0, 0, 0, 0),
  ];
}

class MeslekDevlet{
  String? meslekDevletAd;
  int? ucret;
  int? barinmaGereksinim;
  int? giyimGereksinim;
  int? iliskiGereksinim;
  int? ulasimGereksinim;
  int? egitimGereksinim;
  int? beslenmeGereksinim;
  MeslekDevlet(
    this.meslekDevletAd,
    this.ucret,
    this.barinmaGereksinim,
    this.giyimGereksinim,
    this.iliskiGereksinim,
    this.ulasimGereksinim,
    this.egitimGereksinim,
    this.beslenmeGereksinim,
  );
}

class MeslekDevletListeleri{
  List<MeslekDevlet> meslekDevlet = [
    MeslekDevlet('Belediye Başkanı', 20000, 0, 0, 0, 0, 0, 0),
    MeslekDevlet('Vali', 30000, 0, 0, 0, 0, 0, 0),
    MeslekDevlet('Milletvekili', 50000, 0, 0, 0, 0, 0, 0),
    MeslekDevlet('Bakan', 75000, 0, 0, 0, 0, 0, 0),
    MeslekDevlet('Başbakan', 200000, 0, 0, 0, 0, 0, 0),
    MeslekDevlet('Cumhurbaşkanı', 500000, 0, 0, 0, 0, 0, 0),
  ];
}

