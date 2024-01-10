import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static String id = 'welcome_screen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 3),
    // );

    // animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // animation = ColorTween(begin: Colors.white, end: Colors.lightBlue)
    //     .animate(controller);

    // controller.forward();

    // Looping animations
    // animation.addStatusListener((status) {
    //   if (animation.isCompleted == true) {
    //     controller.reverse();
    //   } else if (animation.isDismissed == true) {
    //     controller.forward();
    //   }
    // });

    // controller.addListener(() {
    //   setState(() {
    //     // print(animation.value);
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    // height: animation.value * 60,
                    height: 60,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(
                  // repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      speed: const Duration(milliseconds: 100),
                      'Flash Chat',
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              text: 'Log In',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              text: 'Register',
              onPressed: () {
                //Go to registration screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
