import 'package:ayamku_delivery/app/api/payment/payment_request.dart';
import 'package:ayamku_delivery/app/api/payment/payment_response.dart';
import 'package:dio/dio.dart';
import '../api_endpoint.dart';
import '../dio_instance.dart';

class PaymentService{
  final DioInstance _dioInstance = DioInstance();

  Future<PaymentResponse> payment(PaymentRequest request) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.payment,
        data: {
          "amount": request.amount,
          "payer_email": request.payerEmail,
          "user_id": request.userId,
          "cart_id": request.cartId,
          "posts_id": request.postsId,
          "method_type": request.methodType,
          "user_voucher_id": request.userVoucherId,
        },
        isAuthorize: true,
      );



      return PaymentResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}