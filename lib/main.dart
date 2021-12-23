import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsonliste/anasayfa.dart';
import 'package:jsonliste/jsonanasayfa.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: "Antep Savunması Harp Günlüğü",
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    OneSignal.shared.setAppId("98b6c84e-69b7-456d-a025-ee4db9b9da15");

    OneSignal.shared
        .promptUserForPushNotificationPermission(fallbackToSettings: true);

    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assest/splashscreen-01.jpg"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
