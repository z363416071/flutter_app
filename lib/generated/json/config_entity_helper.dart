import 'package:flutter_app/model/config_entity.dart';

configEntityFromJson(ConfigEntity data, Map<String, dynamic> json) {
	if (json['searchUrl'] != null) {
		data.searchUrl = json['searchUrl'].toString();
	}
	return data;
}

Map<String, dynamic> configEntityToJson(ConfigEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['searchUrl'] = entity.searchUrl;
	return data;
}
