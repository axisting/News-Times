import 'dart:convert';

import 'package:news_times/core/errors/exception.dart';
import 'package:news_times/features/most_popular_news/data/models/most_popular_news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MostPopularNewsLocalDataSource {
  Future<void> cacheMostPopularNews({required MostPopularNewsModel? mostPopularNewsToCache});
  Future<MostPopularNewsModel> getLastMostPopularNews();
}

const cashedMostPopularNews = 'CACHED_TEMPLATE';

class MostPopularNewsLocalDataSourceImpl implements MostPopularNewsLocalDataSource {
  final SharedPreferences sharedPreferences;

  const MostPopularNewsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheMostPopularNews({required MostPopularNewsModel? mostPopularNewsToCache}) async {
    if (mostPopularNewsToCache != null) {
      sharedPreferences.setString(
          cashedMostPopularNews, json.encode(mostPopularNewsToCache.toJson()));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<MostPopularNewsModel> getLastMostPopularNews() async {
    String? jsonString = sharedPreferences.getString(cashedMostPopularNews);
    if (jsonString != null) {
      return Future.value(
          MostPopularNewsModel.fromJson(json: json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
