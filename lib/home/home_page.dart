
import 'package:flutter/material.dart';
import 'package:mysos/home/help_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFinished = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: SwipeableButtonView(
            buttonText: 'SLIDE FOR HELP',
            buttonWidget: Container(
              child: Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
              ),),
            activeColor: Color(0xFF009C41),
            isFinished: isFinished,
            onWaitingProcess: () {
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  isFinished = true;
                });
              });
            },
            onFinish: () async {
              await Navigator.push(context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: HelpScreen()));

              //TODO: For reverse ripple effect animation
              setState(() {
                isFinished = false;
              });
            },
          ),
        ),
      ),
    );
  }
}
