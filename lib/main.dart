import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterReader/reddit_data.dart';
import 'package:FlutterReader/reddit_home.dart';
//library reddit;


void main() {
  runApp(new RedditApp());
}

class RedditApp extends StatefulWidget {
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
        routes: <String, WidgetBuilder>{'/': (_) => new RedditHome(_reddits)});
  }

  ThemeData _theme() {
    return new ThemeData(
        brightness: Brightness.light, primarySwatch: Colors.purple);
  }
}
