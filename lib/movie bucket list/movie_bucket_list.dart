import 'package:flutter/material.dart';

class MovieBucketListWidget extends StatefulWidget {
  List movieBucket;
  MovieBucketListWidget(this.movieBucket);

  @override
  _MovieBucketListWidgetState createState() => _MovieBucketListWidgetState();
}

class _MovieBucketListWidgetState extends State<MovieBucketListWidget> {
  // List isChecked = [];
  // addBoolValue() {
  //   for (var i = 0; i < widget.movieBucket.length; i++) {
  //     isChecked.add(false);
  //   }
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //addBoolValue();
  //   print(widget.movieBucket);
  // }

  // @override
  // bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
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
                        widget.movieBucket[index][1] = value!;
                        // print('This is the ' +
                        //     index.toString() +
                        //     ' isChecked: ' +
                        //     isChecked[index].toString());
                        //print(widget.movieBucket[index][1]);
                      });
                      // print('Movie is ' + widget.movieBucket[index].toString());
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(widget.movieBucket[index][0].toString(),
                        style: widget.movieBucket[index][1]
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2)
                            : const TextStyle(decoration: TextDecoration.none)),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  //isChecked[index] ? Text('Completed') : Text('Hehe'),
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
