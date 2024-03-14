import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_times/core/constants/view_constants.dart';
import 'package:news_times/core/extensions/l10n_extension.dart';
import 'package:news_times/features/most_popular_news/presentation/blocs/bloc/most_popular_bloc.dart';
import 'package:news_times/features/most_popular_news/presentation/widgets/feed_widget.dart';
//import 'package:news_times/features/most_popular_news/presentation/blocs/cubit/most_popular_news_cubit_cubit.dart';

// * Ana Sayfa
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<MostPopularNewsBloc>().add(FetchMostPopularNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    context.read<MostPopularNewsBloc>().add(FetchMostPopularNewsEvent());
    return Padding(
      padding: const EdgeInsets.all(ViewConstants.smallPadding),
      child: BlocBuilder<MostPopularNewsBloc, MostPopularNewsState>(
        builder: (context, state) {
          if (state is MostPopularNewsInitialState) {
            //  * Loading
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (state is MostPopularNewsLoadedState) {
            //  * Data
            return const FeedWidget();
          } else if (state is MostPopularNewsErrorState) {
            return Center(
              //  ! Error
              child: Text(state.error.errorMessage),
            );
          } else {
            return Center(
              // * Empty List
              child: Text(context.translate.empty_list),
            );
          }
        },
      ),
    );
  }
}
