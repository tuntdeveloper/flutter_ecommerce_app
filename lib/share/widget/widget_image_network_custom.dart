import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/data/firebase/firebase_storage_core.dart';
import 'package:flutter_ecommerce_app/data/model/image_model.dart';
import 'package:flutter_ecommerce_app/design/extension/double_extension.dart';
import 'package:flutter_ecommerce_app/share/constant/constant.dart';
import 'package:flutter_ecommerce_app/share/widget/widget_loading_indicator.dart';

class CustomNetworkImageWidget extends StatefulWidget {
  const CustomNetworkImageWidget({
    Key? key,
    required this.image,
    this.height,
    this.width,
    this.borderRadius = 0,
    this.child = const SizedBox(),
  }) : super(key: key);

  final ImageModel image;
  final double? height;
  final double? width;
  final Widget child;
  final double borderRadius;

  @override
  State<CustomNetworkImageWidget> createState() =>
      _CustomNetworkImageWidgetState();
}

class _CustomNetworkImageWidgetState extends State<CustomNetworkImageWidget> {
  final image = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      image.value =
          await FirebaseStorageCore.getFileUrl(path: widget.image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: image,
        builder: (_, data, __) {
          if (data.isEmpty) {
            return Container(
              height: widget.height ?? 0.3.w,
              width: widget.width ?? 0.3.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  color: kSecondaryColor),
              child: OnLoadingIndicator(),
            );
          }
          return Container(
            height: widget.height ?? 0.3.w,
            width: widget.width ?? 0.3.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                color: kSecondaryColor),
            child: widget.child,
          );
        });
  }
}

const defaultImage =
    'https://img.freepik.com/free-vector/white-product-podium-with-green-tropical-palm-leaves-golden-round-arch-green-wall_87521-3023.jpg?w=1380&t=st=1686233299~exp=1686233899~hmac=d727bc186f7989729e776608195721cd8acaaa82699b0e4dec6ce4e2494934a3';
