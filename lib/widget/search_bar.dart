import 'package:flutter/material.dart';

enum SearchBarType { home, normal, homeLight }

const String SEARCH_BAR_DEFAULT_TEXT = "网红打卡地 景点 酒店 美食";

class SearchBar extends StatefulWidget {
  final bool enabled;
  final bool hideLeft;
  final SearchBarType searchBarType;
  final String hint;
  final String defaultText;
  final void Function()? leftButtonClick;
  final void Function()? rightButtonClick;
  final void Function()? speakClick;
  final void Function()? inputBoxClick;
  final ValueChanged<String>? onChanged;

  const SearchBar(
      {Key? key,
      this.enabled = true,
      required this.hideLeft,
      this.searchBarType = SearchBarType.normal,
      required this.hint,
      required this.defaultText,
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    setState(() {
      _controller.text = widget.defaultText;
      if (widget.searchBarType == SearchBarType.normal) {
        showClear = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch()
        : _genHomeSearch();
  }

  _genNormalSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
              child: widget.hideLeft
                  ? null
                  : Icon(Icons.arrow_back_ios, color: Colors.grey, size: 26),
            ),
            widget.leftButtonClick,
          ),
          Expanded(
            child: _inputBox(),
          ),
          _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                '搜索',
                style: TextStyle(color: Colors.blue, fontSize: 17),
              ),
            ),
            widget.rightButtonClick,
          ),
        ],
      ),
    );
  }

  _genHomeSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(6, 5, 5, 5),
              child: Row(
                children: <Widget>[
                  Text(
                    '上海',
                    style: TextStyle(fontSize: 14, color: _homeFontColor()),
                  ),
                  Icon(
                    Icons.expand_more,
                    color: _homeFontColor(),
                    size: 22,
                  )
                ],
              ),
            ),
            widget.leftButtonClick,
          ),
          Expanded(
            child: _inputBox(),
          ),
          _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Icon(
                Icons.comment,
                color: _homeFontColor(),
                size: 26,
              ),
            ),
            widget.rightButtonClick,
          ),
        ],
      ),
    );
  }

  _wrapTap(Widget widget, void Function()? callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) {
          callback();
        }
      },
      child: widget,
    );
  }

  _inputBox() {
    Color inputBoxColor = Colors.white;
    if (widget.searchBarType != SearchBarType.home) {
      inputBoxColor = Color(0xffEDEDED);
    }
    return Container(
      height: 40,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: inputBoxColor,
        borderRadius: BorderRadius.circular(
            widget.searchBarType == SearchBarType.normal ? 5 : 15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(0xffA9A9A9)
                : Colors.blue,
          ),
          Expanded(
            child: widget.searchBarType == SearchBarType.normal
                ? TextField(
                    controller: _controller,
                    onChanged: _onChanged,
                    autofocus: true,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        textBaseline: TextBaseline.alphabetic),
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      border: InputBorder.none,
                      hintText: widget.hint,
                    ),
                  )
                : _wrapTap(
                    Container(
                      child: Text(
                        widget.defaultText,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                    widget.inputBoxClick,
                  ),
          ),
          !showClear
              ? _wrapTap(
                  Icon(
                    Icons.mic,
                    size: 22,
                    color: widget.searchBarType == SearchBarType.normal
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  widget.speakClick)
              : _wrapTap(
                  Icon(
                    Icons.clear,
                    size: 22,
                    color: Colors.grey,
                  ), () {
                  setState(() {
                    _controller.clear();
                    showClear = false;
                    _onChanged("");
                  });
                }),
        ],
      ),
    );
  }

  void _onChanged(String value) {
    setState(() {
      showClear = value.length > 0;
    });
    if (widget.onChanged != null) widget.onChanged!(value);
  }

  _homeFontColor() {
    return widget.searchBarType == SearchBarType.homeLight
        ? Colors.black54
        : Colors.white;
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
