import "package:test/test.dart";
import 'package:RedditDart/reddit_data.dart';

void main() {
  test("should parse the reddit response", () {
    List<List<String>> expectedList = [["", "", ""]];
    RedditData expectedRedditData = new RedditData(expectedList);

    RedditData redditData = RedditDataParser.parse('[["","",""]]');
    expect(redditData.toString(), equals(expectedRedditData.toString()));
  });
}