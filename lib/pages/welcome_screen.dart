import 'package:flutter/material.dart';

import '../components/buttons.dart';
import '../components/page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _pageController = PageController();
  final _pageIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) => _pageIndexNotifier.value = index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 340.0,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 40.0),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: PageView.builder(
                        itemCount: 3,
                        onPageChanged: _onPageChanged,
                        itemBuilder: (_, __) {
                          return Column(
                            children: <Widget>[
                              Expanded(
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: <Widget>[
                                    Image.asset(
                                        'assets/png/stacked-ellipses.png'),
                                    Positioned(
                                      left: -20.0,
                                      bottom: -15.0,
                                      child: Image.asset(
                                          'assets/png/left-brain.png'),
                                    ),
                                    Positioned(
                                      right: -24.0,
                                      bottom: -38.0,
                                      child: Image.asset(
                                          'assets/png/right-brain.png'),
                                    ),
                                    const Icon(
                                      Icons.play_arrow,
                                      color: Color(0xFF2E77F2),
                                      size: 48.0,
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                'Brain Wont Stop Rolling With Flicksby',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        },
                        controller: _pageController,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ValueListenableBuilder<int>(
                      valueListenable: _pageIndexNotifier,
                      builder: (context, pageIndex, _) {
                        return PageIndicator(
                          index: pageIndex,
                          length: 3,
                          activeSize: 10.0,
                          inActiveSize: 10.0,
                        );
                      }),
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Colors.white,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: <Widget>[
                    CustomOutlinedButton(
                      text: 'Continue with Google',
                      onPressed: () {},
                      iconData: Icons.email,
                    ),
                    const SizedBox(height: 16.0),
                    CustomOutlinedButton(
                      text: 'Continue with Twitter (x)',
                      onPressed: () {},
                      iconData: Icons.telegram,
                    ),
                    const SizedBox(height: 16.0),
                    CustomOutlinedButton(
                      text: 'Continue with Facebook',
                      onPressed: () {},
                      iconData: Icons.facebook,
                      outlinedColor: Colors.transparent,
                      backgroundColor: const Color(0xFF2E77F2),
                      foregroundColor: Colors.white,
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Or',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    CustomOutlinedButton(
                      text: 'Sign up with Email or phone Number',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          'Already a member ?',
                          style: TextStyle(
                            color: Color(0xFF8E8E8E),
                          ),
                        ),
                        TextButton(
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xFF2079F6),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5, // Optional
                              decorationColor: Colors.transparent,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    RichText(
                      text: const TextSpan(
                        text: 'By signing up I agree with the ',
                        style: TextStyle(
                          color: Color(0xFF8E8E8E),
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Terms & Conditions.',
                            style: TextStyle(
                              color: Color(0xFFAD6400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
