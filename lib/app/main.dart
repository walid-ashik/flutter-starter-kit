import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/app/local/app_localizations.dart';
import 'package:sma/app/local/app_localizations_setup.dart';
import 'package:sma/app/local/local_cubit.dart';
import 'package:sma/authentication/bloc/authentication_bloc.dart';
import 'package:sma/authentication/repository/authentication_repository.dart';
import 'app_bloc_observer.dart';
import 'package:get_storage/get_storage.dart';

import 'app_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  var _authenticationRepository = AuthenticationRepository();
  //for setting status bar color system wide.
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icon color
  ));
  await GetStorage.init();
  Bloc.observer = AppBlocObserver();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  runZonedGuarded(
    () {
      runApp(MyApp(
        authenticationRepository: _authenticationRepository,
      ));
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.authenticationRepository})
      : super(key: key);
  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => LocaleCubit('en')
          ),
          BlocProvider(
            create: (_) => AuthenticationBloc(
                authenticationRepository: authenticationRepository),
          ),
        ],
        child: BlocBuilder<LocaleCubit, Locale> (
          builder: (context, state) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Scaled',
              onGenerateRoute: AppRouter().onGenerateRoute,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
              localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
              locale: state,
              theme: ThemeData(
                fontFamily: 'NotoSans',
                primaryColor: const Color(0xFF0DC8B6),
                accentColor: const Color(0xFFFFA75A),
                backgroundColor: const Color(0xFFE5E5E5),
                scaffoldBackgroundColor: const Color(0xFFE5E5E5),
                splashColor: const Color(0xFF91919F),
                hintColor: const Color(0xFFA9A7B8),
                errorColor: const Color(0xFFFF0000),
                focusColor: const Color(0xFF0066FF),
                appBarTheme: const AppBarTheme(
                    color: Colors.white,
                    brightness: Brightness.light,
                    titleTextStyle:
                    const TextStyle(color: Color(0xFF1E1E1E), fontSize: 16, fontWeight: FontWeight.w600)),
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  error: const Color(0xFFFF0000),
                  primary: const Color(0xFF0DC8B6),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
