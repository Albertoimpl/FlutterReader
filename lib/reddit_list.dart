import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterReader/reddit_data.dart';
import 'package:FlutterReader/reddit_row.dart';

class RedditList extends StatelessWidget {
  RedditList({Key key, this.reddits});

  final List<Reddit> reddits;

  Widget build(BuildContext context) {
    return ListView.builder(
      padding: new EdgeInsets.all(8.0),
      itemExtent: RedditRow.kHeight,
      itemCount: reddits.length,
      itemBuilder: (BuildContext context, int index) {
        return new RedditRow(reddit: reddits[index]);
      },
    );
  }
}
