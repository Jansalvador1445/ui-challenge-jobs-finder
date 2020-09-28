import 'package:flutter/material.dart';
import 'package:ui_challenge_job_ui/data/navigation-data.dart';
import 'package:ui_challenge_job_ui/model/nagivation-item.dart';
import 'package:ui_challenge_job_ui/pages/job-pages.dart';

class ManagerPage extends StatefulWidget {
  @override
  _ManagerStatePage createState() => _ManagerStatePage();
}

class _ManagerStatePage extends State<ManagerPage> {
  List<NavigationItem> navigationItems = navigationItemList();
  NavigationItem selectedItem;
  Widget currentWidgetView;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
      currentWidgetView = JobsPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff173f5f), //Colors.grey[200],
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: currentWidgetView,
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Color(0xfff2d570),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: navigationItemsBuild(),
        ),
      ),
    );
  }

  List<Widget> navigationItemsBuild() {
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(navItems(navigationItem));
    }
    return list;
  }

  Widget navItems(NavigationItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (item.title) {
            case "Jobs":
              currentWidgetView = JobsPage();
              break;
            default:
              break;
          }
          selectedItem = item;
        });
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: selectedItem == item ? 1.0 : 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              item.title.toUpperCase(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff203f5c)),
            ),
          ],
        ),
      ),
    );
  }
}
