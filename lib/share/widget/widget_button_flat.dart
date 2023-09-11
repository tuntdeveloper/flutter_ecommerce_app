import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/design/colors.dart';

import '../../design/extension/double_extension.dart';

class ButtonFlat extends StatelessWidget {
  final Color color;
  final double padding;
  final int itemsNumber;
  final Icon icon;
  final Function()? onTap;

  const ButtonFlat({
    Key? key,
    required this.itemsNumber,
    required this.padding,
    required this.color,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(children: [
        Material(
          borderRadius: BorderRadius.circular(25.0),
          elevation: 1,
          shadowColor: Colors.grey,
          child: Container(
              padding: EdgeInsets.all(padding),
              height: 0.12.w,
              width: 0.12.w,
              decoration: BoxDecoration(
                color: AppColors.of(context).backgroundColor,
                shape: BoxShape.circle,
              ),
              child: icon),
        ),
        itemsNumber == 0
            ? Container()
            : Positioned(
                top: 0,
                right: 0,
                child: Material(
                  borderRadius: BorderRadius.circular(25.0),
                  elevation: 1,
                  child: Container(
                    height: 0.06.w,
                    width: 0.06.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.of(context).primaryColor,
                    ),
                    child: Center(
                        child: Text(
                      '$itemsNumber',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
      ]),
    );
  }
}
