import 'package:news_times/features/skeleton/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:news_times/core/extensions/l10n_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state,
          onTap: (value) {
            // * Change page
            context.read<PageCubit>().changePageIndex(value);
          },
          items: [
            bottomNavigationBarItem(
                icon: const Icon(Icons.home),
                selectedPageName: context.translate.home),
            bottomNavigationBarItem(
                icon: const Icon(Icons.search),
                selectedPageName: context.translate.explore),
            bottomNavigationBarItem(
                icon: const Icon(Icons.person),
                selectedPageName: context.translate.profile),
          ],
        );
      },
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(
      {required icon, required selectedPageName}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: selectedPageName,
    );
  }
}
