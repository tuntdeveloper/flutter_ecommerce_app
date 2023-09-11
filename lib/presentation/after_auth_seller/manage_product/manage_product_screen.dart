import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/data/constant/path_collection.dart';
import 'package:flutter_ecommerce_app/data/controller/load_more_controller.dart';
import 'package:flutter_ecommerce_app/data/model/product_model.dart';
import 'package:flutter_ecommerce_app/data/repo/pref_repo.dart';
import 'package:flutter_ecommerce_app/design/extension/double_extension.dart';
import 'package:flutter_ecommerce_app/helper/load_more_helper.dart';
import 'package:flutter_ecommerce_app/helper/navigator_helper.dart';
import 'package:flutter_ecommerce_app/presentation/after_auth_seller/manage_product/manage_product_detail_screen.dart';
import 'package:flutter_ecommerce_app/share/constant/constant.dart';
import 'package:flutter_ecommerce_app/share/widget/widget_image_network.dart';
import 'package:get/get.dart';

class ManageProductScreen extends StatefulWidget {
  const ManageProductScreen({super.key});

  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState
    extends LoadMoreHelper<ProductModel, ManageProductScreen> {
  final prefRepo = Get.find<PrefRepo>();

  @override
  Color get backgroundColor => appBackgroundColor;

  @override
  Widget? get titleWidget => Row(
        children: [
          const Text(
            'Manage Product',
            style: TextStyle(color: Colors.black),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Push.to(
                  context,
                  ManageProductDetailScreen(
                    data: ProductModel(),
                    isAddProduct: true,
                  ));
            },
            child: Text(
              'Add Product',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );

  @override
  LoadMoreController<ProductModel> controller() {
    return LoadMoreController(
      sortFieldValue: prefRepo.getCurrentUserId(),
      sortFieldName: 'sellerId',
      pathCollection: kPathCollectionProduct,
      fromJson: ProductModel.fromJson,
    );
  }

  @override
  Widget itemBuilder(ProductModel data) {
    return InkWell(
      onTap: () {
        Push.to(context, ManageProductDetailScreen(data: data));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 0.18.h,
        width: double.maxFinite,
        child: Row(
          children: [
            CustomNetworkImageFromProductWidget(
              height: 0.14.h,
              width: 0.14.h,
              borderRadius: 20,
              product: data,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: data.name ?? '',
                                    style: TextStyle(
                                        fontSize: 0.02.h, color: kTextColor),
                                  ),
                                  TextSpan(
                                    text: '${data.price ?? 0}',
                                    style: TextStyle(
                                        fontSize: 0.022.h, color: kAccentColor),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.01.h),
                          Wrap(
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: 'Provided by ',
                                    style: TextStyle(
                                        fontSize: 0.02.h, color: kTextColor),
                                  ),
                                  TextSpan(
                                    text: data.seller?.storeName ??
                                        data.seller?.name ??
                                        '',
                                    style: TextStyle(
                                        fontSize: 0.022.h, color: kAccentColor),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.025.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: 'Quantity sold: ',
                                    style: TextStyle(
                                        fontSize: 0.02.h, color: kTextColor),
                                  ),
                                  TextSpan(
                                    text: '${data.quantity ?? 0}',
                                    style: TextStyle(
                                        fontSize: 0.022.h, color: kAccentColor),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: 'Quantity total: ',
                                    style: TextStyle(
                                        fontSize: 0.02.h, color: kTextColor),
                                  ),
                                  TextSpan(
                                    text: '${data.totalQuantity ?? 0}',
                                    style: TextStyle(
                                        fontSize: 0.022.h, color: kAccentColor),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
