import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/chat_model.dart';


class ChatWithUsController extends GetxController{

  List<ChatModel> chatData = [
    ChatModel("5:28 pm", "Hi, I’m the MFT support assistant", false),
    ChatModel(
      "5:28 pm",
      "I’m here to help you and will connect you to customer support agent (through call, chat or email) if I don’t have the answer",
      false,
    ),
    ChatModel("6:28 pm", "My issue is not resolved", true),
  ];

  final ScrollController scrollController = ScrollController();
  final TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void sendMessage() {
    String text = messageController.text.trim();
    if (text.isNotEmpty) {
      String formattedTime = DateFormat('h:mm a').format(DateTime.now());
      chatData.insert(0, ChatModel(formattedTime, text, true));
      messageController.clear();
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
    update();
  }

}