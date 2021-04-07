import 'package:flutter_app/model/sales_box_entity.dart';
import 'package:flutter_app/model/common_entity.dart';

salesBoxEntityFromJson(SalesBoxEntity data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	if (json['moreUrl'] != null) {
		data.moreUrl = json['moreUrl'].toString();
	}
	if (json['bigCard1'] != null) {
		data.bigCard1 = CommonEntity().fromJson(json['bigCard1']);
	}
	if (json['bigCard2'] != null) {
		data.bigCard2 = CommonEntity().fromJson(json['bigCard2']);
	}
	if (json['smallCard1'] != null) {
		data.smallCard1 = CommonEntity().fromJson(json['smallCard1']);
	}
	if (json['smallCard2'] != null) {
		data.smallCard2 = CommonEntity().fromJson(json['smallCard2']);
	}
	if (json['smallCard3'] != null) {
		data.smallCard3 = CommonEntity().fromJson(json['smallCard3']);
	}
	if (json['smallCard4'] != null) {
		data.smallCard4 = CommonEntity().fromJson(json['smallCard4']);
	}
	return data;
}

Map<String, dynamic> salesBoxEntityToJson(SalesBoxEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['moreUrl'] = entity.moreUrl;
	data['bigCard1'] = entity.bigCard1?.toJson();
	data['bigCard2'] = entity.bigCard2?.toJson();
	data['smallCard1'] = entity.smallCard1?.toJson();
	data['smallCard2'] = entity.smallCard2?.toJson();
	data['smallCard3'] = entity.smallCard3?.toJson();
	data['smallCard4'] = entity.smallCard4?.toJson();
	return data;
}
