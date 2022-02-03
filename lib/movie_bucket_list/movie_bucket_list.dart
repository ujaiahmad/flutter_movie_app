import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MovieBucketListWidget extends StatefulWidget {
  @override
  _MovieBucketListWidgetState createState() => _MovieBucketListWidgetState();
}

class _MovieBucketListWidgetState extends State<MovieBucketListWidget> {
  Stream<QuerySnapshot> favMovieRef = FirebaseFirestore.instance
      .collection('favorite')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('myList')
      .snapshots();

  // getData() async {
  //   var responseBody = await favMovieRef.get();
  //   responseBody.docs.forEach((element) {
  //     print(element.id); // this will get the id of the movie
  //     print(element.data());
  //   });
  // }
  deleteMovieFromList(movieId) async {
    CollectionReference favMovieRef = FirebaseFirestore.instance
        .collection('favorite')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('myList');

    await favMovieRef
        .doc(movieId)
        .delete()
        .then((value) => print("movie with ID ${movieId} was Deleted"))
        .catchError((error) => print("Failed to delete movie: $error"));
  }

  @override
  Widget build(BuildContext context) {
    //print(favMovieRef);
    //getData();
    return StreamBuilder(
        stream: favMovieRef,
        builder: (context, AsyncSnapshot snapshot) {
          // snapshot will store info that we got from get()
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(), //display loading animation
            );
          }
          if (snapshot.hasError) {
            return Text("there was an error");
          }
          if (snapshot.data!.docs.length == 0) {
            return Center(
              child: Text("You Don't have Any Movie In The List")
              );
          }
          // if (!snapshot.hasData) {
          //   return Text("You Don't have Any Movie In The List");
          // }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Row(
                    children: [
                      Image(
                        image: NetworkImage(
                            snapshot.data.docs[index].data()["img"]),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              snapshot.data.docs[index].data()["title"],
                              style: const TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                                'ID:' + snapshot.data.docs[index].data()["id"]),
                            Text('Genre: ' +
                                snapshot.data.docs[index].data()["genre"]),
                            Text('Rating: ' +
                                snapshot.data.docs[index].data()["rating"]),
                            Text('Content: ' +
                                snapshot.data.docs[index].data()["content"]),
                            Text('Length: ' +
                                snapshot.data.docs[index].data()["length"]),
                            SizedBox(height: 20),
                            //add button
                            ElevatedButton(
                              child: Text('Remove From My List'),
                              onPressed: () {
                                deleteMovieFromList(
                                    snapshot.data.docs[index].data()["id"]);
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } 
          else {
            return Text("You Don't have Any Movie In The List");
          }
        });
  }
}