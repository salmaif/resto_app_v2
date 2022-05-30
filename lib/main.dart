import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:resto_app_v2/ui/resto_detail_screen.dart';
import 'package:resto_app_v2/ui/resto_list_screen.dart';
import 'package:resto_app_v2/ui/resto_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resto App v2',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'images/restaurant.png',
        ),
        backgroundColor: Colors.brown,
        duration: 1500,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: const RestoListScreen(),
      ),
      routes: {
        RestoDetailScreen.routeName: (context) => RestoDetailScreen(
              id: ModalRoute.of(context)?.settings.arguments as String,
            ),
        RestoSearchScreen.routeName: (context) => const RestoSearchScreen()
      },
    );
  }
}
