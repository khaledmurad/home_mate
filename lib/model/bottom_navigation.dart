import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'bottombaritem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  String activePage = "home";

  void setActivePage(String page) {
    setState(() {
      activePage = page;
    });
  }

  List<BottomBarItem> items = [];
  @override
  void initState() {
    items = [
      BottomBarItem(
        icon: FlutterIcons.home_fea,
        onPressed: () {
          setActivePage("home");
        },
        key: "home",
      ),
      BottomBarItem(
        icon: FlutterIcons.heart_ant,
        onPressed: () {
          setActivePage("favorites");
        },
        key: "favorites",
      ),
      BottomBarItem(
        icon: FlutterIcons.grid_fea,
        onPressed: () {
          setActivePage("menu");
        },
        key: "menu",
      ),
      BottomBarItem(
        icon: FlutterIcons.mail_fea,
        onPressed: () {
          setActivePage("messages");
        },
        key: "messages",
      ),
      BottomBarItem(
        icon: FlutterIcons.user_ant,
        onPressed: () {
          setActivePage("profile");
        },
        key: "profile",
      ),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      height: ScreenUtil().setHeight(65.0),
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items
            .map(
              (BottomBarItem item) =>
              getBottomWidgetItem(context,item, activePage == item.key),
        )
            .toList(),
      ),
    );
  }
}

Widget getBottomWidgetItem(BuildContext context,BottomBarItem item, bool isActive) {
  return Container(
    height: ScreenUtil().setHeight(62.0),
    width: ScreenUtil().setWidth(62.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
    ),
    child: AnimatedSwitcher(
      duration: Duration(milliseconds: 450),
      child: isActive
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            item.icon,
            color: Colors.white,
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            height: 5.0,
            width: 5.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          )
        ],
      )
          : Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: IconButton(
          icon: Icon(
            item.icon,
            color: Color.fromRGBO(156, 166, 201, 1),
          ),
          onPressed: item.onPressed,
        ),
      ),
    ),
  );
}
