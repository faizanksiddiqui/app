import 'package:flutter/material.dart';
import 'package:faizanks/src/controllers/login_controller.dart';
import 'package:faizanks/src/ui/common/button_widget/custom_button.dart';
import 'package:faizanks/src/utils/color_constant.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      autoRemove: false,
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(
          body: SingleChildScrollView(
            //column is use for vertical design
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  // Text is use to display text and lable
                  const Text(
                    "Login",
                    style: TextStyle(
                      color: ColorConstant.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    //TextField is use for enter mobile number from user
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          filled: true,
                          //display icon
                          prefixIcon: Icon(
                            Icons.phone_iphone,
                            color: Colors.greenAccent,
                          ),
                          hintStyle: TextStyle(color: ColorConstant.grey8),
                          hintText: "Enter Your Phone Number...",
                          fillColor: Colors.white70),
                      onChanged: (value) {
                        controller.phoneNumber.value = value;
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  CustomButtonWidget(
                    text: 'Generate OTP',
                    bgColor: ColorConstant.buttonColor,
                    onPressed: () => controller.phoneNumber.value == null ? null : controller.verifyPhoneNumber(),
                  ),
                  const SizedBox(height: 20),
                  Text("Need Help?"),
                  const SizedBox(height: 20),
                  const Text(
                    "Please enter the phone number followed by country code",
                    style: TextStyle(color: Colors.green),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    controller.authStatus.value == '' ? "" : controller.authStatus.value,
                    style: TextStyle(
                        color: controller.authStatus.value.contains("fail") ||
                                controller.authStatus.value.contains("TIMEOUT")
                            ? Colors.red
                            : Colors.green),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
