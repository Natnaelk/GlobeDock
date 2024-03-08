import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/presentation/notification/notification_screen.dart';
import 'package:globedock/src/presentation/page/dashboard/dashboard_screen.dart';
import 'package:globedock/src/presentation/page/home/home_screen.dart';
import 'package:globedock/src/presentation/premium/premium_screen.dart';
import 'package:globedock/src/presentation/todo/todo_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({
    Key? key,
    this.selectedIndex,
  }) : super(key: key);
  final String? selectedIndex;

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.selectedIndex != null) {
      print("it gets here");
      _selectedIndex = int.parse(widget.selectedIndex!);
    }
  }

  final List<Map<String, dynamic>> _navitems = [
    {
      "icon": "assets/icons/home_icon.svg",
      "selected_icon": "assets/icons/home_icon_selected.svg",
      "title": "Home"
    },
    {
      "icon": "assets/icons/notification_icon.svg",
      "selected_icon": "assets/icons/notification_icon_selected.svg",
      "title": "Notification"
    },
    {
      "icon": "assets/icons/crown_icon.svg",
      "selected_icon": "assets/icons/crown_icon_selected.svg",
      "title": "One"
    },
    {
      "icon": "assets/icons/todo_icon.svg",
      "selected_icon": "assets/icons/todo_icon_selected.svg",
      "title": "Todo"
    },
    {
      "icon": "assets/icons/dashboard_icon.svg",
      "selected_icon": "assets/icons/dashboard_icon_selected.svg",
      "title": "Dashboard"
    },
  ];

  final List<Widget> _screens = [
    HomeScreen(),
    NotificationScreen(),
    PremiumScreen(),
    TodoScreen(),
    DashboardScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: _selectedIndex == 2
            ? Theme.of(context).secondaryHeaderColor
            : Theme.of(context).cardColor,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Theme.of(context).disabledColor,
        height: 55.h,
        border: Border.all(
            color: _selectedIndex == 2
                ? Colors.transparent
                : Theme.of(context).dividerColor),
        items: List.generate(
          _navitems.length,
          (index) => BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: SvgPicture.asset(
                index == _selectedIndex
                    ? _navitems[index]["selected_icon"]
                    : _navitems[index]["icon"],
                height: 25,
                width: 25,
                colorFilter: ColorFilter.mode(
                    index == _selectedIndex
                        ? Colors.transparent
                        : Theme.of(context).disabledColor,
                    BlendMode.srcATop),
              ),
            ),
            label: _navitems[index]["title"],
          ),
        ),
      ),
    );
  }
}
