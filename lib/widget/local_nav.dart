import 'package:flutter/material.dart';
import 'package:flutter_app/widget/web_view_page.dart';
import '../model/common_entity.dart';

class LocalNav extends StatelessWidget {
  final List<CommonEntity>? localNavList;

  const LocalNav({Key? key, this.localNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(padding: EdgeInsets.all(5), child: _getItem(context)),
    );
  }

  _getItem(BuildContext context) {
    List<Widget>? items = localNavList?.map((obj) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewPage(
                obj.url!,
                statusBarColor: obj.statusBarColor,
                hideAppBar: obj.hideAppBar,
                title: obj.title,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(obj.icon ?? "", height: 32, width: 32),
            Text(obj.title ?? "位置"),
          ],
        ),
      );
    }).toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items ?? [],
    );
  }
}
