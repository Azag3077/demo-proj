import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/constants/assets.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _navigateToNextScreen(BuildContext context) async {
    await Future.delayed(.5.seconds);
    if (!context.mounted) return;

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
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SvgPicture.asset(AssetImages.svgs.splashLogo)
                    .animate()
                    .fadeOut(delay: 2.seconds, duration: 1.2.seconds),
                Image.asset(AssetImages.png.icon)
                    .animate()
                    .fadeIn(delay: 2.6.seconds, duration: 1.2.seconds)
                    .fadeOut(delay: 4.6.seconds, duration: 1.2.seconds),
                Image.asset(AssetImages.png.icon)
                    .animate(onComplete: (_) => _navigateToNextScreen(context))
                    .moveX(
                      begin: 200.0,
                      delay: 5.seconds,
                      duration: 1.2.seconds,
                      curve: Curves.easeInOutCubic,
                    )
                    .fadeIn(duration: 1000.ms),
              ],
            ),
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
