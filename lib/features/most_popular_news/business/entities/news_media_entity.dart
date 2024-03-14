import 'package:news_times/features/most_popular_news/business/entities/news_media_metadata.dart';

class NewsMediaEntity {
  final String type;
  final String subtype;
  final String caption;
  final List<NewsMediaMetadataEntity> newsMediaMetadataList;

  NewsMediaEntity(
      {required this.type,
      required this.subtype,
      required this.caption,
      required this.newsMediaMetadataList});
}

// ! bunu düşüneceğim ?