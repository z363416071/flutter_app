import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_app/model/search_entity.dart';

class SearchDao {
  static Future<SearchEntity> fetch(String url, String value) async {
    final res = await Dio().get(url);
    if (res.statusCode == 200) {
      SearchEntity searchEntity =  SearchEntity().fromJson(res.data);
      searchEntity.keyWord = value;
      return searchEntity;
    } else {
      return SearchEntity();
    }
  }
}
