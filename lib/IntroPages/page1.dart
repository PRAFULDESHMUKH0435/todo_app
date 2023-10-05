import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            child:Lottie.asset('assets/Animations/Animation - 1696429829247.json'),
          ),
          Text('Screen 1',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
