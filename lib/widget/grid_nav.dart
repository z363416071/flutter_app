import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/common_entity.dart';
import 'package:flutter_app/widget/web_view_page.dart';

import '../model/grid_nav_entity.dart';

class GridNav extends StatelessWidget {
  final GridNavEntity? gridNavEntity;

  const GridNav({Key? key, this.gridNavEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: _gridNavItems(context),
      ),
    );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavEntity?.hotel != null) {
      items.add(_gridNavItem(context, gridNavEntity!.hotel!, true));
    }
    if (gridNavEntity?.flight != null) {
      items.add(_gridNavItem(context, gridNavEntity!.flight!, false));
    }
    if (gridNavEntity?.travel != null) {
      items.add(_gridNavItem(context, gridNavEntity!.travel!, false));
    }
    return items;
  }

  _gridNavItem(BuildContext context, GridNavItem gridNavItem, bool first) {
    List<Widget> items = [];
    items.add(Expanded(child: _mainItem(context, gridNavItem.mainItem!)));
    items.add(Expanded(child: _doubleItem(context, gridNavItem.item1!, gridNavItem.item2!)));
    items.add(Expanded(child: _doubleItem(context, gridNavItem.item3!, gridNavItem.item4!)));
    return Container(
      height: 88,
      margin: first ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(
              int.parse('0xff' + gridNavItem.startColor!),
            ),
            Color(
              int.parse('0xff' + gridNavItem.endColor!),
            )
          ],
        ),
      ),
      child: Row(
        children: items,
      ),
    );
  }

  _mainItem(BuildContext context, CommonEntity commonEntity) {
    return _wrapGesture(
        context,
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Image.network(
              commonEntity.icon!,
              fit: BoxFit.contain,
              height: 88,
              width: 121,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Container(
              margin: EdgeInsets.only(top: 11),
              child: Text(
                commonEntity.title!,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
        commonEntity);
  }

  _doubleItem(BuildContext context, CommonEntity topItem, CommonEntity bottomItem) {
    return Column(
      children: [
        Expanded(
          child: _item(context, topItem, true),
        ),
        Expanded(
          child: _item(context, bottomItem, false),
        ),
      ],
    );
  }

  _item(BuildContext context, CommonEntity item, bool first) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
          decoration: BoxDecoration(
            border: Border(left: borderSide, bottom: first ? borderSide : BorderSide.none),
          ),
          child: _wrapGesture(
              context,
              Center(
                child: Text(
                  item.title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              item)),
    );
  }

  _wrapGesture(BuildContext context, Widget widget, CommonEntity commonEntity) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewPage(
              commonEntity.url!,
              statusBarColor: commonEntity.statusBarColor,
              hideAppBar: commonEntity.hideAppBar,
              title: commonEntity.title,
            ),
          ),
        );
      },
      child: widget,
    );
  }
}
