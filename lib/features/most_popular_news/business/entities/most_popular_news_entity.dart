import 'package:news_times/features/most_popular_news/business/entities/news_entity.dart';

// * Bu API sorgusu yaptığımızda gelen en dış katman, Haberler news içinde
class MostPopularNewsEntity {
  final String status;
  final int numResults;
  final List<NewsEntity> news;
  const MostPopularNewsEntity(
      {required this.numResults, required this.status, required this.news});
}

// ! bunu düşüneceğim ?