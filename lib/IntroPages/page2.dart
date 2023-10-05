import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            child:Lottie.asset('assets/Animations/Animation - 1696429855678.json'),
          ),
          Text('Screen 2',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
