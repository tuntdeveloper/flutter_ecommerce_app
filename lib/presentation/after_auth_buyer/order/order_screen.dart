import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/data/constant/path_collection.dart';
import 'package:flutter_ecommerce_app/data/controller/load_more_controller.dart';
import 'package:flutter_ecommerce_app/data/model/order_model.dart';
import 'package:flutter_ecommerce_app/data/repo/pref_repo.dart';
import 'package:flutter_ecommerce_app/helper/load_more_helper.dart';
import 'package:flutter_ecommerce_app/presentation/after_auth_buyer/order/widget/order_item_widget.dart';
import 'package:get/get.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends LoadMoreHelper<OrderModel, OrderScreen> {
  final PrefRepo repo = Get.find();

  @override
  String get title => 'Order';

  @override
  Widget itemBuilder(OrderModel data) {
    return OrderItemWidget(data: data);
  }

  @override
  LoadMoreController<OrderModel> controller() {
    return LoadMoreController(
      sortFieldName: 'buyerId',
      sortFieldValue: repo.getCurrentUserId(),
      pathCollection: kPathCollectionOrder,
      fromJson: OrderModel.fromJson,
    );
  }
}
