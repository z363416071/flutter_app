import 'package:flutter_app/model/search_entity.dart';

searchEntityFromJson(SearchEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => SearchData().fromJson(v)).toList();
	}
	if (json['resultPageUrl'] != null) {
		data.resultPageUrl = json['resultPageUrl'].toString();
	}
	if (json['keyWord'] != null) {
		data.keyWord = json['keyWord'].toString();
	}
	return data;
}

Map<String, dynamic> searchEntityToJson(SearchEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	data['resultPageUrl'] = entity.resultPageUrl;
	data['keyWord'] = entity.keyWord;
	return data;
}

searchDataFromJson(SearchData data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	if (json['word'] != null) {
		data.word = json['word'].toString();
	}
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	if (json['districtname'] != null) {
		data.districtname = json['districtname'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['price'] != null) {
		data.price = json['price'].toString();
	}
	if (json['zonename'] != null) {
		data.zonename = json['zonename'].toString();
	}
	if (json['star'] != null) {
		data.star = json['star'].toString();
	}
	return data;
}

Map<String, dynamic> searchDataToJson(SearchData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['word'] = entity.word;
	data['type'] = entity.type;
	data['districtname'] = entity.districtname;
	data['url'] = entity.url;
	data['price'] = entity.price;
	data['zonename'] = entity.zonename;
	data['star'] = entity.star;
	return data;
}
