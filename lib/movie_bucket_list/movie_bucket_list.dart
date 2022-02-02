import 'package:flutter/material.dart';

class MovieBucketListWidget extends StatefulWidget {
  List movieBucket;
  MovieBucketListWidget(this.movieBucket);

  @override
  _MovieBucketListWidgetState createState() => _MovieBucketListWidgetState();
}

class _MovieBucketListWidgetState extends State<MovieBucketListWidget> {
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
