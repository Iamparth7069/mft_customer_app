import 'package:customer_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/common_widget.dart';
import '../../../../theme/app_style.dart';
import '../controller/chat_with_us_controller.dart';
import '../model/chat_model.dart';

class ChatWithUsScreen extends StatelessWidget {
  const ChatWithUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(
        title: AppText.chatWithUs,
      ),
      body: GetBuilder<ChatWithUsController>(
        init: ChatWithUsController(),
        builder: (controller) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: controller.scrollController,
                    reverse: true, // Start from bottom
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemCount: controller.chatData.length,
                    itemBuilder: (context, index) {
                      return messageContainer(
                        textChatResModel: controller.chatData[index],
                        context: context,
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.mainTextColor.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: const Offset(0, -4), // changes position of shadow to top
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.messageController,
                            decoration: InputDecoration(
                              hintText: AppText.writeAMessage,
                              hintStyle: AppStyle.textStyleOutfit(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.midTextColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: AppColor.lineDarkBoarderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: AppColor.lineDarkBoarderColor),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: controller.sendMessage,
                                    child: Image.asset(
                                      AssetsPath.icSend,
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            textInputAction: TextInputAction.send,
                            onFieldSubmitted: (value) => controller.sendMessage(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  Widget messageContainer({
    required BuildContext context,
    required ChatModel textChatResModel,
  }) {
    bool isMe = textChatResModel.userId;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (isMe)
          Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    textChatResModel.time,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.midTextColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
              ],
            ),
          ClipPath(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: isMe ? AppColor.blueBgColor : AppColor.greyLightColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    textChatResModel.title,
                    style: AppStyle.textStyleOutfit(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.mainTextColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                isMe ? Image.asset(
                  AssetsPath.check,
                  height: 12,
                  width: 12,
                ) : Container()
              ],
            ),
          ),
          if (!isMe)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4,left: 9),
                child: Text(
                  textChatResModel.time,
                  style: AppStyle.textStyleOutfit(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.midTextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
