import 'package:FlutterReader/reddit_data.dart';
import "package:test/test.dart";

void main() {
  test("should parse the reddit response", () {
    List<List<String>> expectedList = [["", "", ""]];
    RedditData expectedRedditData = new RedditData(expectedList);

    RedditData redditData = RedditDataParser.parse('[["","",""]]');
    expect(redditData.toString(), equals(expectedRedditData.toString()));
  });
}