import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_times/features/most_popular_news/presentation/blocs/cubit/selected_news_cubit.dart';
import 'package:news_times/features/most_popular_news/presentation/widgets/detail_body_widget.dart';

// * Haber Detay Sayfası
class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedNewsCubit, SelectedNewsState>(
      builder: (context, state) {
        if (state is SelectedNewsInitial) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (state is SelectedNewsLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.news.title),
            ),
            body: const DetailBodyWidget(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
