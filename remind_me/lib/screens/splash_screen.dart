import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    animation = Tween<double>(begin: 0.2, end: 1).animate(animationController);
    animationController.repeat(reverse: true); 
    goToNextView();
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 2), () {
      Get.off(() => Home(), transition: Transition.rightToLeft);
    });
  }

  @override
  void dispose() {
    animationController.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: FadeTransition(
          opacity: animation, // No need for null assertion after 'late' initialization
          child: Image.asset(
            'images/remind.png',
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
