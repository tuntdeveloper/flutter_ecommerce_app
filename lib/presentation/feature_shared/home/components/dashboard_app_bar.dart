import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/data/controller/cart_controller.dart';
import 'package:flutter_ecommerce_app/data/controller/chat_controller.dart';
import 'package:flutter_ecommerce_app/data/repo/pref_repo.dart';
import 'package:flutter_ecommerce_app/design/colors.dart';
import 'package:flutter_ecommerce_app/design/extension/double_extension.dart';
import 'package:flutter_ecommerce_app/presentation/after_auth_buyer/cart/cart_screen.dart';
import 'package:flutter_ecommerce_app/presentation/feature_shared/chat/chat_screen.dart';
import 'package:get/get.dart';

import '../../../../data/controller/notification_controller.dart';
import '../../../../helper/navigator_helper.dart';
import '../../../../share/constant/constant.dart';
import '../../../../share/widget/widget_button_flat.dart';
import '../../notification/notification_page.dart';

class HomeAppBarWidget extends StatefulWidget {
  const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  final PrefRepo repo = Get.find();

  @override
  Widget build(BuildContext context) {
    return repo.isCurrentSeller()
        ? const _BuildSellerAppBar()
        : const _BuildBuyerAppBar();
  }
}

class _BuildBuyerAppBar extends StatefulWidget {
  const _BuildBuyerAppBar({Key? key}) : super(key: key);

  @override
  State<_BuildBuyerAppBar> createState() => _BuildBuyerAppBarState();
}

class _BuildBuyerAppBarState extends State<_BuildBuyerAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 16, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SearchAnchor(
              isFullScreen: true,
              suggestionsBuilder: (context, controller) {
                if (controller.text.isEmpty) {
                  if (searchHistory.isNotEmpty) {
                    return getHistoryList(controller);
                  }
                  return <Widget>[
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('No search history.',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    )
                  ];
                }
                return getSuggestions(controller);
              },
              builder: (BuildContext context, SearchController controller) {
                return Material(
                  borderRadius: BorderRadius.circular(16.0),
                  elevation: 1,
                  shadowColor: Colors.grey,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      children: [
                        Icon(CupertinoIcons.search),
                        SizedBox(width: 8),
                        Text('Search for products, shops...'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GetBuilder<ChatController>(builder: (controller) {
                  return ButtonFlat(
                    onTap: () {
                      Push.to(context, const ChatScreen());
                    },
                    color: kSecondaryColor,
                    itemsNumber: controller.chatTotal,
                    padding: 0.025.w,
                    icon: const Icon(CupertinoIcons.chat_bubble_2),
                  );
                }),
                SizedBox(width: 0.015.w),
                GetBuilder<CartController>(builder: (controller) {
                  return ButtonFlat(
                    onTap: () {
                      Push.to(context, const CartHomePage());
                    },
                    color: kSecondaryColor,
                    itemsNumber: controller.getTotalProductsInCart,
                    padding: 0.025.w,
                    icon: const Icon(CupertinoIcons.shopping_cart),
                  );
                }),
                SizedBox(width: 0.015.w),
                GetBuilder<NotificationController>(builder: (controller) {
                  return ButtonFlat(
                    onTap: () {
                      Push.to(context, const NotificationScreen());
                    },
                    color: kSecondaryColor,
                    itemsNumber: controller.getTotalNotificationsBuyer,
                    padding: 0.025.w,
                    icon: const Icon(CupertinoIcons.bell),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void handleSelection(ColorItem color) {
    setState(() {
      selectedColor = color.label;
      if (searchHistory.length >= 5) {
        searchHistory.removeLast();
      }
      searchHistory.insert(0, color);
    });
  }

  String? selectedColor;

  List<ColorItem> searchHistory = <ColorItem>[];

  Iterable<Widget> getHistoryList(SearchController controller) {
    return searchHistory.map((color) => ListTile(
          leading: const Icon(Icons.history),
          title: Text(color.label),
          trailing: IconButton(
              icon: const Icon(Icons.call_missed),
              onPressed: () {
                controller.text = color.label;
                controller.selection =
                    TextSelection.collapsed(offset: controller.text.length);
              }),
          onTap: () {
            controller.closeView(color.label);
            handleSelection(color);
          },
        ));
  }

  Iterable<Widget> getSuggestions(SearchController controller) {
    final String input = controller.value.text;
    return ColorItem.values
        .where((color) => color.label.contains(input))
        .map((filteredColor) => ListTile(
              leading: CircleAvatar(backgroundColor: filteredColor.color),
              title: Text(filteredColor.label),
              trailing: IconButton(
                  icon: const Icon(Icons.call_missed),
                  onPressed: () {
                    controller.text = filteredColor.label;
                    controller.selection =
                        TextSelection.collapsed(offset: controller.text.length);
                  }),
              onTap: () {
                controller.closeView(filteredColor.label);
                handleSelection(filteredColor);
              },
            ));
  }
}

class _BuildSellerAppBar extends StatefulWidget {
  const _BuildSellerAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<_BuildSellerAppBar> createState() => _BuildSellerAppBarState();
}

class _BuildSellerAppBarState extends State<_BuildSellerAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SearchAnchor(
              isFullScreen: true,
              suggestionsBuilder: (context, controller) {
                return <Widget>[
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('No search history.',
                          style: TextStyle(color: Colors.grey)),
                    ),
                  )
                ];
              },
              builder: (BuildContext context, SearchController controller) {
                return Material(
                  borderRadius: BorderRadius.circular(16.0),
                  elevation: 1,
                  shadowColor: Colors.grey,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      children: [
                        Icon(CupertinoIcons.search),
                        SizedBox(width: 8),
                        Text('Search for products...'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                ButtonFlat(
                  onTap: () {
                    Push.to(context, const ChatScreen());
                  },
                  color: kSecondaryColor,
                  itemsNumber: 0,
                  padding: 0.025.w,
                  icon: const Icon(CupertinoIcons.chat_bubble_2),
                ),
                SizedBox(width: 0.03.w),
                GetBuilder<NotificationController>(builder: (controller) {
                  return ButtonFlat(
                    onTap: () {
                      Push.to(context, const NotificationScreen());
                    },
                    color: kSecondaryColor,
                    itemsNumber: controller.getTotalNotificationsSeller,
                    padding: 0.025.w,
                    icon: const Icon(CupertinoIcons.bell),
                  );
                }),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum ColorItem {
  red('red', Colors.red),
  orange('orange', Colors.orange),
  yellow('yellow', Colors.yellow),
  green('green', Colors.green),
  blue('blue', Colors.blue),
  indigo('indigo', Colors.indigo),
  violet('violet', Color(0xFF8F00FF)),
  purple('purple', Colors.purple),
  pink('pink', Colors.pink),
  silver('silver', Color(0xFF808080)),
  gold('gold', Color(0xFFFFD700)),
  beige('beige', Color(0xFFF5F5DC)),
  brown('brown', Colors.brown),
  grey('grey', Colors.grey),
  black('black', Colors.black),
  white('white', Colors.white);

  const ColorItem(this.label, this.color);

  final String label;
  final Color color;
}
