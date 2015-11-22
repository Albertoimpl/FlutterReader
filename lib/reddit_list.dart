
part of reddit;

class RedditList extends StatelessComponent {
  RedditList({Key key, this.reddits});

  final List<Reddit> reddits;

  Widget build(BuildContext context) {
    return new ScrollableList<Reddit>(
        items: reddits,
        itemExtent: RedditRow.kHeight,
        itemBuilder: (BuildContext context, Reddit reddit, int index) {
          return new RedditRow(
              reddit: reddit
          );
        }
    );
  }
}