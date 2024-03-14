import 'package:news_times/features/skeleton/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:news_times/features/skeleton/widgets/app_bar.dart';
import 'package:news_times/features/skeleton/widgets/bottom_navigation_bar.dart';
import 'package:news_times/features/skeleton/widgets/page_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageCubit(),
      child: const Scaffold(
        appBar: SkeletonAppBar(),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: NavigationWidget(),
      ),
    );
  }
}
