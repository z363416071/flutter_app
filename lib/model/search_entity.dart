import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class SearchEntity with JsonConvert<SearchEntity> {
	List<SearchData>? data;
	String? resultPageUrl;
	String? keyWord;
}

class SearchData with JsonConvert<SearchData> {
	String? code;
	String? word;
	String? type;
	String? districtname;
	String? url;
	String? price;
	String? zonename;
	String? star;
}
