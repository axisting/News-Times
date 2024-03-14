import 'package:news_times/core/constants/constants.dart';
import 'package:news_times/features/most_popular_news/business/entities/news_media_entity.dart';
import 'package:news_times/features/most_popular_news/business/entities/news_media_metadata.dart';
import 'package:news_times/features/most_popular_news/data/models/news_media_metadata_model.dart';

class NewsMediaModel extends NewsMediaEntity {
  NewsMediaModel({
    required String type,
    required String subtype,
    required String caption,
    required List<NewsMediaMetadataEntity> newsMediaMetadataList,
  }) : super(
          type: type,
          subtype: subtype,
          caption: caption,
          newsMediaMetadataList: newsMediaMetadataList,
        );
  factory NewsMediaModel.fromJson({required Map<String, dynamic> json}) {
    List<NewsMediaMetadataEntity> newsMediaMetadataList =
        (json[kNewsMetadataList] as List<dynamic>)
            .map((e) => NewsMediaMetadataModel.fromJson(json: e))
            .toList();
    return NewsMediaModel(
        type: json[kType],
        subtype: json[kSubtype],
        caption: json[kCaption],
        newsMediaMetadataList: newsMediaMetadataList);
  }

  Map<String, dynamic> toJson() {
    return {
      kType: type,
      kSubtype: subtype,
      kCaption: caption,
      kNewsMetadataList: newsMediaMetadataList,
    };
  }
}
