import 'package:flutter/material.dart';
import 'package:flutter_app/dao/home_dao.dart';
import 'package:flutter_app/model/grid_nav_entity.dart';
import 'package:flutter_app/model/sales_box_entity.dart';
import 'package:flutter_app/pages/search_page.dart';
import 'package:flutter_app/widget/grid_nav.dart';
import 'package:flutter_app/widget/local_nav.dart';
import 'package:flutter_app/widget/sales_box.dart';
import 'package:flutter_app/widget/search_bar.dart';
import 'package:flutter_app/widget/sub_nav.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

import '../model/common_entity.dart';
import '../model/home_entity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List _imageUrls = [
    "https://upload-images.jianshu.io/upload_images/5809200-c12521fbde6c705b.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
    "https://upload-images.jianshu.io/upload_images/5809200-7fe8c323e533f656.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
    "https://upload-images.jianshu.io/upload_images/5809200-4de5440a56bff58f.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
  ];
  double _appBarAlpha = 0;
  List<CommonEntity>? _localNavList;
  List<CommonEntity>? _subList;
  GridNavEntity? _gridNavEntity;
  SalesBoxEntity? _salesBox;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Stack(
        children: [
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification &&
                    notification.depth == 0) {
                  _onScroll(notification.metrics.pixels);
                }
                return true;
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (context, index) {
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                    child: LocalNav(localNavList: _localNavList),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                    child: GridNav(gridNavEntity: _gridNavEntity),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                    child: SubNav(subNavList: _subList),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                    child: SalesBox(
                      salesBox: _salesBox,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _appBar(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    HomeEntity homeEntity = await HomeDao.fetch();
    setState(() {
      _localNavList = homeEntity.localNavList;
      _subList = homeEntity.subNavList;
      _gridNavEntity = homeEntity.gridNav;
      _salesBox = homeEntity.salesBox;
    });
  }

  _onScroll(offset) {
    double alpha = offset / 100;
    if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      _appBarAlpha = alpha;
    });
  }

  _appBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0x66000000), Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80,
            decoration: BoxDecoration(
                color: Color.fromARGB(
                    (_appBarAlpha * 225).toInt(), 225, 225, 225)),
            child: SearchBar(
              searchBarType: _appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              hideLeft: true,
              hint: '',
              inputBoxClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(
                      hint: SEARCH_BAR_DEFAULT_TEXT,
                      hideLeft: false,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          height: _appBarAlpha > 0.2 ? 0.5 : 0,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]),
        )
      ],
    );
  }
}
