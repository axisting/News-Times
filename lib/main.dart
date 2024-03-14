import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_times/features/most_popular_news/presentation/blocs/bloc/most_popular_bloc.dart';
import 'package:news_times/features/most_popular_news/presentation/blocs/cubit/selected_news_cubit.dart';
//import 'package:news_times/features/most_popular_news/presentation/blocs/cubit/most_popular_news_cubit_cubit.dart';
import 'package:news_times/features/skeleton/skeleton.dart';
import 'package:news_times/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(List<String> args) async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectedNewsCubit>(
          create: (context) => SelectedNewsCubit(),
        ),
        BlocProvider<MostPopularNewsBloc>(
          create: (context) => MostPopularNewsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        //locale: Locale('en'),
        theme: AppTheme.lightTheme,
        home: const Skeleton(),
      ),
    );
  }
}
