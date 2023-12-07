import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/screen/weather_page.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => WeatherPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: content()),
    );
  }

  Widget content() {
    return Container(
      child: Lottie.asset(
        'assets/loading.json',
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
