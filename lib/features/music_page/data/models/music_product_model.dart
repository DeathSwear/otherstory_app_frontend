import 'package:otherstory_app/features/main_page/data/models/abstract_product_card_data.dart';

class MusicProductModel implements ProductCardData {
  @override
  final int id;
  @override
  final String time;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String imageSource;
  @override
  final bool isFree;
  @override
  final Duration duration;

  MusicProductModel({
    required this.id,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.imageSource,
    required this.isFree,
    required this.duration,
  });
}
