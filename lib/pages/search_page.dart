import 'package:flutter/material.dart';
import 'package:flutter_app/dao/search_dao.dart';
import 'package:flutter_app/model/search_entity.dart';
import 'package:flutter_app/widget/search_bar.dart';
import 'package:flutter_app/widget/web_view_page.dart';

const String URL =
    "https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=";

class SearchPage extends StatefulWidget {
  final bool? hideLeft;
  final String? searchUrl;
  final String? keyword;
  final String? hint;

  const SearchPage(
      {Key? key, this.hideLeft, this.searchUrl = URL, this.keyword, this.hint})
      : super(key: key);

  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  SearchEntity? _searchEntity;
  late String _keyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(),
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                itemCount: _searchEntity?.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return _item(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTextChanged(String value) {
    _keyword = value;
    if (_keyword.length == 0) {
      setState(() {
        _searchEntity = null;
      });
      return;
    }
    String url = widget.searchUrl! + value;
    SearchDao.fetch(url, value).then((obj) {
      if (mounted && obj.keyWord == value)
        setState(() {
          _searchEntity = obj;
        });
    });
  }

  _appBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0x66000001), Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(color: Colors.white),
            child: SearchBar(
              hideLeft: widget.hideLeft ?? true,
              hint: widget.hint ?? "",
              defaultText: widget.keyword ?? "",
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextChanged,
            ),
          ),
        )
      ],
    );
  }

  Widget _item(int index) {
    SearchData? searchData = _searchEntity?.data?[index];
    if (searchData == null) {
      return Text('暂无数据');
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewPage(
              searchData.url!,
              title: "详情",
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 0.3),
          ),
        ),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 300,
                  child: Text(
                    "${searchData.word}${searchData.districtname??""}${searchData.zonename??""}",
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    "${searchData.price??""}${searchData.type??""}",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
