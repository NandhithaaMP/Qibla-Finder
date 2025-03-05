import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qibla_compass/provider/mainProvider.dart';
import 'package:qibla_compass/screens/splashScreen.dart';
import 'package:qibla_compass/theme.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCXzeK55INH1W9dHIGov1ZBWSyOuOTp5_4",
        appId: "1:1054471089058:android:7ab4411c3dc6f219afe0fb",
        messagingSenderId: "1054471089058",
        projectId: "qibla-8a330",
        storageBucket:"qibla-8a330.firebasestorage.app"
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool hasPermission=false;/// tracks whether app has location permission
  Future getPermission()async{
    if(await Permission.location.serviceStatus.isEnabled){
      var status=await Permission.location.status;///verifiew the app has location permission

      if(status.isGranted){
        hasPermission=true;
      }
      else{
        Permission.location.request().then((value) {
          setState(() {
            hasPermission=(value==PermissionStatus.granted);
          });
        },);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qibla Compass',
        // theme: ThemeData(
        //
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        home:
        FutureBuilder(
          builder: (context, snapshot) {
            if(hasPermission){
              return const SplashScreen();
            }
            else{
              return Scaffold(
                backgroundColor: Colors.blueGrey.shade800,
                body:  Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("Error Loading",style: TextStyle(color: Colors.red),))
                  ],
                ),
              );
            }
          },
          future: getPermission(),
        ),
        // home:SplashScreen(),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:qibla_compass/screens/splashScreen.dart';
// import 'package:qibla_compass/theme.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//
//   bool hasPermission=false;/// tracks whether app has location permission
//   Future getPermission()async{
//     if(await Permission.location.serviceStatus.isEnabled){
//       var status=await Permission.location.status;///verifiew the app has location permission
//
//       if(status.isGranted){
//         hasPermission=true;
//       }
//       else{
//         Permission.location.request().then((value) {
//           setState(() {
//             hasPermission=(value==PermissionStatus.granted);
//           });
//         },);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Qibla Compass',
//       // theme: ThemeData(
//       //
//       //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       //   useMaterial3: true,
//       // ),
//       themeMode: ThemeMode.system,
//       theme: MyTheme.lightTheme,
//       darkTheme: MyTheme.darkTheme,
//       home:
//       FutureBuilder(
//         builder: (context, snapshot) {
//           if(hasPermission){
//             return const SplashScreen();
//           }
//           else{
//             return Scaffold(
//               backgroundColor: Colors.blueGrey.shade800,
//               body:  Column(mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Center(child: Text("Error Loading",style: TextStyle(color: Colors.red),))
//                 ],
//               ),
//             );
//           }
//         },
//         future: getPermission(),
//       ),
//       // home:SplashScreen(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:qibla_compass/screens/splashScreen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Qibla Compass',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:SplashScreen(),
//     );
//   }
// }

