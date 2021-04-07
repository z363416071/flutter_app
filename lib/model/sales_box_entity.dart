import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/model/common_entity.dart';

class SalesBoxEntity with JsonConvert<SalesBoxEntity> {
	String? icon;
	String? moreUrl;
	CommonEntity? bigCard1;
	CommonEntity? bigCard2;
	CommonEntity? smallCard1;
	CommonEntity? smallCard2;
	CommonEntity? smallCard3;
	CommonEntity? smallCard4;
}

