
part of reddit;

class RedditRow extends StatelessComponent {
  RedditRow({
    Reddit reddit
  }) : this.reddit = reddit, super(key: new ObjectKey(reddit));

  final Reddit reddit;

  static const double kHeight = 79.0;

  Widget build(BuildContext context) {
    return new ListItem(
        left: new CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            label : ""
        ),
        center: new Text(reddit.title),
        right : new Text(reddit.date)
    );
  }

}