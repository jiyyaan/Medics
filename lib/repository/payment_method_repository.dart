import 'package:medics/data/network/network_api_service.dart';
import 'package:medics/models/payment_method_model.dart';
import 'package:medics/res/app_urls/app_urls.dart';

class PaymentRepository {
  NetworkApiService networkApiService = NetworkApiService();


  Future<List<PaymentMethodModel>> fetchPaymentMethods() async {
    try {
      dynamic response =
      await networkApiService.getApiResponse(AppUrl.paymentMethod);
      return paymentMethodModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}