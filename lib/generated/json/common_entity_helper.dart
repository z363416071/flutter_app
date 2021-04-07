import 'package:flutter_app/model/common_entity.dart';

commonEntityFromJson(CommonEntity data, Map<String, dynamic> json) {
  if (json['icon'] != null) {
    data.icon = json['icon'].toString();
  }
  if (json['title'] != null) {
    data.title = json['title'].toString();
  }
  if (json['url'] != null) {
    data.url = json['url'].toString();
  }
  if (json['statusBarColor'] != null) {
    data.statusBarColor = json['statusBarColor'].toString();
  }
  if (json['hideAppBar'] != null) {
    data.hideAppBar = json['hideAppBar'];
  }
  return data;
}

Map<String, dynamic> commonEntityToJson(CommonEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['icon'] = entity.icon;
  data['title'] = entity.title;
  data['url'] = entity.url;
  data['statusBarColor'] = entity.statusBarColor;
  data['hideAppBar'] = entity.hideAppBar;
  return data;
}
