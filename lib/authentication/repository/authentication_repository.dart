import 'dart:async';
import 'package:get_storage/get_storage.dart';
import 'package:sma/app/configs.dart';
import 'package:sma/app/constants.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    var _prefs = GetStorage();
    var token = await _prefs.read(Constants.accessTokenPrefKey);
    if(token == null){
      yield AuthenticationStatus.unauthenticated;
    }else{
      yield AuthenticationStatus.authenticated;
    }
    yield* _controller.stream;
  }

  Future<void> logIn() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
          () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  Future<void> logOut() async{
    var _prefs = GetStorage();
    await _prefs.remove(Constants.accessTokenPrefKey);
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}