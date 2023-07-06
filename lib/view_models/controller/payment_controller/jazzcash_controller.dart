
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:medics/utils/utils.dart';

class JazzCashController extends GetxController {
  var responsePrice;
  Rx<bool> isLoading = false.obs;

  payWithJazzCash(String amount) async {
    isLoading.value = true;
    String dateAndTime = DateFormat("yyyyMMddHHmmss").format(DateTime.now());
    String dExpireDate = DateFormat("yyyyMMddHHmmss").format(
        DateTime.now().add(const Duration(days: 1)));
    String tre = "T$dateAndTime";
    String ppAmount = amount; // price set
    String ppBillReference = "billRef";
    String ppDescription = "Description for transaction";
    String ppLanguage = "EN";
    String ppMerchantId = "MC58295";
    String ppPassword = "txuvsawswz";

    String ppReturnUrl = "https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction";
    String ppVer = "1.1";
    String ppTxnCurrency = "PKR";
    String ppTxnDateTime = dateAndTime.toString();
    String ppTxnExpiryDateTime = dExpireDate.toString();
    String ppTxnRefNo = tre.toString();
    String ppTxnType = "MWALLET";
    String ppmpf_1 = "4456733833993";
    String integeritySalt = "axt80a88u8";
    String and = '&';
    String superData =
        integeritySalt + and +
            ppAmount + and +
            ppBillReference + and +
            ppDescription + and +
            ppLanguage + and +
            ppMerchantId + and +
            ppPassword + and +
            ppReturnUrl + and +
            ppTxnCurrency + and +
            ppTxnDateTime + and +
            ppTxnExpiryDateTime + and +
            ppTxnRefNo + and +
            ppTxnType + and +
            ppVer + and +
            ppmpf_1
    ;


    var key = utf8.encode(integeritySalt);
    var bytes = utf8.encode(superData);
    var hmacSha256 = Hmac(sha256, key);
    Digest sha256Result = hmacSha256.convert(bytes);
    String url = 'https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction';

    var response = await http.post(Uri.parse(url),
        body: {
          "pp_Version": ppVer,
          "pp_TxnType": ppTxnType,
          "pp_Language": ppLanguage,
          "pp_MerchantID": ppMerchantId,
          "pp_Password": ppPassword,
          "pp_TxnRefNo": tre,
          "pp_Amount": ppAmount,
          "pp_TxnCurrency": ppTxnCurrency,
          "pp_TxnDateTime": dateAndTime,
          "pp_BillReference": ppBillReference,
          "pp_Description": ppDescription,
          "pp_TxnExpiryDateTime": dExpireDate,
          "pp_ReturnURL": ppReturnUrl,
          "pp_SecureHash": sha256Result.toString(),
          "ppmpf_1": "4456733833993"
        });

    if (kDebugMode) {
      print("response=>");
    }
    if (kDebugMode) {
      print(response.body);
    }
    var res = response.body;
    var body = jsonDecode(res);
    responsePrice = body['pp_Amount'];
    Utils.toastMessage("payment successfully $responsePrice");
    isLoading.value = false;
  }

}