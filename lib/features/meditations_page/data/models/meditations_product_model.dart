class MeditationsProductModel {
  final int id;
  final String time;
  final String title;
  final String subtitle;
  final String imageSource;
  final bool isFree;
  final Duration duration;

  MeditationsProductModel(
      {required this.id,
      required this.time,
      required this.title,
      required this.subtitle,
      required this.imageSource,
      required this.isFree,
      required this.duration});
}
