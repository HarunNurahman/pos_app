import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/colors.dart';
import 'package:pos_app/core/constants/styles.dart';
import 'package:pos_app/core/extensions/build_context_ext.dart';
import 'package:pos_app/presentation/order/models/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel data;
  final VoidCallback onDeleteTap;
  final EdgeInsetsGeometry? margin;
  final ValueChanged<int>? onQuantityChanged;
  const OrderCard({
    super.key,
    required this.data,
    required this.onDeleteTap,
    this.onQuantityChanged,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: context.deviceWidth,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(data.image, width: 72, height: 72),
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data.name, style: TextStyle(fontWeight: semibold)),
                    Text(
                      data.priceFormat,
                      style: TextStyle(fontWeight: semibold),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                StatefulBuilder(
                  builder:
                      (context, setState) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (data.quantity > 1) {
                                      data.quantity--;
                                      onQuantityChanged?.call(data.quantity);
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove_circle,
                                  color: AppColors.primary,
                                ),
                              ),
                              SizedBox(
                                width: 32,
                                child: Center(
                                  child: Text(
                                    data.quantity.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    data.quantity++;
                                    onQuantityChanged?.call(data.quantity);
                                  });
                                },
                                child: Icon(
                                  Icons.add_circle,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: onDeleteTap,
                            child: Icon(
                              Icons.highlight_off,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
