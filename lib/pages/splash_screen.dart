import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helper/pages/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), navigateToNextScreen);
    super.initState();
  }

  void navigateToNextScreen() {
    if (!mounted) return;

    final route = MaterialPageRoute(builder: (_) => const WelcomeScreen());
    Navigator.pushReplacement(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            SvgPicture.asset('assets/svg/splash_logo.svg'),
            const Spacer(),
            Text(
              'Available on streaming devices',
              style: TextStyle(
                color: const Color(0xFF818181).withOpacity(.44),
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.monitor,
                  color: const Color(0xFF818181).withOpacity(.44),
                  size: 20.0,
                ),
                Icon(
                  Icons.tablet_android,
                  color: const Color(0xFF818181).withOpacity(.44),
                  size: 20.0,
                ),
                Icon(
                  Icons.laptop,
                  color: const Color(0xFF818181).withOpacity(.44),
                  size: 20.0,
                ),
              ],
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
