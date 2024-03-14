import 'package:news_times/features/most_popular_news/business/entities/news_media_entity.dart';

class NewsEntity {
  final int id;
  final String title;
  final String publishedDate;
  final String summary;
  final String type;
  final List<NewsMediaEntity> newsMediaList;

  NewsEntity(
      {required this.id,
      required this.title,
      required this.publishedDate,
      required this.summary,
      required this.type,
      required this.newsMediaList});
}
