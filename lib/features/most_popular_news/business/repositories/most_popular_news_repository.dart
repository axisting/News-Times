import 'package:dartz/dartz.dart';

import 'package:news_times/core/errors/failure.dart';
import 'package:news_times/core/params/params.dart';
import 'package:news_times/features/most_popular_news/business/entities/most_popular_news_entity.dart';

abstract class MostPopularNewsRepository {
  Future<Either<Failure, MostPopularNewsEntity>> getMostPopularNews(
      {required MostPopularNewsParams mostPopularNewsParams});
}
