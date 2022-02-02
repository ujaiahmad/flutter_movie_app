import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MovieBucketListWidget extends StatefulWidget {
  List movieBucket;
  MovieBucketListWidget(this.movieBucket);

  @override
  _MovieBucketListWidgetState createState() => _MovieBucketListWidgetState();
}

class _MovieBucketListWidgetState extends State<MovieBucketListWidget> {
  CollectionReference favMovieRef = FirebaseFirestore.instance
      .collection('favorite')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('myList');

  getData() async {
    var responseBody = await favMovieRef.get();
    responseBody.docs.forEach((element) {
      print(element.id); // this will get the id of the movie
      print(element.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(favMovieRef);
    getData();
    if (widget.movieBucket.isEmpty) {
      return Column(
        children: const [
          Text('You have no movie list...'),
        ],
      );
    } else {
      return Scaffold(
        body: ListView.builder(
          itemCount: widget.movieBucket.length,
          itemBuilder: (context, index) {
            //isChecked.add(false);
            return Card(
              child: Row(
                children: [
                  Checkbox(
                    value: widget.movieBucket[index][1],
                    onChanged: (bool? value) {
                      setState(() {
                        widget.movieBucket[index][1] =
                            value!; //change tick value to the inverse
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(widget.movieBucket[index][0].toString(),
                        style: widget.movieBucket[index]
                                [1] //change decoration based on boolList
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2)
                            : const TextStyle(decoration: TextDecoration.none)),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.add)),
      );
    }
  }
}
