import 'package:flutter/material.dart';
import 'package:pos_app/core/components/custom_button.dart';
import 'package:pos_app/core/components/custom_text_field.dart';
import 'package:pos_app/core/constants/colors.dart';
import 'package:pos_app/core/constants/styles.dart';
import 'package:pos_app/core/extensions/build_context_ext.dart';
import 'package:pos_app/core/extensions/int_ext.dart';
import 'package:pos_app/core/extensions/string_ext.dart';
import 'package:pos_app/presentation/order/widgets/payment_success_dialog.dart';

class CashPaymentDialog extends StatelessWidget {
  final int price;
  const CashPaymentDialog({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final priceController = TextEditingController(text: price.currencyFormatRp);
    final List<int> buttonValues = [10000, 20000, 50000, 100000];
    return Dialog(
      backgroundColor: AppColors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: context.deviceWidth,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'Payment - Cash',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: semibold,
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: 24),
            CustomTextField(
              controller: priceController,
              label: '',
              showLabel: false,
              keyboardType: TextInputType.numberWithOptions(),
              onChanged: (value) {
                final int priceValue = value.toIntegerFromText;
                priceController.text = priceValue.currencyFormatRp;
                priceController.selection = TextSelection.fromPosition(
                  TextPosition(offset: priceValue.currencyFormatRp.length),
                );
              },
            ),
            SizedBox(height: 16),
            CustomButton.filled(
              onPressed: () {
                priceController.text = price.currencyFormatRp;
              },
              label: 'Exact Money - ${price.currencyFormatRp}',
            ),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 3,
              ),
              itemCount: buttonValues.length,
              itemBuilder: (context, index) {
                return CustomButton.outlined(
                  label: buttonValues[index].currencyFormatRp,
                  onPressed: () {
                    final int priceValue = buttonValues[index];
                    priceController.text = priceValue.currencyFormatRp;
                    priceController.selection = TextSelection.fromPosition(
                      TextPosition(offset: priceValue.currencyFormatRp.length),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 30),
            CustomButton.filled(
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => PaymentSuccessDialog(),
                );
              },
              label: 'Process Payment',
            ),
          ],
        ),
      ),
    );
  }
}
