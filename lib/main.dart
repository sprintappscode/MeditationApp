import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'view/splash_screen.dart';
// import 'dart:io' show Platform;

AppOpenAd? appOpenAd;
loadAppOpenAd() {
  AppOpenAd.load(
    adUnitId: 'ca-app-pub-4761502052861398/7734348698',
    // adUnitId: Platform.isAndroid
    //     ? 'ca-app-pub-3940256099942544/3419835294'
    //     : 'ca-app-pub-3940256099942544/5662855259',
    request: const AdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        appOpenAd = ad;
        appOpenAd!.show();
      },
      onAdFailedToLoad: (error) {
        print(error);
      },
    ),
    orientation: AppOpenAd.orientationPortrait,
  );
}

void main() {
  // loadAppOpenAd();

  WidgetsFlutterBinding.ensureInitialized;
  // MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    loadAppOpenAd();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
