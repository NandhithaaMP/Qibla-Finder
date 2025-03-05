import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{

  final FirebaseFirestore db=FirebaseFirestore.instance;

  // int tapCount=0;
  //
  // void startCounting(){
  //   print("Start counting");
  //
  //   String id=DateTime.now().microsecondsSinceEpoch.toString();
  //   tapCount++;
  //   HashMap<String,dynamic>map=HashMap();
  //   map["ALLAH_AKBAR"]=tapCount;
  //   db.collection("TOTAL_COUNT").doc(id).set(map,SetOptions(merge: true)).then((value) {
  //     print("Updated tap count :$tapCount");
  //     notifyListeners();
  //   },).catchError((error){print("Failed to update tap count:$error");});

  // }

  int tapCount = 0;

  void startCounting() {
    print("Start counting");

    // Specify the document where you want to update the field
    String documentId = "YOUR_DOCUMENT_ID"; // Replace with your actual document ID or a predefined one
    String id=DateTime.now().microsecondsSinceEpoch.toString();
    // Increment the tapCount
    tapCount++;

    // Create a map to update the field
    HashMap<String, dynamic> map = HashMap();
    map["ALLAH_AKBAR"] = tapCount;

    // Update the field in Firestore (without creating a new document each time)
    db.collection("TOTAL_COUNT").doc(documentId).set(map, SetOptions(merge: true)).then((value) {
      print("Updated tap count: $tapCount");
      notifyListeners();
    }).catchError((error) {
      print("Failed to update tap count: $error");
    });
  }


  void resetCounting(){
    print("You are click to reset");

    tapCount=0;
    notifyListeners();
  }




}