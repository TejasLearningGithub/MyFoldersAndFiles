import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  PersistentTabController? controller =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Text('Screen 1'),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controller?.jumpToTab(1);
                      });
                    },
                    child: Text('Select Tab 2')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controller?.jumpToTab(2);
                      });
                    },
                    child: Text('Select Tab 3')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controller?.jumpToTab(3);
                      });
                    },
                    child: Text('Select Tab 4')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controller?.jumpToTab(4);
                      });
                    },
                    child: Text('Select Tab 5'))
              ],
            ),
          ),
        ),
        Screen2(),
        Screen3(),
        Screen4(),
        Screen5(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite_border_rounded),
          title: ("Favorite"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          inactiveIcon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.send),
          title: ("Send"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings_outlined),
          title: ("Setting"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: controller,
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style16,
    );
  }

  Screen2() {
    return Container(
      child: const Center(
        child: Text('Screen 2'),
      ),
    );
  }

  Screen3() {
    return Container(
      child: const Center(
        child: Text('Screen 3'),
      ),
    );
  }

  Screen4() {
    return Container(
      child: const Center(
        child: Text('Screen 4'),
      ),
    );
  }

  Screen5() {
    return Container(
      child: const Center(
        child: Text('Screen 5'),
      ),
    );
  }
}
