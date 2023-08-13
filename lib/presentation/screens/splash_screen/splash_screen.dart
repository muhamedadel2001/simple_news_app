import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/core/screens.dart' as screens;
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      value: 1,
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _animation = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -1.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    Timer(
      const Duration(milliseconds: 5000),
      () => Navigator.pushNamedAndRemoveUntil(
          context, screens.homeLayOut, (route) => false),
    );
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              darkSkyBlue,
              lightSkyBlue,
              darkSkyBlue,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _animation,
                child: Image.asset(
                  'assets/news.png',
                  height: 30.h,
                  width: 50.w,
                ),
              ),
              Text(
                'NewS',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35.sp),
              ),


            ],
          ),
        ),

      ),

    );
  }
}
