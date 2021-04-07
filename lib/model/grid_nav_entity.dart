import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/model/common_entity.dart';

class GridNavEntity with JsonConvert<GridNavEntity> {
	GridNavItem? hotel;
	GridNavItem? flight;
	GridNavItem? travel;
}

class GridNavItem with JsonConvert<GridNavItem> {
	String? startColor;
	String? endColor;
	CommonEntity? mainItem;
	CommonEntity? item1;
	CommonEntity? item2;
	CommonEntity? item3;
	CommonEntity? item4;
}

