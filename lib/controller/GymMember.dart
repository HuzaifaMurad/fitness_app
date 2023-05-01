import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_king/modal/user.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GymMemberController extends GetxController {
  final Rx<List<GymUser>> member = Rx<List<GymUser>>([]);
  void addNewMember(GymUser user) {
    member.value.insert(
        0,
        GymUser(
          email: user.email,
          id: user.id,
          name: user.name,
          phone: user.phone,
          password: user.password,
        ));
  }

  Future<void> updateUser(String id) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(member.value[0].toMap())
        .then((value) {
      log('new user added');
    }).catchError((e) {
      log(e.toString());
      print('error uploading');
    });
  }
}
