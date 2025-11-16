import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../Model/doctor_model.dart';


class DoctorList extends StatefulWidget {
  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  late Future<List<Doctor>> _futureDoctors;

  @override
  void initState() {
    super.initState();
    _futureDoctors = fetchDoctors();
   }

  Future<List<Doctor>> fetchDoctors() async {
    final String baseUrl = dotenv.env['DOCTOR_URL'] ?? '';
    final Dio dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ));

    try {
      final response = await dio.get('/');

      if (response.statusCode == 200) {
        final info = Welcome.fromJson(response.data);
        return info.data.doctors;
      } else {
        throw Exception("Failed to load doctors");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
   // final String baseUrl = dotenv.env['DOCTOR_URL'] ?? '';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctors List"),
        backgroundColor: Colors.blue,
      ),

      body: FutureBuilder<List<Doctor>>(
        future: _futureDoctors,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No doctors found"));
          } else {
            final doctors = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  elevation: 3,
                  child: ListTile(
                    leading: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: CachedNetworkImage(
                        imageUrl: doctor.profilePic,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    title: Text(doctor.name),
                    subtitle: Text("${doctor.specialty.title}\n${doctor.workingAt}"),
                    //isThreeLine: true,
                    trailing: Text("${doctor.fee}৳"),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
