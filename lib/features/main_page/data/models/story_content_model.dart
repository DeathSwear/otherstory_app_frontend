class StoryContentModel {
  final String imageUrl;
  final String title;
  final String? subtitle;
  final String? link;

  StoryContentModel({
    required this.imageUrl,
    required this.title,
    this.subtitle,
    this.link,
  });
}
