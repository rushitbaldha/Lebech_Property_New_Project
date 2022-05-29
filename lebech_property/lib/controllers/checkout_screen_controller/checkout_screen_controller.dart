import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../screens/payment_success_screen/payment_success_screen.dart';


class CheckoutScreenController extends GetxController {
  /// From Buy Owner Number Module
  int id = Get.arguments[0] ?? 0;
  String img = Get.arguments[1] ?? "";
  String name = Get.arguments[2] ?? "";
  int price = Get.arguments[3] ?? 0;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  var razorpay = Razorpay();


  @override
  void onInit() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Get.off(()=> const PaymentSuccessScreen(),
    transition: Transition.zoom,);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

}