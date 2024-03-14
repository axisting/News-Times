import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_times/core/constants/constants.dart';
import 'package:news_times/core/constants/view_constants.dart';
import 'package:news_times/features/most_popular_news/presentation/blocs/cubit/selected_news_cubit.dart';

class DetailBodyWidget extends StatelessWidget {
  const DetailBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: ViewConstants.mediumPadding,
        right: ViewConstants.mediumPadding,
        left: ViewConstants.mediumPadding,
      ),
      child: BlocBuilder<SelectedNewsCubit, SelectedNewsState>(
        builder: (context, state) {
          if (state is SelectedNewsLoaded) {
            return ListView(
              children: [
                _CoverImage(state: state),
                _NewsType(state: state),
                _NewsTitle(state: state),
                const SizedBox(height: ViewConstants.mediumPadding),
                _NewsSummary(state: state),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class _NewsType extends StatelessWidget {
  final SelectedNewsLoaded state;
  const _NewsType({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Text(state.news.type,
        style: const TextStyle(fontSize: ViewConstants.fontSizeLarge));
  }
}

class _NewsTitle extends StatelessWidget {
  final SelectedNewsLoaded state;
  const _NewsTitle({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Text(
      state.news.title,
      style: const TextStyle(
          fontSize: ViewConstants.fontSizeLarge, fontWeight: FontWeight.bold),
    );
  }
}

class _NewsSummary extends StatelessWidget {
  final SelectedNewsLoaded state;
  const _NewsSummary({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Text(
      state.news.summary,
      style: const TextStyle(fontSize: ViewConstants.fontSizeMedium),
    );
  }
}

class _CoverImage extends StatelessWidget {
  final SelectedNewsLoaded state;
  const _CoverImage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(ViewConstants.mediumBorderRadius),
          child: Image.network(
            state.news.newsMediaList.isEmpty
                ? urlNytimesLogo
                : state.news.newsMediaList.first.newsMediaMetadataList.last.url,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: ViewConstants.largePadding,
          bottom: ViewConstants.mediumPadding,
          child: Text(
            state.news.publishedDate,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: ViewConstants.fontSizeMedium),
          ),
        )
      ],
    );
  }
}
