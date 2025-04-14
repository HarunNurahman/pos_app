import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_app/core/constants/colors.dart';
import 'package:pos_app/core/constants/styles.dart';
import 'package:pos_app/core/extensions/build_context_ext.dart';

class MenuButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  final bool isImage;
  final double size;
  const MenuButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
    this.isActive = false,
    this.isImage = false,
    this.size = 90,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Ink(
          width: context.deviceWidth,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            spacing: 10,
            children: [
              isImage
                  ? Image.asset(iconPath, fit: BoxFit.contain)
                  : SvgPicture.asset(
                    iconPath,
                    colorFilter: ColorFilter.mode(
                      isActive ? AppColors.white : AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
              Text(
                label,
                style: TextStyle(
                  fontWeight: isActive ? bold : regular,
                  color: isActive ? AppColors.white : AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
