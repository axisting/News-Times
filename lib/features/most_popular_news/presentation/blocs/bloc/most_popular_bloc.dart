import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_times/core/connection/network_info.dart';
import 'package:news_times/core/errors/failure.dart';
import 'package:news_times/core/params/params.dart';
import 'package:news_times/features/most_popular_news/business/entities/most_popular_news_entity.dart';
import 'package:news_times/features/most_popular_news/data/datasources/most_popular_news_local_data_source.dart';
import 'package:news_times/features/most_popular_news/data/datasources/most_popular_news_remote_data_source.dart';
import 'package:news_times/features/most_popular_news/data/repositories/most_popular_news_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'most_popular_event.dart';
part 'most_popular_state.dart';

class MostPopularNewsBloc
    extends Bloc<MostPopularNewsEvent, MostPopularNewsState> {
  MostPopularNewsBloc() : super(MostPopularNewsInitialState()) {
    on<FetchMostPopularNewsEvent>(_mapFetchMostPopularNewsEventToState);
  }

  Future<void> _mapFetchMostPopularNewsEventToState(
      FetchMostPopularNewsEvent event,
      Emitter<MostPopularNewsState> emit) async {
    //emit(MostPopularNewsInitialState()); // * Eğer bu kodu açarsan her sayfa geçişinde tekrar InitialState'i emit edebilirsin. Bu her sayfa değişiminde loading ekranı getirir.

    try {
      final MostPopularNewsRepositoryImpl repository;
      repository = MostPopularNewsRepositoryImpl(
        remoteDataSource: MostPopularNewsRemoteDataSourceImpl(dio: Dio()),
        localDataSource: MostPopularNewsLocalDataSourceImpl(
          sharedPreferences: await SharedPreferences.getInstance(),
        ),
        networkInfo: NetworkInfoImpl(InternetConnection()),
      );
      final failureOrMostPopularNews = await repository.getMostPopularNews(
          mostPopularNewsParams: MostPopularNewsParams(id: 0));
      emit(failureOrMostPopularNews.fold(
        (failure) => MostPopularNewsErrorState(failure),
        (mostPopularNews) => MostPopularNewsLoadedState(mostPopularNews),
      ));
    } catch (error) {
      emit(MostPopularNewsErrorState(StateManagementFailure()));
    }
  }
}
