import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/app/local/app_localizations.dart';
import 'package:sma/app/local/local_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: InkWell(
                  onTap: () {
                    if(AppLocalizations.of(context)!.isEnLocale) {
                      BlocProvider.of<LocaleCubit>(context).toBangla();
                    } else {
                      BlocProvider.of<LocaleCubit>(context).toEnglish();
                    }
                  },
                  child: FlutterLogo(
                    size: 100,
                  ))),
          const Spacer(),
          Text(AppLocalizations.of(context)!.translate('copyright')),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
