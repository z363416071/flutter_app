import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/sales_box_entity.dart';
import 'package:flutter_app/widget/web_view_page.dart';
import '../model/common_entity.dart';

class SalesBox extends StatelessWidget {
  final SalesBoxEntity? salesBox;

  const SalesBox({Key? key, this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: _getItem(context),
    );
  }

  _getItem(BuildContext context) {
    if (salesBox == null) return null;
    List<Widget> items = [];
    items.add(_doubleItem(context, salesBox!.bigCard1!, salesBox!.bigCard2!, true, false));
    items.add(_doubleItem(context, salesBox!.smallCard1!, salesBox!.smallCard2!, false, false));
    items.add(_doubleItem(context, salesBox!.smallCard3!, salesBox!.smallCard4!, false, true));
    return Column(
      children: [
        Container(
          height: 44,
          margin: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(salesBox!.icon!, height: 15, fit: BoxFit.fill),
              Container(
                margin: EdgeInsets.only(right: 7),
                padding: EdgeInsets.fromLTRB(10, 1, 8, 1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(colors: [
                      Color(0xffff4e63),
                      Color(0xffff6cc9),
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebViewPage(
                                salesBox!.moreUrl!,
                                title: "更多活动",
                              )),
                    );
                  },
                  child: Text("获取更多福利>", style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color(0xfff2f2f2)))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(0, 1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(1, 2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(2, 3),
        ),
      ],
    );
  }

  _doubleItem(BuildContext context, CommonEntity leftCard, CommonEntity rightCard, bool big, bool last) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _item(context, leftCard,big, true, last),
        _item(context, rightCard,big, false, last),
      ],
    );
  }

  _item(BuildContext context, CommonEntity obj, bool big, bool left, bool last) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Color(0xfff2f2f2));
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
          Container(
            child: Image.network(
                obj.icon ?? "",
                fit: BoxFit.fill, height: big ? 129 : 80,
                width: ScreenUtil.getScreenW(context) / 2 - 10
            ),
            decoration: BoxDecoration(
              border: Border(
                right: left ? borderSide : BorderSide.none,
                bottom: last ? BorderSide.none : borderSide,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
