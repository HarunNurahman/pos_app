import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/colors.dart';
import 'package:pos_app/core/constants/styles.dart';
import 'package:pos_app/core/extensions/build_context_ext.dart';

class QrPaymentDialog extends StatelessWidget {
  const QrPaymentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.primary,
      // insetPadding: EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: context.deviceWidth,
        // padding: EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(),
            Text(
              'Payment - QRIS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: medium,
                color: AppColors.white,
              ),
            ),
            Container(
              width: context.deviceWidth,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 256,
                    width: 256,
                    child: Container(color: AppColors.black),
                  ),
                  Text(
                    'Scan QRIS untuk melakukan pembayaran',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
