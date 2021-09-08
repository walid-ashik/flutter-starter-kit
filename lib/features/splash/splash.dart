import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/app/local/app_localizations.dart';
import 'package:sma/app/local/local_cubit.dart';
import 'package:sma/app/main.dart';
import 'package:sma/authentication/bloc/authentication_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (_, state) {
          _decideWhereToNavigate();
        },
        builder: (_, state) {
          return _buildViews(context);
        },
      ),
    );
  }

  Column _buildViews(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        buildLogo(context),
        const Spacer(),
        Text(AppLocalizations.of(context)!.translate('copyright'),
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white)),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Center buildLogo(BuildContext context) {
    return Center(
          child: InkWell(
              onTap: () {
                if (AppLocalizations.of(context)!.isEnLocale) {
                  BlocProvider.of<LocaleCubit>(context).toBangla();
                } else {
                  BlocProvider.of<LocaleCubit>(context).toEnglish();
                }
              },
              child: FlutterLogo(
                size: 100,
              )));
  }

  void _decideWhereToNavigate() {
    Future.delayed(const Duration(seconds: 2), () async {
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil('/home', (route) => false);
    });
  }
}
