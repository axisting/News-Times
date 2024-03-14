part of 'selected_news_cubit.dart';

sealed class SelectedNewsState extends Equatable {
  const SelectedNewsState();

  @override
  List<Object> get props => [];
}

final class SelectedNewsInitial extends SelectedNewsState {}

final class SelectedNewsLoaded extends SelectedNewsState {
  final NewsEntity news;

  const SelectedNewsLoaded(this.news);

  @override
  List<Object> get props => [news];
}
