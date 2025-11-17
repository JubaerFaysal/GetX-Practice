import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../Model/doctor_model.dart';

class DoctorService{
  final String baseUrl=dotenv.env['DOCTOR_URL'] ?? '';

  Future<Welcome> fetchDoctors({
    required int page,
    required int size
  }) async {
    final Dio dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ));

    try {
      // Add pagination parameters to API call
      final response = await dio.get(
        '/',
        queryParameters: {
          'page': page,
          'size': size,
        },
      );

      if (response.statusCode == 200) {
        return Welcome.fromJson(response.data);
      } else {
        throw Exception("Failed to load doctors: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Network error: ${e.message}");
    }
  }
}