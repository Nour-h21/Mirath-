import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirath/app/routes/router.dart';
import 'theme/themebloc/theme_bloc.dart';
import 'theme/themebloc/theme_event.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ThemeBloc()..add(InitThemeEvent(),),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, state) {
          return MaterialApp.router(theme: state, routerConfig: router, );
        },
      ),
    );
  }
}
