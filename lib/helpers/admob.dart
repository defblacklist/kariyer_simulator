import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kariyer_simulator/helpers/getx_controller.dart';
import 'package:kariyer_simulator/helpers/storage.dart';

class AdmobHelper{
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  KisiBilgileri _kisiBilgileri = KisiBilgileri();
  final kisiBilgiController = Get.put(KisiBilgiController());

  void odulluReklamOlustur(){
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad){
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError){
          _rewardedAd = null;
        },
      )
    );
  }

  void odulluReklamGoster(){
    if(_rewardedAd == null){
      return;
    }

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (RewardedAd ad){
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError aderror){
        ad.dispose();
        odulluReklamOlustur();
      }

    );

    _rewardedAd!.show(
        onUserEarnedReward: (ad, reward){
          int mevcutPara = _kisiBilgileri.para.read('para');
          _kisiBilgileri.para.write('para', mevcutPara+500);
          kisiBilgiController.mevcutParaControllerFunction(mevcutPara+500);
        });
    _rewardedAd = null;



  }

  void gecisReklamOlustur(){
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad){
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError){
          _interstitialAd = null;
        },
      ),
    );



  }

  void gecisReklamGoster(){
    if(_interstitialAd == null){
      return;
    }

    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad){
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError aderror){
        ad.dispose();
        gecisReklamOlustur();
      }
    );

    _interstitialAd!.show();
    _interstitialAd = null;

  }



}