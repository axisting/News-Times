import 'package:news_times/core/constants/constants.dart';
import 'package:news_times/features/most_popular_news/business/entities/most_popular_news_entity.dart';
import 'package:news_times/features/most_popular_news/data/models/news_model.dart';

class MostPopularNewsModel extends MostPopularNewsEntity {
  const MostPopularNewsModel(
      {required String status,
      required int numResult,
      List<NewsModel> news = const []})
      : super(
          status: status,
          numResults: numResult,
          news: news,
        );

  factory MostPopularNewsModel.fromJson({required Map<String, dynamic> json}) {
    List<NewsModel> newsModelList = (json[kNews] as List<dynamic>)
        .map((e) => NewsModel.fromJson(json: e))
        .toList();
    return MostPopularNewsModel(
        status: json[kStatus],
        numResult: json[kNumResults],
        news: newsModelList); // NewsModel.fromJson(json: json[kNews])
  }

  Map<String, dynamic> toJson() {
    return {
      kStatus: status,
      kNumResults: numResults,
      kNews: news,
    };
  }
}
