// ignore_for_file: override_on_non_overriding_member


import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  final List<double> list=[
       100.0,
       150.0,
       200.0,
       250.0,
       300.0,
       350.0,
  ];
  
  @override
  void initState(){
    super.initState();
    animationController =AnimationController(vsync: this, duration: Duration(seconds: 10));
  animation=Tween(begin: 0.0,end: 250.0).animate(animationController);

  animationController.addListener((){
    print(animation.value);
    setState(() {
      
    });}
  );

  animationController.forward();
  }

  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: animation.value,
              width: animation.value,
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.5),
                shape: BoxShape.circle
              )
            ),
          ],
        ),
        
      ),

    );
  }
}

// Widget Tween(dynamic animation,color,){
//   return  Container(
//               height: animation.value,
//               width: animation.value,
//               decoration: BoxDecoration(
//                 color: color,
//                 shape: BoxShape.circle
//               )
//             );
// }