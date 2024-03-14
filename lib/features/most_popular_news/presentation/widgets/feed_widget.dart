import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_times/core/constants/constants.dart';
import 'package:news_times/core/constants/view_constants.dart';
import 'package:news_times/core/extensions/l10n_extension.dart';
import 'package:news_times/features/most_popular_news/business/entities/news_entity.dart';
import 'package:news_times/features/most_popular_news/presentation/blocs/bloc/most_popular_bloc.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:news_times/features/most_popular_news/presentation/blocs/cubit/selected_news_cubit.dart';
import 'package:news_times/features/most_popular_news/presentation/pages/news_detail_page.dart';

part 'news_tile.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(context.translate.most_popular_news,
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        const MostPopularBody(),
      ],
    );
  }
}

class MostPopularBody extends StatelessWidget {
  const MostPopularBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return BlocBuilder<MostPopularNewsBloc, MostPopularNewsState>(
      builder: (context, state) {
        if (state is MostPopularNewsLoadedState) {
          List<NewsEntity> newsList = state.mostPopularNews.news;

          return SizedBox(
            height: MediaQuery.of(context).size.height * 4 / 7 + 10,
            child: mostPopularNewsListView(controller, newsList),
          );
        } else {
          return const Placeholder();
        }
      },
    );
  }

  ListView mostPopularNewsListView(
      ScrollController controller, List<NewsEntity> newsList) {
    return ListView.separated(
      controller: controller,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(width: 1),
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        NewsEntity news = newsList[index];

        return InkWell(
          onTap: () {
            context.read<SelectedNewsCubit>().changeNews(news: news);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NewsDetailPage()));
            //context.read<SelectedNewsCubit>().changeNews(news: news);
          },
          child: NewsTile(
            imageUrl: news.newsMediaList.isEmpty
                ? urlNytimesLogo
                : news.newsMediaList.first.newsMediaMetadataList.last.url,
            title: news.type.toUpperCase(),
            subtitle: news.title,
            duration: news.publishedDate,
            totalStars: 5,
            filledStars: 3.5,
            averageRating: 3.5,
            totalVotes: 50,
            favoriteIconColor: Colors.yellow,
          ),
        );
      },
    );
  }
}
