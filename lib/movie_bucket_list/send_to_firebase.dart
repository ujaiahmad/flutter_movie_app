import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SendToFirebase {
  String moveiID;
  String moveiImg;
  String moveiGenre;
  String moveiRating;
  String moveiContent;
  String moveiLength;

  SendToFirebase(this.moveiID, this.moveiImg, this.moveiGenre, this.moveiRating,
      this.moveiContent, this.moveiLength);

  CollectionReference favMovieRef = FirebaseFirestore.instance
      .collection('favorite')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('myList');

  //print(FirebaseAuth.instance.currentUser!.uid);
  addToFirebase() async {
    await favMovieRef.doc(moveiID).set({
      "img":moveiImg,
      "genre":moveiGenre,
      "rating":moveiRating,
      "content":moveiContent,
      "length":moveiLength
    });
  }
}
