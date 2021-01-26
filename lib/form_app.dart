import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'form_app_body.dart';

class FormApp extends StatefulWidget {
  @override
  _FormAppState createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "An Ordinary Form App, Nothing To See Here",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.pink,
        ),
      ),
      home: Banner(
        location: BannerLocation.topEnd,
        message: "github.com/Isti01",
        child: FormAppBody(),
      ),
    );
  }
}
