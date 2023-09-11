import 'package:flutter/material.dart';

import '../../../../share/constant/constant.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title, this.showSeeMore = true})
      : super(key: key);

  final String? title;
  final bool showSeeMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          Visibility(
            visible: showSeeMore,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: "See more",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: kBodyTextColor.withOpacity(0.5))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
