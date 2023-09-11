import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app/data/model/notification_seller_model.dart';
import 'package:flutter_ecommerce_app/data/repo/product_repo.dart';
import 'package:flutter_ecommerce_app/share/widget/widget_snack_bar_helper.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../helper/navigator_helper.dart';
import '../../presentation/after_auth_buyer/cart/cart_screen.dart';
import '../../presentation/feature_shared/home/home_screen.dart';
import '../../share/widget/widget_dialog_helper.dart';
import '../../share/widget/widget_loading_indicator.dart';
import '../model/buyer_model.dart';
import '../model/notification_buyer_model.dart';
import '../model/order_model.dart';
import '../model/product_model.dart';
import '../repo/auth_repo.dart';
import '../repo/notification_repo.dart';
import '../repo/order_repo.dart';
import '../repo/pref_repo.dart';
import 'notification_controller.dart';

class CartController extends GetxController {
  CartController(
      this.prefRepo,
      this.buyerRepo,
      this.orderRepo,
      this.notificationBuyerRepo,
      this.productRepo,
      this.notificationSellerRepo);

  final PrefRepo prefRepo;
  final ProductRepo productRepo;
  final BuyerAuthRepo buyerRepo;
  final OrderRepo orderRepo;
  final NotificationBuyerRepo notificationBuyerRepo;
  final NotificationSellerRepo notificationSellerRepo;

  final NotificationController notificationController = Get.find();

  @override
  void onInit() async {
    super.onInit();
    await initProductsInCart().whenComplete(() => update());
  }

  num _quantity = 1;
  num get quantity => _quantity;

  BuyerModel _userModel = const BuyerModel();
  BuyerModel get userModel => _userModel;

  List<ProductModel> _productsInCart = [];
  List<ProductModel> get productsInCart => _productsInCart;

  createOrder(BuildContext context) async {
    LoadingIndicator.show(context);
    List<Future> future = [];
    String orderId = Get.find<Uuid>().v1();

    for (var item in _productsInCart) {
      final OrderModel order = OrderModel(
        id: orderId,
        seller: item.seller,
        sellerId: item.sellerId,
        buyer:
            prefRepo.getCurrentUser().buyerModel?.copyWith(productInCart: []),
        buyerId: prefRepo.getCurrentUserId(),
        product: item,
        boughtDate: DateTime.now(),
        receiveExpectDate: DateTime.now(),
      );

      future
        ..add(prefRepo.setCurrentBuyer(
            prefRepo.getCurrentUser().buyerModel!.copyWith(productInCart: [])))
        ..add(buyerRepo.update(
            data: prefRepo
                .getCurrentUser()
                .buyerModel!
                .copyWith(productInCart: []).toJson()))
        ..add(orderRepo.create(order.toJson()))
        ..add(notificationBuyerRepo.create(NotificationBuyerModel(
          id: Get.find<Uuid>().v1(),
          userId: _userModel.id,
          title: 'Đặt hàng thành công',
          description:
              'Đơn hàng ${item.name} của ban đang được xác nhận, vui lòng kiểm tra thường xuyên khi có thông báo mới.',
          sendAt: DateTime.now(),
        ).toJson()))
        ..add(notificationSellerRepo.create(NotificationSellerModel(
          id: Get.find<Uuid>().v1(),
          userId: item.sellerId,
          title: 'Ban co mot don hang moi!',
          description:
              'Chuc mung. Ban co 1 don hang moi cua khach hang ${prefRepo.getCurrentUser().buyerModel?.name ?? ''}',
          sendAt: DateTime.now(),
        ).toJson()));
    }

    await Future.wait(future).then((_) async {
      _productsInCart.clear();

      await buyerRepo.update(
          data: _userModel.copyWith(productInCart: []).toJson(),
          id: _userModel.id);

      SnackBarHelper.showSnackBar(context, title: 'Create Order Success');
      notificationController.onInit();

      Push.to(context, const HomePage());
    });

    update();
    LoadingIndicator.hide(context);
  }

  Future<void> initProductsInCart() async {
    _quantity = 1;
    if (_userModel == const BuyerModel()) {
      _userModel = prefRepo.getCurrentUser().buyerModel!;
      _productsInCart.clear();
      if ((_userModel.productInCart ?? []).isNotEmpty) {
        _productsInCart.addAll(_userModel.productInCart!);
      }
    }
  }

  Future<void> initQuantity({num qty = 1}) async {
    _quantity = qty;
    await initProductsInCart();
  }

  void addQuantity(bool isAdd) {
    if (isAdd) {
      _quantity = checkQuantity(_quantity += 1);
    } else {
      _quantity = checkQuantity(_quantity -= 1);
    }
    update();
  }

  num checkQuantity(num quantity) {
    if (quantity < 1) {
      return 1;
    }
    return quantity;
  }

  Future<void> addProductToCart(ProductModel product, BuildContext context,
      {bool? shouldAddFromCart}) async {
    try {
      if (_userModel != const BuyerModel()) {
        LoadingIndicator.show(context);

        if ((product.quantity ?? 1) < 1) {
          final result = await DialogHelper.confirmAlertCartPage(context);

          if (result is bool && result) {
            _productsInCart.removeWhere((element) => element.id == product.id);
            _userModel = _userModel.copyWith(productInCart: _productsInCart);
            await buyerRepo
                .update(data: _userModel.toJson(), id: _userModel.id)
                .whenComplete(() => update());
          }
          LoadingIndicator.hide(context);
          return;
        }

        if (_productsInCart.isEmpty) {
          _productsInCart.add(product.copyWith(quantity: _quantity));
          _userModel = _userModel.copyWith(productInCart: _productsInCart);
          await buyerRepo.update(data: _userModel.toJson(), id: _userModel.id);
          LoadingIndicator.hide(context);
          Push.to(context, const CartHomePage());
          return;
        }

        _productsInCart = _productsInCart.map((e) {
          if (e.id == product.id) {
            if (shouldAddFromCart == null || shouldAddFromCart) {
              e = e.copyWith(quantity: (e.quantity ?? 0) + _quantity);
            } else {
              e = e.copyWith(quantity: (e.quantity ?? 0) - _quantity);
            }
          }
          return e;
        }).toList();

        ProductModel productNotInCart = _productsInCart.firstWhere(
            (element) => element.id == product.id,
            orElse: () => const ProductModel());

        if (productNotInCart == const ProductModel()) {
          _productsInCart.add(product.copyWith(quantity: _quantity));
        }

        _userModel = _userModel.copyWith(productInCart: _productsInCart);
        await buyerRepo.update(data: _userModel.toJson(), id: _userModel.id);

        update();
        LoadingIndicator.hide(context);

        if (shouldAddFromCart != null) return;

        Push.to(context, const CartHomePage());
      }
    } catch (e) {
      LoadingIndicator.hide(context);
      throw FlutterError(e.toString());
    }
  }

  int get getTotalProductsInCart {
    num _total = 0;

    for (var element in _productsInCart) {
      _total += element.quantity ?? 0;
    }

    return _total.toInt();
  }

  num get getTotalPrice {
    num _total = 0;

    for (var element in _productsInCart) {
      _total += (element.quantity ?? 0) * (element.price ?? 0);
    }

    return _total;
  }
}
