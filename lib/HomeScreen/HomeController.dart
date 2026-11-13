

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {

  var isOnline = false.obs;

  var selectedIndex = 0.obs;

  void toggleAvailability() {
    isOnline.value = !isOnline.value;
  }

  void changeFilterIndex(int index) {
    selectedIndex.value = index;
  }
   // Home chat screen
  var messages = [
  {"text": "Hi! Do you bring your own cleaning supplies?", "isMe": false, "time": "7:40"},
  {"text": "Yes, I can bring my own supplies.", "isMe": true, "time": "7:40"},
  {"text": "Hi! Do you bring your own cleaning supplies?", "isMe": false, "time": "7:40"},
  ].obs;

  final TextEditingController messageController = TextEditingController();
  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;
    final now = DateTime.now();
    final formattedTime = "${now.hour}:${now.minute.toString().padLeft(2, '0')}";

    messages.add({
      "text": messageController.text.trim(),
      "isMe": true,
      "time": formattedTime,
    });

    messageController.clear();
  }
}