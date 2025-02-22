import 'package:eshare/providers/api_provider.dart';

Future<Map<String, dynamic>> baseMethod(
    Map<String, dynamic> body, String endPoint) async {
  var response = await ApiProvider.post(
      endPoint: endPoint,
      headers: {
        "Content-Type": "application/json",
      },
      body: body);

  return response;
}
