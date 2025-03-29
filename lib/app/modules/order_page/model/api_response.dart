import 'result_model.dart';

class ApiResponse {
  final OrderResult result;
  final String message;
  final bool status;

  ApiResponse({
    required this.result,
    required this.message,
    required this.status,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      result: json['result'] != null
          ? OrderResult.fromJson(json['result'])
          : OrderResult(orders: [], orderTotal: ''),
      message: json['message'] ?? '',
      status: json['status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result.toJson(),
      'message': message,
      'status': status,
    };
  }
}
