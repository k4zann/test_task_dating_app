import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/constants/app_icons.dart';
import 'package:dating_app/core/constants/app_text_styles.dart';
import 'package:dating_app/core/widgets/column_builder_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffD9D9D9),
        appBar: AppBar(
          backgroundColor: const Color(0xffD9D9D9),
          elevation: 0,
          title: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              height: 30,
              width: 30,
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
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                size: 24,
                color: AppColors.white,
              ),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              size: 16,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.03,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.lightPurple,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppIcons.rocket_icon,
                          height: 20,
                          width: 20
                        ).paddingOnly(right: 2.5),
                        Text(
                          '2 общих соблазна',
                          style: AppTextStyles.message.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ]
                    ),
                    Image.asset(
                      AppIcons.close_icon,
                      color: AppColors.white,
                      height: 16,
                      width: 16
                    )
                  ]
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: const BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Column(
                  children: [
                    messages.isEmpty
                        ? Text(
                      'Начни общение',
                      style: AppTextStyles.message.copyWith(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ).paddingOnly(top: 51)
                        : SingleChildScrollView(
                      child: ColumnBuilder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const Text('asdfsafsdf');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                child: Row(
                  children: [
                    Image.asset(
                      AppIcons.plus_icon,
                      height: 24,
                      width: 24,
                    ),
                    8.widthBox,
                    Expanded(
                      child: TextField(
                        maxLines: 1,
                        style: AppTextStyles.message.copyWith(
                          color: AppColors.white,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.grey,
                            ),
                          ),
                          hintText: 'Сообщение...',
                          hintStyle: AppTextStyles.message.copyWith(
                            color: AppColors.grey,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              AppIcons.send_icon,
                              height: 24,
                              width: 24,
                            ),
                          )
                        ),
                      ),
                    ),
                    8.widthBox,
                    Image.asset(
                      AppIcons.micro_icon,
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.05,
          color: AppColors.black
        ),
      ),
    );
  }
}
