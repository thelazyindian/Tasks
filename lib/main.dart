import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/application/theme/theme_cubit.dart';
import 'package:tasks/pages/home/home_page.dart';
import 'package:tasks/pages/new_list/new_list_page.dart';
import 'package:tasks/pages/splash/splash_page.dart';
import 'package:tasks/utils/theme.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCubit = ThemeCubit();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
        BlocProvider.value(value: themeCubit),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        bloc: themeCubit,
        builder: (_, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: state.map(
              light: (_) => systemUiOverlayStyleLight,
              dark: (_) => systemUiOverlayStyleDark,
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Tasks',
              theme: state.map(
                light: (_) => lightTheme,
                dark: (_) => darkTheme,
              ),
              home: SplashPage(),
              routes: {
                '/home': (_) => HomePage(),
                '/newList': (_) => NewListPage(),
              },
            ),
          );
        },
      ),
    );
  }
}
