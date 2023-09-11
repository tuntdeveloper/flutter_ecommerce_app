import 'package:flutter_ecommerce_app/data/constant/path_collection.dart';
import 'package:flutter_ecommerce_app/data/firebase/firebase_curd_core.dart';
import 'package:flutter_ecommerce_app/data/model/product_model.dart';

class ProductRepo extends FirebaseCRUDCore {
  ProductRepo() : super(pathCollection: kPathCollectionProduct);

  @override
  fromJson(Map<String, dynamic> json) {
    return ProductModel.fromJson(json);
  }
}
