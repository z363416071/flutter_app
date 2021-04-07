import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart' ;

import '../model/home_entity.dart';
const HOME_URL = 'https://www.devio.org/io/flutter_app/json/home_page.json';
class HomeDao{
  static Future<HomeEntity> fetch() async{
    final res = await Dio().get(HOME_URL);
    if(res.statusCode ==200){
      return HomeEntity().fromJson(res.data);
    }else{
      return HomeEntity();
    }
  }
}