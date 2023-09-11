import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/data/controller/manage_product_controller.dart';
import 'package:flutter_ecommerce_app/data/model/product_model.dart';
import 'package:flutter_ecommerce_app/design/extension/double_extension.dart';
import 'package:flutter_ecommerce_app/presentation/feature_shared/home/components/title_widget.dart';
import 'package:flutter_ecommerce_app/share/constant/constant.dart';
import 'package:flutter_ecommerce_app/share/widget/widget_appbar.dart';
import 'package:flutter_ecommerce_app/share/widget/widget_custom_text_field.dart';
import 'package:flutter_ecommerce_app/share/widget/widget_image_network_custom.dart';
import 'package:get/get.dart';

import '../../../share/widget/widget_dialog_helper.dart';

class ManageProductDetailScreen extends StatefulWidget {
  const ManageProductDetailScreen(
      {super.key, required this.data, this.isAddProduct = false});
  final ProductModel data;
  final bool isAddProduct;
  @override
  State<ManageProductDetailScreen> createState() =>
      _ManageProductDetailScreenState();
}

class _ManageProductDetailScreenState extends State<ManageProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.isAddProduct ? 'Add Product' : widget.data.name,
      ),
      body: GetBuilder<ManageProductController>(
        init: Get.find<ManageProductController>()..initData(widget.data),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  CustomTextFieldWidget(
                    title: 'Name',
                    hint: 'Type Your Name',
                    text: widget.data.name,
                    onChanged: (p0) {
                      controller.onChangedData(name: p0);
                    },
                  ),
                  CustomTextFieldWidget(
                    title: 'Description',
                    hint: 'Type Your Description',
                    text: widget.data.description,
                    onChanged: (p0) {
                      controller.onChangedData(description: p0);
                    },
                  ),
                  CustomTextFieldWidget(
                    title: 'Price',
                    hint: 'Type Your Price',
                    text: '${widget.data.price ?? ''}',
                    onChanged: (p0) {
                      controller.onChangedData(price: int.parse(p0));
                    },
                  ),
                  CustomTextFieldWidget(
                    shouldShow: !widget.isAddProduct,
                    title: 'Quantity sold',
                    hint: 'Type Your Quantity sold',
                    text: '${widget.data.quantity ?? ''}',
                    onChanged: (p0) {
                      controller.onChangedData(quantity: int.parse(p0));
                    },
                  ),
                  CustomTextFieldWidget(
                    title: 'Quantity total',
                    hint: 'Type Your Quantity total',
                    text: '${widget.data.totalQuantity ?? ''}',
                    onChanged: (p0) {
                      controller.onChangedData(totalQuantity: int.parse(p0));
                    },
                  ),
                  TitleWidget(title: 'Images', showSeeMore: false),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      Wrap(
                        children: List.generate(
                            controller.addProductModel.images.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: CustomNetworkImageWidget(
                                    height: 0.1.h,
                                    width: 0.1.h,
                                    borderRadius: 16,
                                    image: controller
                                        .addProductModel.images[index],
                                  ),
                                )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: InkWell(
                          onTap: () async {
                            final path =
                                await DialogHelper.imagePickerSelections(
                                    context);

                            if (path != null) {
                              controller.onChangedData(imagePath: path);
                            }
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                                height: 0.08.h,
                                width: 0.08.h,
                                color: Colors.white,
                                child: Center(child: Icon(Icons.add))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      minWidth: 0.8.w,
                      color: kPrimaryColor,
                      onPressed: widget.isAddProduct
                          ? () async {
                              await controller.onAddProduct(context);
                            }
                          : () async {
                              await controller.onUpdateProduct(context);
                            },
                      child: Text(
                        widget.isAddProduct ? "Add Product" : "Update Product",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
