library reddit;

import 'package:flutter/material.dart';

import 'reddit_data.dart';

part 'reddit_home.dart';
part 'reddit_list.dart';
part 'reddit_row.dart';

void main() {
  runApp(new RedditApp());
}

class RedditApp extends StatefulComponent {
  RedditAppState createState() => new RedditAppState();
}

class RedditAppState extends State<RedditApp> {

  final List<Reddit> _reddits = [];

  void initState() {
    super.initState();
    new RedditDataFetcher((RedditData data) {
      setState(() {
       data.appendTo(_reddits);
      });
    });
  }

  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Reddit',
      theme: _theme(),
      routes: <String, RouteBuilder>{
        '/':         (RouteArguments args) => new RedditHome(_reddits)
      }
    );
  }

  ThemeData _theme() {
    return new ThemeData(
        brightness: ThemeBrightness.light,
        primarySwatch: Colors.purple
    );
  }

}

