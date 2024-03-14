import 'package:news_times/core/constants/constants.dart';
import 'package:news_times/features/most_popular_news/business/entities/news_entity.dart';
import 'package:news_times/features/most_popular_news/data/models/news_media_model.dart';

class NewsModel extends NewsEntity {
  NewsModel({
    required int id,
    required String title,
    required String publishedDate,
    required String summary,
    required String type,
    required List<NewsMediaModel> newsMediaList,
  }) : super(
            id: id,
            title: title,
            publishedDate: publishedDate,
            summary: summary,
            newsMediaList: newsMediaList,
            type: type);
  factory NewsModel.fromJson({required Map<String, dynamic> json}) {
    List<NewsMediaModel> newsMediaList = (json[kMedia] as List<dynamic>)
        .map((e) => NewsMediaModel.fromJson(json: e))
        .toList();
    return NewsModel(
        id: json[kId],
        title: json[kTitle],
        publishedDate: json[kPublishedDate],
        summary: json[kSummary],
        newsMediaList: newsMediaList,
        type: json[kType]);
  }

  Map<String, dynamic> toJson() {
    return {
      kId: id,
      kTitle: title,
      kPublishedDate: publishedDate,
      kSummary: summary,
      kType: type,
      kMedia: newsMediaList,
    };
  }
}
