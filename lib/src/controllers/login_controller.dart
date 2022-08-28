import 'package:faizanks/src/ui/common/button_widget/custom_button.dart';
import 'package:faizanks/src/utils/color_constant.dart';
import 'package:faizanks/src/utils/navigate_service/navigator_key.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString phoneNumber = ''.obs;
  RxString verificationId = ''.obs;
  RxString otp = ''.obs;
  RxString authStatus = ''.obs;
  RxBool isLoading = false.obs;

  //verifyPhoneNumber function is use for verify mobile number which we get from user and set result based on it.
  Future<void> verifyPhoneNumber() async {
    isLoading.value = true;
    update();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      timeout: const Duration(seconds: 120),
      verificationCompleted: (AuthCredential authCredential) {
        authStatus.value = "Your account is successfully verified";
        isLoading.value = false;
        update();
      },
      verificationFailed: (FirebaseAuthException authException) {
        authStatus.value = "Authentication failed";
        isLoading.value = false;
        update();
      },
      codeSent: (String? verId, [int? forceCodeResent]) {
        verificationId.value = verId ?? '';
        authStatus.value = "OTP has been successfully send";
        //open dialog id otp send successfully
        isLoading.value = false;
        update();
        otpDialogBox();
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId.value = verId;

        authStatus.value = "TIMEOUT";
      },
    );
  }

  //signIn is using for signup
  Future<void> signIn(String otp) async {
    isLoading.value = true;
    update();
    await FirebaseAuth.instance.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      ),
    );
    isLoading.value = false;
    update();
  }

  //dialog which is open if otp is send
  otpDialogBox() {
    return showDialog(
      context: NavigatorKey.context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter your OTP'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              maxLength: 6,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              onChanged: (value) {
                otp.value = value;
              },
            ),
          ),
          contentPadding: const EdgeInsets.all(10.0),
          actions: <Widget>[
            CustomButtonWidget(
              text: 'Submit OTP',
              bgColor: ColorConstant.buttonColor,
              onPressed: () {
                Navigator.of(context).pop();
                signIn(otp.value);
              },
            ),
          ],
        );
      },
    );
  }
}
