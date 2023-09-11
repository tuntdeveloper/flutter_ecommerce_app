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
  final List<Widget> _buildBuyerScreens = const [
    DashboardPage(),
    CartHomePage(),
    OrderScreen(),
    PersonalPage(),
  ];

  final List<Widget> _buildSellerScreens = const [
    DashboardPage(),
    ManageProductScreen(),
    OrderScreen(),
    PersonalPage(),
  ];

  final prefRepo = Get.find<PrefRepo>();
  final tabIndex = ValueNotifier(0);
  late final TabController tabController;
  bool shouldShowBuyer = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        if (!tabController.indexIsChanging) {
          tabIndex.value = tabController.index;
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      shouldShowBuyer =
          Get.find<PrefRepo>().getCurrentUser().buyerModel != null;
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
              children: shouldShowBuyer
                  ? _buildBuyerScreens
                      .map((e) => KeepAlivePage(child: e))
                      .toList()
                  : _buildSellerScreens
                      .map((e) => KeepAlivePage(child: e))
                      .toList(),
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
