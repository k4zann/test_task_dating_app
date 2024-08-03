import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/constants/app_icons.dart';
import 'package:dating_app/core/constants/app_text_styles.dart';
import 'package:dating_app/core/widgets/column_builder_widget.dart';
import 'package:dating_app/features/chat/presentation/pages/chat.dart';
import 'package:dating_app/features/chat/presentation/widgets/chat_tile_widget.dart';
import 'package:dating_app/features/chat/presentation/widgets/incognito_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget {
  ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  bool incognitoMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD9D9D9),
      body: Stack(
        children: [
         Positioned(
           top: MediaQuery.of(context).size.height * 0.2,
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
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Text(
                       'ЧАТЫ',
                       style: AppTextStyles.title
                     ),
                     Row(
                       children: [
                         const Text(
                           'OFF',
                            style: AppTextStyles.subtitle
                         ),
                         const SizedBox(width: 12),
                         InkWell(
                           onTap: () {
                             if (incognitoMode) {
                               setState(() {
                                  incognitoMode = false;
                               });
                             } else {
                               showModalBottomSheet(
                                   context: context,
                                   elevation: 0,
                                   builder: (context) {
                                     return const  IncognitoBottomSheet();
                                   }
                               ).then((value) {
                                 if (value != null && value) {
                                   setState(() {
                                     incognitoMode = true;
                                   });
                                 }
                               });
                             }

                           },
                           child: Container(
                             padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                             decoration: BoxDecoration(
                               color: AppColors.grey,
                                borderRadius: BorderRadius.circular(20),
                             ),
                             child: Center(
                               child: Image.asset(
                                 incognitoMode ? AppIcons.micro_off_icon : AppIcons.yellow_glass,
                                 width: incognitoMode ? 16 : 30,
                                 height: incognitoMode ? 16 : 12
                               )
                             ).paddingOnly(right: incognitoMode ? 12 : 0),
                           ),
                         )
                       ],
                     )
                   ]
                 ).paddingOnly(bottom: 16),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColors.darkPurple,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Image.asset(
                              AppIcons.heart_icon,
                              width: 24,
                              height: 24,
                            )
                          ),
                           12.widthBox,
                           Text(
                             '44 человека тебя лайкнули',
                             style: AppTextStyles.message.copyWith(
                               fontWeight: FontWeight.w500,
                             )
                           ),
                        ],
                      ),
                      Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      )
                   ],
                 ),
                  16.heightBox,
                 SingleChildScrollView(
                   child: ColumnBuilder(
                     itemCount: 5,
                     itemBuilder: (context, index) {
                       if (index == 2) {
                         return ChatTileWidget(
                           readLastMessage: false,
                           onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatPage(

                                  )
                                )
                              );
                           },
                         ).paddingOnly(bottom: 16);
                       }
                       return ChatTileWidget(
                         onTap: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => ChatPage(

                               )
                             )
                           );
                         },
                       ).paddingOnly(bottom: 16);
                     }
                   ),
                 )
               ]
             ),
           ),
         )
        ]
      )
    );
  }
}
