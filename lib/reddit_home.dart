
part of reddit;

class RedditHome extends StatefulComponent {
  RedditHome(this.reddits);

  final List<Reddit> reddits;

  RedditHomeState createState() => new RedditHomeState();
}

class RedditHomeState extends State<RedditHome> {

  Widget build(BuildContext context) {
    return new Scaffold(
        body: _buildList()
    );
  }

  Widget _buildList() {
    return new Scaffold(
        toolBar: new ToolBar(
            center: new Text('Reddits')
        ),
        body: new MaterialList<Reddit>(
            type: MaterialListType.oneLineWithAvatar,
            items: config.reddits,
            itemBuilder: (BuildContext context, Reddit reddit, int index) {
              return new RedditRow(
                  reddit: reddit
              );
            }
        )
    );
  }

}