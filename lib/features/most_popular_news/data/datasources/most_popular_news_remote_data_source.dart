import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_times/core/constants/constants.dart';
import 'package:news_times/core/errors/exception.dart';
import 'package:news_times/core/extensions/nytimes_extension.dart';
import 'package:news_times/core/params/params.dart';
import 'package:dio/dio.dart';
import 'package:news_times/features/most_popular_news/data/models/most_popular_news_model.dart';

abstract class MostPopularNewsRemoteDataSource {
  Future<MostPopularNewsModel> getMostPopularNews(
      {required MostPopularNewsParams mostPopularNewsParams});
  //Future<List<MostPopularNewsModel>> getAllMostPopularNews();
}

class MostPopularNewsRemoteDataSourceImpl
    implements MostPopularNewsRemoteDataSource {
  final Dio dio;

  const MostPopularNewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<MostPopularNewsModel> getMostPopularNews(
      {required MostPopularNewsParams mostPopularNewsParams,
      PopularityFrom popularityFrom = PopularityFrom.viewed}) async {
    final response = await dio.get(
      '$API_BASE_URL$apiUrlMostPopular${popularityFrom.toStringCustom()}',
      queryParameters: {'api-key': dotenv.env['API_KEY']},
    );

    if (response.statusCode == 200) {
      return MostPopularNewsModel.fromJson(json: response.data);
    } else {
      throw ServerException();
    }
  }
}
