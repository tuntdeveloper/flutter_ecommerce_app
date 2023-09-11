import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/data/repo/pref_repo.dart';
import 'package:flutter_ecommerce_app/presentation/after_auth_buyer/order/order_screen.dart';
import 'package:flutter_ecommerce_app/presentation/after_auth_seller/manage_product/manage_product_screen.dart';
import 'package:flutter_ecommerce_app/presentation/after_auth_seller/merchant_detail/merchant_detail_screen.dart';
import 'package:get/get.dart';

import '../../after_auth_buyer/cart/cart_screen.dart';
import 'dashboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<HomePage> with TickerProviderStateMixin {
  final List<Widget> _buildBuyerScreens = [
    DashboardPage(),
    CartHomePage(),
    OrderScreen(),
    PersonalPage(),
  ];

  final List<Widget> _buildSellerScreens = [
    DashboardPage(),
    ManageProductScreen(),
    OrderScreen(),
    PersonalPage(),
  ];

  // final List<PersistentBottomNavBarItem> _navBuyerBarsItems = [
  //   PersistentBottomNavBarItem(
  //     icon: Icon(CupertinoIcons.home),
  //     title: ("Home"),
  //     activeColorPrimary: kPrimaryColor,
  //     inactiveColorPrimary: CupertinoColors.systemGrey,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: Icon(CupertinoIcons.shopping_cart),
  //     title: ("Card"),
  //     activeColorPrimary: kPrimaryColor,
  //     inactiveColorPrimary: CupertinoColors.systemGrey,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: Icon(CupertinoIcons.archivebox),
  //     title: ("Order"),
  //     activeColorPrimary: kPrimaryColor,
  //     inactiveColorPrimary: CupertinoColors.systemGrey,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: Icon(CupertinoIcons.person),
  //     title: ("Personal"),
  //     activeColorPrimary: kPrimaryColor,
  //     inactiveColorPrimary: CupertinoColors.systemGrey,
  //   ),
  // ];
  //
  // final List<PersistentBottomNavBarItem> _navSellerBarsItems = [
  //   PersistentBottomNavBarItem(
  //     icon: Icon(CupertinoIcons.home),
  //     title: ("Home"),
  //     activeColorPrimary: kPrimaryColor,
  //     inactiveColorPrimary: CupertinoColors.systemGrey,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: Icon(Icons.production_quantity_limits),
  //     title: ("Product Manager"),
  //     activeColorPrimary: kPrimaryColor,
  //     inactiveColorPrimary: CupertinoColors.systemGrey,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: Icon(Icons.add_card),
  //     title: ("Order Manager"),
  //     activeColorPrimary: kPrimaryColor,
  //     inactiveColorPrimary: CupertinoColors.systemGrey,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: Icon(CupertinoIcons.person),
  //     title: ("Personal"),
  //     activeColorPrimary: kPrimaryColor,
  //     inactiveColorPrimary: CupertinoColors.systemGrey,
  //   ),
  // ];
  //
  // final PersistentTabController _controller = PersistentTabController();

  final prefRepo = Get.find<PrefRepo>();
  final tabIndex = ValueNotifier(0);
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        if (!tabController.indexIsChanging) {
          tabIndex.value = tabController.index;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        top: true,
        bottom: false,
        child: DefaultTabController(
          animationDuration: Duration.zero,
          length: 4,
          child: Scaffold(
            body: TabBarView(
              controller: tabController,
              children: const [
                KeepAlivePage(child: DashboardPage()),
                KeepAlivePage(child: CartHomePage()),
                KeepAlivePage(child: OrderScreen()),
                KeepAlivePage(child: PersonalPage()),
              ],
            ),
            bottomNavigationBar: Container(
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: ValueListenableBuilder(
                  valueListenable: tabIndex,
                  builder: (context, currentIndex, __) {
                    return TabBar(
                      controller: tabController,
                      dividerColor: Theme.of(context).colorScheme.surface,
                      splashBorderRadius: BorderRadius.circular(16),
                      tabs: const [
                        Tab(
                          icon: Icon(CupertinoIcons.home),
                        ),
                        Tab(
                          icon: Icon(CupertinoIcons.shopping_cart),
                        ),
                        Tab(
                          icon: Icon(CupertinoIcons.archivebox),
                        ),
                        Tab(
                          icon: Icon(CupertinoIcons.person),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<KeepAlivePage> createState() => KeepAlivePageState();
}

class KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
