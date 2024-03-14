import 'package:dartz/dartz.dart';
import 'package:news_times/core/connection/network_info.dart';
import 'package:news_times/core/errors/exception.dart';
import 'package:news_times/core/errors/failure.dart';
import 'package:news_times/core/params/params.dart';
import 'package:news_times/features/most_popular_news/business/entities/most_popular_news_entity.dart';
import 'package:news_times/features/most_popular_news/business/repositories/most_popular_news_repository.dart';
import 'package:news_times/features/most_popular_news/data/datasources/most_popular_news_local_data_source.dart';
import 'package:news_times/features/most_popular_news/data/datasources/most_popular_news_remote_data_source.dart';
import 'package:news_times/features/most_popular_news/data/models/most_popular_news_model.dart';

class MostPopularNewsRepositoryImpl implements MostPopularNewsRepository {
  final MostPopularNewsRemoteDataSource remoteDataSource;
  final MostPopularNewsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  MostPopularNewsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, MostPopularNewsEntity>> getMostPopularNews(
      {required MostPopularNewsParams mostPopularNewsParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        MostPopularNewsModel remoteMostPopularNews = await remoteDataSource
            .getMostPopularNews(mostPopularNewsParams: mostPopularNewsParams);
        localDataSource.cacheMostPopularNews(
            mostPopularNewsToCache: remoteMostPopularNews);
        return Right(remoteMostPopularNews);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        MostPopularNewsModel localMostPopularNews =
            await localDataSource.getLastMostPopularNews();
        return Right(localMostPopularNews);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
