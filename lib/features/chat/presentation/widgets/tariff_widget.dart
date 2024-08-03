import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/constants/app_icons.dart';
import 'package:dating_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class TariffWidget extends StatelessWidget {
  const TariffWidget({
    super.key,
    required this.count,
    required this.price,
    required this.hitText,
    required this.onTap,
    this.isHit = true,
  });

  final Function() onTap;
  final String hitText;
  final bool isHit;
  final int count;
  final int price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xff212020),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: AppColors.black,
                    width: 1
                )
            ),
            padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '$count',
                      style: AppTextStyles.subtitle,
                    ),
                    4.widthBox,
                    Image.asset(
                      AppIcons.yellow_glass,
                      width: 30,
                    )
                  ],
                ).paddingOnly(bottom: 10),
                Text(
                  '$price ₽',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                )
              ],
            ),
          ),
          if (isHit) ...[
            Positioned(
              top: -10,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Color(0xffFF0000),
                      Color(0xffF50000),
                      Color(0xffDA0000),
                      Color(0xffFF1E00),
                    ],
                    center: Alignment(0.7, -0.6),
                    focal: Alignment(0.7, -0.6),
                    focalRadius: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(100, 50)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.red.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Text(
                  hitText,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Ubuntu'
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
