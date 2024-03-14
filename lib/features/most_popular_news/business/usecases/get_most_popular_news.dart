import 'package:dartz/dartz.dart';
import 'package:news_times/core/errors/failure.dart';
import 'package:news_times/core/params/params.dart';
import 'package:news_times/features/most_popular_news/business/entities/most_popular_news_entity.dart';
import 'package:news_times/features/most_popular_news/business/repositories/most_popular_news_repository.dart';

class GetMostPopularNews {
  final MostPopularNewsRepository mostPopularNewsRepository;

  GetMostPopularNews({required this.mostPopularNewsRepository});

  Future<Either<Failure, MostPopularNewsEntity>> call({
    required MostPopularNewsParams mostPopularNewsParams,
  }) async {
    return await mostPopularNewsRepository.getMostPopularNews(mostPopularNewsParams: mostPopularNewsParams);
  }
}
