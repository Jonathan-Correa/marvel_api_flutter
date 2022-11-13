import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ucp_flutter_demo_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = {
      50: Color.fromRGBO(236, 29, 36, .1),
      100: Color.fromRGBO(236, 29, 36, .2),
      200: Color.fromRGBO(236, 29, 36, .3),
      300: Color.fromRGBO(236, 29, 36, .4),
      400: Color.fromRGBO(236, 29, 36, .5),
      500: Color.fromRGBO(236, 29, 36, .6),
      600: Color.fromRGBO(236, 29, 36, .7),
      700: Color.fromRGBO(236, 29, 36, .8),
      800: Color.fromRGBO(236, 29, 36, .9),
      900: Color.fromRGBO(236, 29, 36, 1),
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      title: 'MARVEL API APP',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xffEC1D24, primaryColor),
      ),
      initialRoute: 'home',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
