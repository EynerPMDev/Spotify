class PlayListModel {
  String imageUrl;
  String title;
  String? owner;

  PlayListModel({
    required this.imageUrl,
    required this.title,
    this.owner,
  });
}
