import 'package:flutter/material.dart';
import 'package:prg_fantasy/utils/app_assets.dart';

class TabsScreen extends StatefulWidget implements PreferredSizeWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //drawer: Drawer(),
        appBar: AppBar(
          // leading: Icon(
          //   Icons.menu,
          //   size: 30,
          // ),
          // leading: IconButton(
          //     icon: Icon(Icons.menu),
          //     onPressed: () => Scaffold.of(context).openDrawer()),
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 80,
              ),
              Image.asset(
                AppLogos.fantasyLogo,
                width: 100,
                height: 100,
              ),
              SizedBox(
                width: 65,
              ),
              Row(
                children: [
                  Icon(Icons.notifications),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.filter),
                ],
              ),
            ],
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(45),
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.blue,
              ),
            ),
            controller: tabController,
            //isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Sceen A'),
              Tab(icon: Icon(Icons.favorite), text: 'Screen B')
            ],
          ),
        ),
        // body: const TabBarView(
        //   children: [HomeLeagueScreen(), HomeLeagueScreen()],
        // ),
      ),
    );
  }
}
