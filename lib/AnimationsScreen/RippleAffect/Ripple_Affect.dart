import 'package:flutter/material.dart';

class RippleAffect extends StatefulWidget {
  const RippleAffect({super.key});

  @override
  State<RippleAffect> createState() => _RippleAffectState();
}

class _RippleAffectState extends State<RippleAffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  final List<double> _listRadius = [100.0, 150.0, 200.0, 250.0,300.0,350.0];


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(child: Text("Ripple Affect")),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
              Ripple(_listRadius[0], _animation,Colors.blue),
              Ripple(_listRadius[1], _animation,Colors.pink),
              Ripple(_listRadius[2], _animation,Colors.yellow),
              Ripple(_listRadius[3], _animation,Colors.purple),
              Ripple(_listRadius[4], _animation,Colors.orange),
              Ripple(_listRadius[5], _animation,Colors.red),
              Icon(Icons.add_call,color: Colors.green,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text("Attend Call",style: TextStyle(fontSize: 16,color: Colors.green),),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 150),
              //   child: Ripple(350.0, _animation,Colors.blueAccent),
              // )
          ]
              
        ),
      ),
    );
  }
}

Widget Ripple(radius, dynamic _animation,color){
  return Container(
                  width: radius * _animation.value,
                  height: radius * _animation.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withOpacity(1.0 - _animation.value),
                  ),
                );

}