import 'package:apilorning/src/model/login_model/smsModel.dart';
import 'package:apilorning/src/provider/api_provider.dart';
import 'package:flutter/material.dart';
import '../../model/http_result.dart';
import '../main_screen.dart';

class SmsCodeScreen extends StatefulWidget {
  final String mail;

  const SmsCodeScreen({Key? key, required this.mail}) : super(key: key);

  @override
  State<SmsCodeScreen> createState() => _SmsCodeScreenState();
}

class _SmsCodeScreenState extends State<SmsCodeScreen> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          GestureDetector(
            onTap: () async {
              HttpResult response = await ApiProvider().smsSent(
                widget.mail,
                messageController.text,
              );
              if (response.isSuccess) {
                SmsModel smsModel = SmsModel.fromJson(response.data);
                if (smsModel.status == 1) {
                  Navigator.push(
                    this.context,
                    MaterialPageRoute(builder: (context) {
                      return const MainScreen();
                    }),
                  );
                }
              }
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.only(
                top: 8,
                bottom: 0,
                left: 16,
                right: 16,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF40BFFF),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text(
                  'Sent',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
