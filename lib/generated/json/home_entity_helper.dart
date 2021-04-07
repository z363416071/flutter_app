import 'package:flutter_app/model/home_entity.dart';
import 'package:flutter_app/model/common_entity.dart';
import 'package:flutter_app/model/config_entity.dart';
import 'package:flutter_app/model/grid_nav_entity.dart';
import 'package:flutter_app/model/sales_box_entity.dart';

homeEntityFromJson(HomeEntity data, Map<String, dynamic> json) {
	if (json['config'] != null) {
		data.config = ConfigEntity().fromJson(json['config']);
	}
	if (json['bannerList'] != null) {
		data.bannerList = (json['bannerList'] as List).map((v) => CommonEntity().fromJson(v)).toList();
	}
	if (json['localNavList'] != null) {
		data.localNavList = (json['localNavList'] as List).map((v) => CommonEntity().fromJson(v)).toList();
	}
	if (json['gridNav'] != null) {
		data.gridNav = GridNavEntity().fromJson(json['gridNav']);
	}
	if (json['subNavList'] != null) {
		data.subNavList = (json['subNavList'] as List).map((v) => CommonEntity().fromJson(v)).toList();
	}
	if (json['salesBox'] != null) {
		data.salesBox = SalesBoxEntity().fromJson(json['salesBox']);
	}
	return data;
}

Map<String, dynamic> homeEntityToJson(HomeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['config'] = entity.config?.toJson();
	data['bannerList'] =  entity.bannerList?.map((v) => v.toJson()).toList();
	data['localNavList'] =  entity.localNavList?.map((v) => v.toJson()).toList();
	data['gridNav'] = entity.gridNav?.toJson();
	data['subNavList'] =  entity.subNavList?.map((v) => v.toJson()).toList();
	data['salesBox'] = entity.salesBox?.toJson();
	return data;
}
