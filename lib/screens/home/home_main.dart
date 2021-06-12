import 'dart:math';

import 'package:flutter/material.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> with SingleTickerProviderStateMixin{
  bool showList = false;
  AnimationController _arrowAnimationController;
  Animation _arrowAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimation =
        Tween<double>(begin: 0.0, end: pi).animate(_arrowAnimationController);
  }
  // @override
  // void dispose() {
  //   super.dispose();
  //   _animationController.dispose();
  // }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        //Top bar
        Expanded(flex:10, child:Row(
          children: [
            SizedBox(width: 15,),
         GestureDetector(
           onTap: (){setState(() {
             showList = !showList;
             showList?_arrowAnimationController.reverse():_arrowAnimationController.forward();
           });
           print(showList);},
           child: Row(
                  children: [
                    Text('자양동',style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                   AnimatedBuilder(animation: _arrowAnimationController, builder: (context, child)=>Transform.rotate(
                     angle: _arrowAnimation.value,
                     child: Icon(
                       Icons.arrow_drop_down,
                     ),
                   ))

                  ],
                ),
         ),

            // PopupMenuButton(
            //   child: Row(
            //     children: [
            //       Text('자양동',style: TextStyle(fontWeight: FontWeight.bold),
            //       ),
            //       Icon(Icons.arrow_drop_down)
            //     ],
            //   ),
            //     itemBuilder: (context){
            //   return List.generate(5, (index) => PopupMenuItem(child: Text('$index'),));
            // })
          ],
        )),
      //ListView
      Expanded(flex:100, child:Container(color: Colors.lightGreen,))],
    );
  }
}
