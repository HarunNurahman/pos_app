import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_app/core/assets/assets.gen.dart';
import 'package:pos_app/core/components/custom_button.dart';
import 'package:pos_app/core/constants/colors.dart';
import 'package:pos_app/core/constants/styles.dart';
import 'package:pos_app/core/extensions/build_context_ext.dart';
import 'package:pos_app/core/extensions/date_time_ext.dart';
import 'package:pos_app/core/extensions/int_ext.dart';
import 'package:pos_app/presentation/home/screens/dashboard_screen.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: context.deviceWidth,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Assets.icons.done.svg()),
            SizedBox(height: 16),
            Text(
              'Payment Success!',
              style: TextStyle(fontSize: 24, fontWeight: medium),
            ),
            SizedBox(height: 24),
            _labelValue('Payment Method', 'Cash'),
            _labelValue('Total Purchase', 67000.currencyFormatRp),
            _labelValue('Nominal Payment', 67000.currencyFormatRp),
            _labelValue('Payment Time', DateTime.now().toFormattedTime()),
            SizedBox(height: 24),
            Row(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CustomButton.filled(
                    onPressed: () {
                      context.pushAndRemoveUntil(
                        DashboardScreen(),
                        (route) => false,
                      );
                    },
                    label: 'Save',
                  ),
                ),
                Flexible(
                  child: CustomButton.outlined(
                    onPressed: () {},
                    label: 'Print',
                    icon: SvgPicture.asset(Assets.icons.print.path),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _labelValue(final String label, final String value) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Text(label.toUpperCase()),
        Text(value, style: TextStyle(fontWeight: semibold)),
        Divider(),
      ],
    );
  }
}
