import 'package:flutter/material.dart';
import 'package:sma/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/app/main.dart';

void logout(BuildContext context) async {
  context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
  navigatorKey.currentState!.pushNamedAndRemoveUntil('/splash', (route) => false);
}