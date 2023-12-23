import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/customer_service_chat/components/field_chat.dart';
import 'package:zaoed/Screens/Finder/screens/customer_service_chat/components/message_widget.dart';
import 'package:zaoed/components/appbar/appbar_widget.dart';
import 'package:zaoed/constants/colors.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          title: "الدعم", hasAction: true, showIcon: true),
      backgroundColor: AppColors().gray9,
      body: Column(
        children: [
          Divider(
            color: AppColors().gray6,
            thickness: 1,
          ),
          const MessageWidget(
              isMine: true, message: "أهلا بك في خدمة الدعم لزوِّد"),
          const Spacer(),
          ChatField(controller: chatController, toUserId: "toUserId")
        ],
      ),
    );
  }
}
