import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/Doctor_List_View/Controller/doctor_controller.dart';

import '../Model/doctor_model.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {

   final DoctorController controller = Get.put(DoctorController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctors List"),
        backgroundColor: Colors.blue,
      ),
      body: _buildBody(controller),
    );
  }

  Widget _buildBody(controller) {
    // Initial loading state
    return Obx((){
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      // if ( controller.isEmpty) {
      //   return Center(
      //     child: Padding(
      //       padding: const EdgeInsets.all(24),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           const Icon(
      //             Icons.error_outline,
      //             size: 80,
      //             color: Colors.red,
      //           ),
      //           const SizedBox(height: 16),
      //           Text(
      //             'Oops! Something went wrong',
      //             style: const TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           const SizedBox(height: 24),
      //           ElevatedButton.icon(
      //             onPressed: controller.retryLoading,
      //             icon: const Icon(Icons.refresh),
      //             label: const Text('Retry'),
      //             style: ElevatedButton.styleFrom(
      //               backgroundColor: Colors.blue,
      //               padding: const EdgeInsets.symmetric(
      //                 horizontal: 32,
      //                 vertical: 12,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   );
      // }

      // STATE 3: Success - Show data
      return  Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.refreshData,
              child: ListView.builder(
                shrinkWrap: true,
                controller: controller.scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: controller.doctors.length,
                itemBuilder: (context, index) {
                  // Last item: Loading indicator
                  // if (index == controller.doctors.length) {
                  //   return _buildBottomLoader(controller);
                  // }
                  final doctor = controller.doctors[index];
                  return _buildDoctorCard(doctor, index);
                },
              ),
            ),
          ),
          controller.isLoadingMore.value == true
              ? CircularProgressIndicator()
              : SizedBox.shrink()
        ],
      );
    });
  }

  Widget _buildDoctorCard(Doctor doctor, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey[300],
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: doctor.profilePic,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(strokeWidth: 2),
              errorWidget: (context, url, error) => const Icon(Icons.person, size: 30),
            ),
          ),
        ),
        title: Text(
          doctor.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.specialty.title,
              style: TextStyle(color: Colors.blue[700], fontSize: 13),
            ),
            const SizedBox(height: 2),
            Text(
              doctor.workingAt,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.work_outline, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  "${doctor.experience} years exp",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "৳${doctor.fee}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${doctor.patientChecked} patients",
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
        isThreeLine: true,
        onTap: () {
        },
      ),
    );
  }

  // Widget _buildBottomLoader(DoctorController controller) {
  //   return Obx(() {
  //     // Case 1: Loading more data
  //     if (controller.isLoadingMore.value) {
  //       return const Padding(
  //         padding: EdgeInsets.all(16),
  //         child: Center(
  //           child: CircularProgressIndicator(),
  //         ),
  //       );
  //     }
  //
  //     // Case 2: No more data available
  //     if (!controller.canLoadMore) {
  //       return Padding(
  //         padding: const EdgeInsets.all(16),
  //         child: Center(
  //           child: Column(
  //             children: [
  //               const Icon(
  //                 Icons.check_circle,
  //                 color: Colors.green,
  //                 size: 32,
  //               ),
  //
  //             ],
  //           ),
  //         ),
  //       );
  //     }
  //
  //     // Case 3: Can load more but not loading yet
  //     return const SizedBox.shrink();
  //   });
  // }
}