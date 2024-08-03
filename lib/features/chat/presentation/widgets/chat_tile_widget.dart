import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChatTileWidget extends StatelessWidget {
  const ChatTileWidget({
    super.key,
    required this.onTap,
    this.readLastMessage = true
  });

  final Function() onTap;
  final bool readLastMessage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      'https://get.wallhere.com/photo/face-field-Person-man-skarf-adventurer-johannes-strate-776717.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          color: AppColors.white,
                        );
                      }
                    ),
                  ),
                ).paddingOnly(right: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '23 ч 43 мин',
                      style: AppTextStyles.message.copyWith(
                        fontSize: 12
                      )
                    ),
                    const Text(
                      'Отлично выглядишь',
                      style: AppTextStyles.message
                    ),
                  ],
                ).paddingSymmetric(vertical: 9),
              ],
            ),
            if (!readLastMessage)
              Container(
                height: 4,
                width: 4,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
              )
          ],
        ),
      ),
    );
  }
}
