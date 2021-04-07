import 'package:flutter_app/model/grid_nav_entity.dart';
import 'package:flutter_app/model/common_entity.dart';

gridNavEntityFromJson(GridNavEntity data, Map<String, dynamic> json) {
	if (json['hotel'] != null) {
		data.hotel = GridNavItem().fromJson(json['hotel']);
	}
	if (json['flight'] != null) {
		data.flight = GridNavItem().fromJson(json['flight']);
	}
	if (json['travel'] != null) {
		data.travel = GridNavItem().fromJson(json['travel']);
	}
	return data;
}

Map<String, dynamic> gridNavEntityToJson(GridNavEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['hotel'] = entity.hotel?.toJson();
	data['flight'] = entity.flight?.toJson();
	data['travel'] = entity.travel?.toJson();
	return data;
}

gridNavItemFromJson(GridNavItem data, Map<String, dynamic> json) {
	if (json['startColor'] != null) {
		data.startColor = json['startColor'].toString();
	}
	if (json['endColor'] != null) {
		data.endColor = json['endColor'].toString();
	}
	if (json['mainItem'] != null) {
		data.mainItem = CommonEntity().fromJson(json['mainItem']);
	}
	if (json['item1'] != null) {
		data.item1 = CommonEntity().fromJson(json['item1']);
	}
	if (json['item2'] != null) {
		data.item2 = CommonEntity().fromJson(json['item2']);
	}
	if (json['item3'] != null) {
		data.item3 = CommonEntity().fromJson(json['item3']);
	}
	if (json['item4'] != null) {
		data.item4 = CommonEntity().fromJson(json['item4']);
	}
	return data;
}

Map<String, dynamic> gridNavItemToJson(GridNavItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['startColor'] = entity.startColor;
	data['endColor'] = entity.endColor;
	data['mainItem'] = entity.mainItem?.toJson();
	data['item1'] = entity.item1?.toJson();
	data['item2'] = entity.item2?.toJson();
	data['item3'] = entity.item3?.toJson();
	data['item4'] = entity.item4?.toJson();
	return data;
}
