//part of reddit;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterReader/reddit_data.dart';
import 'package:FlutterReader/reddit_row.dart';

class RedditHome extends StatefulWidget {
  RedditHome(this.reddits);

  final List<Reddit> reddits;

  RedditHomeState createState() => new RedditHomeState(reddits);
}

class RedditHomeState extends State<RedditHome> {
  RedditHomeState(this.reddits);

  final List<Reddit> reddits;

  Widget build(BuildContext context) {
    return new Scaffold(body: _buildList());
  }

  Widget _buildList() {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Reddits')),
      body: new ListView.builder(
          itemCount: reddits.length,
          itemBuilder: (BuildContext context, int index) {
            return new RedditRow(reddit: reddits[index]);
          }),
    );
  }
}
