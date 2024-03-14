import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_times/features/most_popular_news/business/entities/news_entity.dart';

part 'selected_news_cubit_state.dart';

class SelectedNewsCubit extends Cubit<SelectedNewsState> {
  SelectedNewsCubit() : super(SelectedNewsInitial());

  Future<void> changeNews({required NewsEntity news}) async {
    emit(SelectedNewsLoaded(news));
  }
}
