part of 'most_popular_bloc.dart';

// State
abstract class MostPopularNewsState {}

class MostPopularNewsInitialState extends MostPopularNewsState {}

final class MostPopularNewsLoadedState extends MostPopularNewsState {
  final MostPopularNewsEntity mostPopularNews;

  MostPopularNewsLoadedState(this.mostPopularNews);
}

final class MostPopularNewsErrorState extends MostPopularNewsState {
  final Failure error;

  MostPopularNewsErrorState(this.error);
  @override
  String toString() {
    return error.errorMessage;
  }
}
