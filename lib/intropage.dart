import 'package:flutter/material.dart';
import 'IntroPages/page1.dart';
import 'IntroPages/page2.dart';
import 'IntroPages/page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'homepage.dart';
class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            ///page view
            PageView(
              controller: _controller,
              children: [
                Page1(),
                Page2(),
                Page3()
              ],
            ),

            Container(
              alignment: Alignment(0,0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(controller: _controller, count: 3),
                ],
              ),
            ),

            InkWell(
              onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())),
              child: Container(
                margin: EdgeInsets.only(right: 35,top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Skip',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                )
              ),
            )

          ],
        ),
      ),
    );
  }
}
