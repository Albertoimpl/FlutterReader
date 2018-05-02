
import 'dart:convert';


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
    List jsonResponse = JSON.decode(response);

    print("Item 0, 1 and 2 consecutively : ${jsonResponse[0]}, ${jsonResponse[1]} and ${jsonResponse[2]}");

    List<List<String>> parseData = new List<List<String>>();

    for (List listOfStrings in jsonResponse) {
      parseData.add(listOfStrings.cast<String>());
    }

    return new RedditData(parseData);
  }

}