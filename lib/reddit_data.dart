
import 'dart:convert';

import 'package:flutter/http.dart' as http;

class Reddit {
  String title;
  String url;
  String date;

  Reddit(this.title, this.url, this.date);

  Reddit.fromFields(List<String> fields) {
    title = fields[0];
    url = fields[1];
    date = fields[2];
  }
}

class RedditData {
  List<List<String>> _data;

  RedditData(this._data);

  void appendTo(List<Reddit> reddits) {
    for (List<String> fields in _data) {
      Reddit reddit = new Reddit.fromFields(fields);
      reddits.add(reddit);
    }
  }
}

typedef void RedditDataCallback(RedditData data);

class RedditDataFetcher {

  final RedditDataCallback callback;

  RedditDataFetcher(this.callback) {
    callback(RedditDataParser.parse(_mockData()));
  }

  String _mockData() {
    return '['
    + '["Hello Reddit", "www.albertoimpl.com", "22-11-2015"],'
    + '["Hello World", "www.albertoimpl.com", "21-11-2015"],'
    + '["Hello Flutter", "www.albertoimpl.com", "20-11-2015"]'
    + ']';
  }
}

class RedditDataParser {

  static RedditData parse(String response) {
    var jsonResponse = JSON.decode(response);
    return new RedditData(jsonResponse.toList());
  }

}