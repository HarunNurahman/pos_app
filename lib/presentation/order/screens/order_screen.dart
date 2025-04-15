import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_app/core/assets/assets.gen.dart';
import 'package:pos_app/core/components/menu_button.dart';
import 'package:pos_app/core/constants/colors.dart';
import 'package:pos_app/core/constants/styles.dart';
import 'package:pos_app/presentation/order/models/order_model.dart';
import 'package:pos_app/presentation/order/widgets/cash_payment_dialog.dart';
import 'package:pos_app/presentation/order/widgets/order_card.dart';
import 'package:pos_app/presentation/order/widgets/process_button.dart';
import 'package:pos_app/presentation/order/widgets/qr_payment_dialog.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final indexValue = ValueNotifier<int>(0);
  final List<OrderModel> orders = [
    OrderModel(image: Assets.images.f1.path, name: 'Cafe Latte', price: 21000),
    OrderModel(image: Assets.images.f2.path, name: 'Cappucino', price: 23000),
  ];

  int calculateTotal(List<OrderModel> orders) {
    int totalPrice = 0;
    for (var order in orders) {
      totalPrice += order.price * order.quantity;
    }
    return totalPrice;
  }

  void updateQuantity(int index, int newQuantity) {
    setState(() {
      orders[index].quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder(
              valueListenable: indexValue,
              builder:
                  (context, value, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 8,
                    children: [
                      MenuButton(
                        iconPath: Assets.icons.debit.path,
                        label: 'Debit',
                        onTap: () => indexValue.value = 0,
                        isActive: value == 0,
                      ),
                      MenuButton(
                        iconPath: Assets.icons.cash.path,
                        label: 'Cash',
                        onTap: () => indexValue.value = 1,
                        isActive: value == 1,
                      ),
                      MenuButton(
                        iconPath: Assets.icons.qrCode.path,
                        label: 'QRIS',
                        onTap: () => indexValue.value = 2,
                        isActive: value == 2,
                      ),
                    ],
                  ),
            ),
            ProcessButton(
              price: calculateTotal(orders),
              onTap: () async {
                if (indexValue.value == 0) {
                } else if (indexValue.value == 1) {
                  showDialog(
                    context: context,
                    builder:
                        (context) =>
                            CashPaymentDialog(price: calculateTotal(orders)),
                  );
                } else if (indexValue.value == 2) {
                  showDialog(
                    context: context,
                    builder: (context) => QrPaymentDialog(),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: StatefulBuilder(
        builder:
            (context, setState) => ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              itemBuilder:
                  (context, index) => OrderCard(
                    data: orders[index],
                    onDeleteTap: () {
                      orders.removeAt(index);
                      setState(() {});
                    },
                    onQuantityChanged: (value) {
                      updateQuantity(index, value);
                    },
                  ),
              separatorBuilder: (context, index) => SizedBox(height: 24),
              itemCount: orders.length,
            ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Order Detail',
        style: TextStyle(color: AppColors.primary, fontWeight: semibold),
      ),
      actionsPadding: EdgeInsets.only(right: 16),
      actions: [
        GestureDetector(
          onTap:
              () => setState(() {
                orders.clear();
              }),
          child: SvgPicture.asset(
            Assets.icons.delete.path,
            width: 24,
            colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
