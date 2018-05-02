import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterReader/reddit_data.dart';

class RedditRow extends StatelessWidget {
  RedditRow({Reddit reddit})
      : this.reddit = reddit,
        super(key: new ObjectKey(reddit));

  final Reddit reddit;

  static const double kHeight = 79.0;

  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Color.lerp(Colors.red, Colors.green,
                reddit.title.codeUnitAt(6).truncateToDouble()),
            child: new Text(new String.fromCharCode(reddit.title.runes.first)),
          ),
          new Text(
            reddit.title,
            maxLines: 1,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          ),
          new Text(reddit.date,
              maxLines: 1,
              textAlign: TextAlign.right,
              textDirection: TextDirection.ltr),
        ],
      ),
    );
  }
}
