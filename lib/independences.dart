import 'package:flutter_ecommerce_app/data/controller/chat_controller.dart';
import 'package:flutter_ecommerce_app/data/controller/manage_product_controller.dart';
import 'package:flutter_ecommerce_app/data/controller/order_controller.dart';
import 'package:flutter_ecommerce_app/data/repo/chat_repo.dart';
import 'package:flutter_ecommerce_app/data/repo/message_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'data/controller/auth_controller.dart';
import 'data/controller/cart_controller.dart';
import 'data/controller/notification_controller.dart';
import 'data/controller/product_controller.dart';
import 'data/repo/auth_repo.dart';
import 'data/repo/notification_repo.dart';
import 'data/repo/order_repo.dart';
import 'data/repo/pref_repo.dart';
import 'data/repo/product_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut<Uuid>(() => const Uuid());

  Get.lazyPut<SharedPreferences>(() => sharedPreferences);
  Get.lazyPut<SellerAuthRepo>(() => SellerAuthRepo(sharedPreferences));
  Get.lazyPut<BuyerAuthRepo>(() => BuyerAuthRepo(sharedPreferences));
  Get.lazyPut<PrefRepo>(() => PrefRepo(sharedPreferences));
  Get.lazyPut<ProductRepo>(() => ProductRepo());
  Get.lazyPut<OrderRepo>(() => OrderRepo());
  Get.lazyPut<NotificationBuyerRepo>(() => NotificationBuyerRepo());
  Get.lazyPut<NotificationSellerRepo>(() => NotificationSellerRepo());
  Get.lazyPut<ChatRepo>(() => ChatRepo());
  Get.lazyPut<MessageRepo>(() => MessageRepo());

  Get.lazyPut<AuthController>(() => AuthController(
      Get.find(), Get.find(), sharedPreferences, Get.find(), Get.find()));
  Get.lazyPut<CartController>(() => CartController(
      Get.find(), Get.find(), Get.find(), Get.find(), Get.find(), Get.find())
    ..onInit());
  Get.lazyPut<NotificationController>(() =>
      NotificationController(Get.find(), Get.find(), Get.find())..onInit());
  Get.lazyPut<ProductController>(
      () => ProductController(Get.find(), Get.find(), Get.find())..onInit());
  Get.lazyPut<ChatController>(() => ChatController(Get.find(), Get.find()));
  Get.lazyPut<ManageProductController>(
      () => ManageProductController(Get.find(), Get.find()));
  Get.lazyPut<OrderController>(() => OrderController(Get.find(), Get.find()));
}
