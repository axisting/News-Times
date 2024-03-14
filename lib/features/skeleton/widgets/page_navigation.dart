//import 'package:news_times/features/most_popular_news/presentation/pages/home_page.dart';
import 'package:news_times/features/most_popular_news/presentation/pages/home_page.dart';
import 'package:news_times/features/skeleton/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:news_times/core/extensions/l10n_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        switch (state) {
          case 0:
            return const HomePage();
          case 1:
            return const ExplorePageTemplate();
          case 2:
            return const ProfilePageTemplate();
          default:
            return const HomePage();
        }
      },
    );
  }
}

// ! TASLAK SAYFALARI SİL ! ! !
class ProfilePageTemplate extends StatelessWidget {
  const ProfilePageTemplate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(context.translate.profile));
  }
}

class ExplorePageTemplate extends StatelessWidget {
  const ExplorePageTemplate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(context.translate.explore));
  }
}
