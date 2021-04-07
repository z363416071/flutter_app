
import '../generated/json/base/json_convert_content.dart';

class CommonEntity with JsonConvert<CommonEntity> {
	String? icon;
	String? title;
	String? url;
	String? statusBarColor;
	bool? hideAppBar;
}
