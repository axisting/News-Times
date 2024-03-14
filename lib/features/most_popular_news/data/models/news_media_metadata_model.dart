import 'package:news_times/core/constants/constants.dart';
import 'package:news_times/features/most_popular_news/business/entities/news_media_metadata.dart';

class NewsMediaMetadataModel extends NewsMediaMetadataEntity {
  NewsMediaMetadataModel({
    required String url,
    required String format,
    required int height,
    required int width,
  }) : super(
          url: url,
          format: format,
          height: height,
          width: width,
        );
  factory NewsMediaMetadataModel.fromJson(
      {required Map<String, dynamic> json}) {
    return NewsMediaMetadataModel(
      url: json[kUrl],
      format: json[kFormat],
      height: json[kHeight],
      width: json[kWidth],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kUrl: url,
      kFormat: format,
      kHeight: height,
      kWidth: width,
    };
  }
}
