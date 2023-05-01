import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness_king/controller/GymMember.dart';
import 'package:fitness_king/view/screen/exercise.dart';
import 'package:fitness_king/view/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Payment extends StatefulWidget {
  Payment({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final ImagePicker _picker = ImagePicker();
  GymMemberController members = Get.find();

  File? _image;

  Future<List<XFile?>> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
    bool multiple = false,
  }) async {
    if (multiple) {
      return await _picker.pickMultiImage(imageQuality: imageQuality);
    }
    final file =
        await _picker.pickImage(source: source, imageQuality: imageQuality);
    if (file != null) {
      return [file];
    }
    throw 'no image uploaded';
  }

  late List<XFile?> img;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            'Add a Transcation to become a KING',
            softWrap: true,
            style:
                GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        paymentOption('images/easypaisa.png', '03xx-1234567'),
        paymentOption('images/jazz.png', '03xx-213456'),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            'Upload Payment Screenshot',
            softWrap: true,
            style:
                GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            child: _image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ),
                  )
                : null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 280),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () async {
              img = await pickImage();
              setState(() {
                _image = File(img.first!.path);
              });
            },
            child: const Text('upload'),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: (() {
                widget.tabController.animateTo(widget.tabController.index - 1);
              }),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Expanded(
              child: StepProgressIndicator(
                totalSteps: 3,
                currentStep: 3,
                size: 8,
                padding: 0,
                selectedColor: Colors.yellow,
                unselectedColor: Colors.cyan,
                roundedEdges: Radius.circular(10),
                selectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.yellowAccent, Colors.deepOrange],
                ),
                unselectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black, Colors.blue],
                ),
              ),
            ),
            IconButton(
              onPressed: (() async {
                final file = File(img.first!.path);
                final path = 'files/${img.first!.name}';
                final ref = FirebaseStorage.instance.ref().child(path);
                UploadTask uploadTask = ref.putFile(file);
                final snapshot = await uploadTask.whenComplete(() {
                  log('uploaded');
                });
                final urldownload = await snapshot.ref.getDownloadURL();
                print('download link : $urldownload');
                members.member.value.first.imgUrl = urldownload;

                if (_image != null) {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: members.member.value.first.email!,
                      password: members.member.value.first.password!);
                  final user = FirebaseAuth.instance.currentUser;
                  members.member.value.first.id = user!.uid;
                  log(user.uid);
                  await members.updateUser(user.uid);
                  Get.snackbar(
                    "Dear User,",
                    "payment is being verified You will be informed shortly",
                    icon: const Icon(Icons.add_alert, color: Colors.white),
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.green,
                    borderRadius: 20,
                    margin: const EdgeInsets.all(15),
                    colorText: Colors.white,
                    duration: const Duration(seconds: 3),
                    isDismissible: true,
                    dismissDirection: DismissDirection.horizontal,
                    forwardAnimationCurve: Curves.easeOutBack,
                  );
                  Future.delayed(
                    Duration(seconds: 2),
                    () {
                      Get.to(() => ExerciseScreen());
                    },
                  );
                } else {
                  Get.snackbar(
                    'Dear User',
                    'Upload the payment screenshot',
                    snackPosition: SnackPosition.TOP,
                    icon: const Icon(
                      Icons.warning_amber,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.green,
                    borderRadius: 20,
                    margin: const EdgeInsets.all(15),
                    colorText: Colors.white,
                    duration: const Duration(seconds: 3),
                    isDismissible: true,
                    dismissDirection: DismissDirection.horizontal,
                    forwardAnimationCurve: Curves.easeOutBack,
                  );
                }
              }),
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        )
      ],
    );
  }

  Padding paymentOption(String img, String title) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              img,
            ),
            backgroundColor: Colors.white,
            radius: 30,
          ),
          Text(
            title,
            softWrap: true,
            style:
                GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
