import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(String initialLang) : super(Locale('$initialLang'));

  void toBangla() => emit(Locale('bn'));

  void toEnglish() => emit(Locale('en'));

}

