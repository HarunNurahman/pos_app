import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/colors.dart';
import 'package:pos_app/core/constants/styles.dart';
import 'package:pos_app/presentation/home/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel data;
  final VoidCallback onTap;
  const ProductCard({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(data.image, width: 64, height: 64),
            ),
          ),
          Spacer(),
          Text(
            data.name,
            style: TextStyle(fontSize: 16, fontWeight: semibold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Text(
            data.category.value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: semibold,
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  data.priceFormat,
                  style: TextStyle(fontWeight: semibold),
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.add, color: AppColors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
