import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/pref_keys.dart';
import '../../routes/app_pages.dart';

class NetworkService {
  // static final Dio dio = Dio();

  // static Future<Map<String, dynamic>> makeGetRequest({
  //   required String url,
  //   Map<String, String>? headers,
  // }) async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString(PrefConstantsKey.token);
  //     debugPrint("token == $token");
  //     debugPrint("url == $url");
  //     headers ??= {
  //       'Authorization': 'Bearer ${token ?? ""}',
  //     };
  //     print("headers $headers");
  //     Response response = await dio.get(
  //       url,
  //       options: Options(
  //         headers: headers,
  //       ),
  //     );
  //     print('Response data: ${response.data}');
  //     print("response.headers ${response.headers}");
  //     // print("response.requestOptions.path ${response.requestOptions.path}");
  //     return {
  //       'response': response.data,
  //       'statusCode': response.statusCode,
  //     };
  //   } on DioException catch (e) {
  //     if (e.response != null && e.response!.statusCode == 404) {
  //       print("e.response!.data ${e.response!.data}");
  //       return {
  //         'response': '${e.response!.data['message'][0]}',
  //         'statusCode': 404,
  //       };
  //     }  else {
  //       // Handle other DioException errors
  //       print('DioException occurred: ${e.message}');
  //       print('Status code: ${e.response?.statusCode}');
  //       return {
  //         'response': e.message,
  //         'statusCode': e.response?.statusCode ?? 500,
  //       };
  //     }
  //   }
  // }

  static Future<Map<String, dynamic>> makeGetRequest({
    required String url,
    Map<String, String>? headers,
  }) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    print("connectivityResult $connectivityResult");
    if (connectivityResult[0] == ConnectivityResult.none) {
      Get.toNamed(Routes.NOINTERNET);
      return {
        'response': "",
        'statusCode': 500,
      };
    }
    else{
      try {

        final dio.Dio mDio = dio.Dio();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = prefs.getString(PrefConstantsKey.token) ?? "";

        debugPrint("token == $token");
        debugPrint("url == $url");

        final baseOption = dio.BaseOptions(
          connectTimeout: const Duration(minutes: 10),
          receiveTimeout: const Duration(minutes: 10),
          baseUrl: url,
          contentType: 'application/json',
          headers: {
            'authorization': token != ""
                ? "bearer $token"
            // ? "bearer eJZypMLyI96reBo8pVttiq3HtEEHlmL1"
                : null,
          },
        );
        mDio.options = baseOption;
        // Fetch the token from SharedPreferences
        dio.Response response = await mDio.get(
          url,
        );
        print('Response statusCode: ${response.statusCode}');
        return {
          'response': response.data as Map<String, dynamic>,
          'statusCode': response.statusCode,
        };
      } on dio.DioException catch (e) {
        if (e.response != null && e.response!.statusCode == 404) {
          print("e.response!.data ${e.response!.data}");
          return {
            'response': '${e.response!.data['message'][0]}',
            'statusCode': 404,
          };
        } else {
          // Handle other DioException errors
          print('DioException occurred: ${e.message}');
          print('Status code: ${e.response?.statusCode}');
          return {
            'response': e.message,
            'statusCode': e.response?.statusCode ?? 500,
          };
        }
      }
    }
  }

  static Future<Map<String, dynamic>> makePostRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult[0] == ConnectivityResult.none) {
      Get.toNamed(Routes.NOINTERNET);
      return {
        'response': "",
        'statusCode': "",
      };
    }
    else{
      try {
        final dio.Dio x = dio.Dio();
        dio.FormData formData = dio.FormData.fromMap(body ?? {});
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString(PrefConstantsKey.token);
        debugPrint("token == $token");

        headers ??= {
          'authorization': "bearer ${token ?? ""}",
        };
        debugPrint("headers == $headers");

        dio.Response response = await x.post(
          url,
          data: formData,
          options: dio.Options(
            headers: headers,
          ),
        );
        return {
          'response': response.data,
          'statusCode': response.statusCode,
        };
      } on dio.DioException catch (e) {
        if (e.response != null && e.response!.statusCode == 404) {
          print("e.response!.data ${e.response!.data}");
          return {
            'response': '${e.response!.data['message'][0]}',
            'statusCode': 404,
          };
        }  else {
          // Handle other DioException errors
          print('DioException occurred: ${e.message}');
          print('Status code: ${e.response?.statusCode}');
          return {
            'response': e.message,
            'statusCode': e.response?.statusCode ?? 500,
          };
        }
      }
    }

  }

  static Future<Map<String, dynamic>> makeMultipartPostRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? fields,
    List<Map<String, dynamic>>? files,
  }) async {
    try {
      final dio.Dio mDio = dio.Dio();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(PrefConstantsKey.token);
      debugPrint("token == $token");
      debugPrint("url == $url");

      headers ??= {
        'Authorization': "Bearer ${token ?? ""}",
      };

      dio.FormData formData = dio.FormData();
      print("file $files");

      if (fields != null) {
        if(fields.isNotEmpty){
          fields.forEach((key, value) {
            formData.fields.add(MapEntry(key, value.toString()));
          });
        }
      }
      print("fields $fields");

      if (files != null) {
        if(files.isNotEmpty){
          for (var file in files) {
            formData.files.add(MapEntry(
              file['name'],
              dio.MultipartFile.fromFileSync(
                file['filePath'],
                filename: file['fileName'],
              ),
            ));
          }
        }
      }

      dio.Response response = await mDio.post(
        url,
        data: formData,
        options: dio.Options(headers: headers),
      );
      print(response.data);
      return {
        'response': response.data,
        'statusCode': response.statusCode,
      };

    } on dio.DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 404) {
        print("e.response!.data ${e.response!.data}");
        return {
          'response': '${e.response!.data['message'][0]}',
          'statusCode': 404,
        };
      } else {
        print('DioException occurred: ${e.message}');
        print('Status code: ${e.response?.statusCode}');
        return {
          'response': e.message,
          'statusCode': e.response?.statusCode ?? 500,
        };
      }
    }
  }

}