import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SendToFirebase {
  String moveiID;
  String moveiTitle;
  String moveiImg;
  String moveiGenre;
  String moveiRating;
  String moveiContent;
  String moveiLength;

  SendToFirebase(this.moveiID,this.moveiTitle, this.moveiImg, this.moveiGenre, this.moveiRating,
      this.moveiContent, this.moveiLength);

  CollectionReference favMovieRef = FirebaseFirestore.instance
      .collection('favorite')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('myList');

  //print(FirebaseAuth.instance.currentUser!.uid);
  addToFirebase() async {
    try {
      await favMovieRef.doc(moveiID).set({
      "id":moveiID,
      "title":moveiTitle,  
      "img": moveiImg,
      "genre": moveiGenre,
      "rating": moveiRating,
      "content": moveiContent,
      "length": moveiLength
    });

    } catch (e) {
      print(e.toString());
    }
    
  }

}
