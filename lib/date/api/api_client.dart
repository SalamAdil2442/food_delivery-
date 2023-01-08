import 'package:get/get.dart';
import 'package:resturants_test/unit/app_constents.dart';

class Apiclient extends GetConnect implements GetxService {
  late String token;
  late String appbaseurl;

  late Map<String, String> _mapheader;
  Apiclient({required this.appbaseurl}) {
    baseUrl = appbaseurl;
    timeout = Duration(seconds: 30);
    token = Appconstants.Token;
    _mapheader = {
      "Content-type": "application/json; charst=UTF-8",
      "authorization": "Bearer $token "
    };
  }
  Future<Response> getdate(
    String Url,
  ) async {
    try {
      Response response = await get(Url);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
