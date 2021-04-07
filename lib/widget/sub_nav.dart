import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/web_view_page.dart';
import '../model/common_entity.dart';

class SubNav extends StatelessWidget {
  final List<CommonEntity>? subNavList;

  const SubNav({Key? key, this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(padding: EdgeInsets.all(5), child: _getItem(context)),
    );
  }

  _getItem(BuildContext context) {
    if (subNavList == null) return null;
    List<Widget>? items = subNavList!.map((obj) {
      return Expanded(
        child: GestureDetector(
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
              Image.network(obj.icon ?? "", height: 18, width: 18),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(obj.title ?? "位置"),
              ),
            ],
          ),
        ),
      );
    }).toList();
    //计算出第一行的数量
    int separate = (subNavList!.length / 2 + 0.5).toInt();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.sublist(0, separate),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.sublist(separate, items.length),
          ),
        ),
      ],
    );
  }
}
