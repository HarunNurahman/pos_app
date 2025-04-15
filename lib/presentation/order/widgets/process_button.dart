import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/colors.dart';
import 'package:pos_app/core/constants/styles.dart';
import 'package:pos_app/core/extensions/build_context_ext.dart';
import 'package:pos_app/core/extensions/int_ext.dart';

class ProcessButton extends StatelessWidget {
  final int price;
  final VoidCallback onTap;
  const ProcessButton({super.key, required this.price, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        padding: EdgeInsets.all(16),
        width: context.deviceWidth,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              price.currencyFormatRp,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            Spacer(),
            Text(
              'Proceed to Payment',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.chevron_right, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
