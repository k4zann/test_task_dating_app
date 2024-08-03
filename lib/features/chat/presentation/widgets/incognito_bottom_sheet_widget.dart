import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/constants/app_icons.dart';
import 'package:dating_app/core/constants/app_text_styles.dart';
import 'package:dating_app/features/chat/presentation/widgets/tariff_widget.dart';
import 'package:flutter/material.dart';

class IncognitoBottomSheet extends StatelessWidget {
  const IncognitoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppColors.darkBlue,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppIcons.purple_glass,
                ).paddingOnly(bottom: 20, top: 6),
                RichText(
                  text: TextSpan(
                    text: 'РЕЖИМ ',
                    style: AppTextStyles.subtitle.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'ИНКОГНИТО',
                        style: AppTextStyles.subtitle.copyWith(
                          color: AppColors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextSpan(
                        text: ' на 24 часа',
                        style: AppTextStyles.subtitle.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ).paddingOnly(bottom: 24),
                Text(
                  'Стань невидимкой в ленте и чатах, скрой объявление и наслаждайся <Space> незамеченным',
                  style: AppTextStyles.message.copyWith(
                    color: const Color(0xffBCB3B3),
                  ),
                ).paddingOnly(bottom: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TariffWidget(
                      count: 1,
                      price: 99,
                      isHit: false,
                      hitText: '',
                      onTap: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    16.widthBox,
                    TariffWidget(
                      count: 3,
                      price: 199,
                      hitText: 'Хит',
                      onTap: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    16.widthBox,
                    TariffWidget(
                      count: 7,
                      price: 399,
                      hitText: '-42%',
                      onTap: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ],
                ).paddingOnly(bottom: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Купить',
                    style: AppTextStyles.subtitle,
                    textAlign: TextAlign.center,
                  ),
                ).paddingOnly(bottom: 24),
                const Text(
                  'УСЛОВИЯ И ПОЛОЖЕНИЯ',
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ).paddingOnly(bottom: 16),
              ],
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
