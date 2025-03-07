import 'package:ecole_it_demo/view/pages/magic_ball.dart';
import 'package:ecole_it_demo/view/pages/splash.dart';
import 'package:flutter/material.dart';

class EcoleItDemo extends StatelessWidget {
  const EcoleItDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MagicBall(),
        '/splash': (context) => const Splash(),
      },
      // default route
      initialRoute: '/splash',
    );
  }
}
