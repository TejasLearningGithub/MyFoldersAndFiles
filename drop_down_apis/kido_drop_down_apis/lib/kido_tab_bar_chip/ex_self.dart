import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/common/app_theme.dart';
import 'package:kido_drop_down_apis/kido/chip_with_tab_bar/experiment/my_ex_second.dart';
import 'package:kido_drop_down_apis/theme/theme_constant.dart';

class KidoTabBarWithChip extends StatefulWidget {
  const KidoTabBarWithChip({super.key, this.multiParent = false});

  final bool multiParent;

  @override
  State<KidoTabBarWithChip> createState() => _KidoTabBarWithChipState();
}

class _KidoTabBarWithChipState extends State<KidoTabBarWithChip>
    with SingleTickerProviderStateMixin {
  TextEditingController msgController = TextEditingController();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    msgController.dispose();
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          title: Text(
            'Leads',
            style: montserratBold.copyWith(
              color: AppColors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.sort,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_alt,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  //vertical: 16 / 6,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              Center(child: tabbar()),
              tabBarView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabbar() {
    return Container(
      width: 450,
      height: 50,
      color: AppColors.darkBlue,
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        labelPadding: const EdgeInsets.symmetric(horizontal: 76),
        indicatorColor: Colors.white,
        labelColor: AppColors.white,
        labelStyle: montserratBold.copyWith(
          //decoration: TextDecoration.underline,
          fontSize: 15,
        ),
        unselectedLabelStyle: montserratNormal.copyWith(fontSize: 15),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        tabs: const [
          Tab(text: "Leads"),
          Tab(text: "Walk - Ins"),
        ],
      ),
    );
  }

  Widget tabBarView() {
    return SizedBox(
      height: 300,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [MyExampleSecond(), MyExampleSecond()],
      ),
    );
  }
}
