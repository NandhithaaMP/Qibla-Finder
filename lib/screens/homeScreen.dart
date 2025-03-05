


// ----------------cureently running code no issue 2-------------------------
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import 'package:provider/provider.dart';
import 'package:qibla_compass/provider/mainProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin=0.0;

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin{  ///provide animation capabilities for rotation of the qibla  direction

  int tapCount=0;///variable to store the tap count

  @override
  void initState(){
    _animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    animation=Tween(begin: 0.0,end: 0.0).animate(_animationController!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Qiblah",style: TextStyle(color: Colors.green),),
          bottom: TabBar(

            indicator: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.green,
                Colors.white,
                Colors.green
              ],
              ),
              borderRadius: BorderRadius.circular(30),
              border: Border.all()
            ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.green,
              tabs: [
            Tab(text: "Compass",),
            Tab(text: "Prayer",),
          ],
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(8),
            dividerColor: Colors.green,
            padding: EdgeInsets.only(right: 10,left: 10),
          ),
        ),
        // backgroundColor: Color(0xff99ebff),
        body:TabBarView(
          children: [

            ///qiblah direction


            StreamBuilder(
              stream: FlutterQiblah.qiblahStream,
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),

                  );
                }
                final qiblaDirection=snapshot.data;
                animation=Tween(
                  begin: begin,
                  end: (qiblaDirection!.qiblah *(pi /180)* -1),
                ).animate(_animationController!);

                begin=(qiblaDirection.qiblah*(pi /180)* -1);
                _animationController!.forward(from: 0);


                return Center(
                  child: SizedBox(
                    child: AnimatedBuilder(
                      animation: animation!,
                      builder: (context, child) => Transform.rotate(
                        angle: animation!.value,
                        child: Image.asset("asset/images/qibla-compass.png",color: Colors.green.shade900,scale: 2,),
                        // child: Image.asset("asset/images/qibla direction.jpg"),
                      ),
                    ),
                  ),
                );
              },
            ),


            /// prayer section with tap counting

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<MainProvider>(
                    builder: (context,sValue,child) {
                      return GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   tapCount++;
                          // });
                          sValue.startCounting();
                        },
                        child: CircleAvatar(

                          backgroundColor: Colors.green.shade100,
                          // maxRadius: 20,
                          radius: 120,
                          child:
                          Image.asset("asset/images/double-tap.png",scale: 5,color: Colors.green.shade900,),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     // Reset logic here
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //     padding: EdgeInsets.all(0),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(8),
                          //     ),
                          //     backgroundColor: Colors.transparent,
                          //     shadowColor: Colors.transparent,
                          //   ),
                          //   child: Image.asset(
                          //     'asset/images/double-tap.png', // Replace with the path of your image
                          //     fit: BoxFit.cover,
                          //     width: 100, // Adjust the size as needed
                          //     height: 100, // Adjust the size as needed
                          //     color: Colors.green.shade900,
                          //   ),
                          // )
                        ),
                      );
                    }
                  ),
                  SizedBox(height: 20,),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return Text("Tap Count :${value.tapCount}",style: TextStyle(fontSize: 25));
                    }
                  ),
                  // Text("Tap Count :$tapCount",style: TextStyle(fontSize: 25)),

                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: Consumer<MainProvider>(
                      builder: (context,rValue,child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade100, // Button color
                            minimumSize: Size.fromHeight(40), // Minimum height
                            fixedSize: Size(80, 40), // Fixed size with small width (80) and height (60)
                          ),
                          onPressed: () {
                            /// Add  reset functionality
                            rValue.resetCounting();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min, // Ensures button only takes as much width as needed
                            children: [
                              Text("Reset"),
                              SizedBox(width: 8), // Adds space between the text and the icon
                              Icon(Icons.restart_alt),
                            ],
                          ),
                        );
                      }
                    ),
                  ),


                ],
              ),
            )


          ],


        )
      ),
    );
  }
}


// ist code no issue-----------------------------

// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_qiblah/flutter_qiblah.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// Animation<double>? animation;
// AnimationController? _animationController;
// double begin=0.0;
//
// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin{  ///provide animation capabilities for rotation of the qibla  direction
//   @override
//   void initState(){
//     _animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 500));
//     animation=Tween(begin: 0.0,end: 0.0).animate(_animationController!);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Color(0xff99ebff),
//       body:StreamBuilder(
//           stream: FlutterQiblah.qiblahStream,
//           builder: (context, snapshot) {
//             if(snapshot.connectionState==ConnectionState.waiting){
//               return Container(
//                 alignment: Alignment.center,
//                 child: CircularProgressIndicator(
//                   color: Colors.grey,
//                 ),
//
//               );
//             }
//             final qiblaDirection=snapshot.data;
//             animation=Tween(
//               begin: begin,
//               end: (qiblaDirection!.qiblah *(pi /180)* -1),
//             ).animate(_animationController!);
//
//             begin=(qiblaDirection.qiblah*(pi /180)* -1);
//             _animationController!.forward(from: 0);
//            
//            
//             return Center(
//               child: SizedBox(
//                 child: AnimatedBuilder(
//                     animation: animation!,
//                     builder: (context, child) => Transform.rotate(
//                         angle: animation!.value,
//                       child: Image.asset("asset/images/direction.png"),
//                       // child: Image.asset("asset/images/qibla direction.jpg"),
//                     ),
//                 ),
//               ),
//             );
//           },
//       )
//     );
//   }
// }
