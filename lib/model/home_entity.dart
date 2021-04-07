import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/model/common_entity.dart';
import 'package:flutter_app/model/config_entity.dart';
import 'package:flutter_app/model/grid_nav_entity.dart';
import 'package:flutter_app/model/sales_box_entity.dart';

class HomeEntity with JsonConvert<HomeEntity> {
	ConfigEntity? config;
	List<CommonEntity>? bannerList;
	List<CommonEntity>? localNavList;
	GridNavEntity? gridNav;
	List<CommonEntity>? subNavList;
	SalesBoxEntity? salesBox;
}
