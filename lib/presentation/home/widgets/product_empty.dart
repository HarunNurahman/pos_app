import 'package:flutter/material.dart';
import 'package:pos_app/core/assets/assets.gen.dart';
import 'package:pos_app/core/constants/colors.dart';

class ProductEmpty extends StatelessWidget {
  const ProductEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.orders.svg(width: 114.0),
          const SizedBox(height: 4),
          const Text(
            'Belum ada Produk',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
