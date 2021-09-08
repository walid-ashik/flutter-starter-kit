import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sma/features/home/model/global.dart';
import 'exceptions.dart';

class ApiService {
  static const _baseUrl = "https://coronavirus-19-api.herokuapp.com";
  static const headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };

  Future<Global> fetchGlobalData() async {
    final response =
    await http.get(Uri.parse("$_baseUrl/all"), headers: headers);

    try {
      if (response.statusCode == 200) {
        return Global.fromJson(json.decode(response.body));
      } else {
        return Future.value(null);
      }
    } on SocketException catch (e) {
      throw NoInternetException("No Internet");
    } on HttpException {
      throw NoServiceFoundException("No Service Found");
    } on FormatException {
      throw InvalidFormatException("Invalid Data Format");
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

}