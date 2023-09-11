import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/presentation/feature_shared/home/components/title_widget.dart';
import 'package:get/get.dart';

class HomeRevenueWidget extends StatelessWidget {
  const HomeRevenueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWidget(title: 'Your revenue'),
        Container(
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Your revenue today: ',
                    style: context.textTheme.titleMedium,
                  ),
                  Spacer(),
                  Text('1000.000'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Your revenue last day: ',
                    style: context.textTheme.titleMedium,
                  ),
                  Spacer(),
                  Text('1000.000'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Your revenue total: ',
                    style: context.textTheme.titleMedium,
                  ),
                  Spacer(),
                  Text('1000.000'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
