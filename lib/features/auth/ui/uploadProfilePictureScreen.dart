// import 'dart:io';

// import 'package:dayzoff/features/constants/constants.dart';
// import 'package:dayzoff/features/utils/utils.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UploadImageScreen extends StatefulWidget {
//   const UploadImageScreen({super.key});

//   @override
//   State<UploadImageScreen> createState() => _UploadImageScreenState();
// }

// class _UploadImageScreenState extends State<UploadImageScreen> {
//   bool loading = false;

//   File? _image;

//   final picker = ImagePicker();

//   firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;
//   DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Post');
//   Future getGalleryImage() async {
//     final pickedFile =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         Utils().errorMessage('No Image Picked',context);
//       }
//     });
//   }

//   File? getImage(){
//     return _image;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: InkWell(
//         onTap: () {
//           getGalleryImage();
//         },
//         child: CircleAvatar(
//           radius: 30,
//           backgroundColor: Colors.transparent,
          
//           // decoration: BoxDecoration(
//           //     border: Border.all(
//           //   color: Colors.black,
//           // )),
//           child: _image != null
//               ? 
//                 Center(child: Container(
//                 height: 60,
//                 width: 60,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   border: Border.all(
//                     color: orangeColor,
//                   )
//                 ),
//                 child: CircleAvatar(
//                   backgroundImage: FileImage(File(_image!.absolute.path))),
//                 ))
//               :  Center(child: Container(
//                 height: 60,
//                 width: 60,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   border: Border.all(
//                     color: orangeColor,
//                   )
//                 ),
//                 child: const Icon(Icons.image))),
//         ),
//       ),
//     );
//   }
// }

// //pod update Firebase/Storage


// // RoundButton(
//             //     title: 'Upload',
//             //     loading: loading,
//             //     onTap: () async {
//             //       setState(() {
//             //         loading = true;
//             //       });
//             //       firebase_storage.Reference ref =
//             //           firebase_storage.FirebaseStorage.instance.ref('/yousuf/' +
//             //               DateTime.now().millisecondsSinceEpoch.toString());
//             //       firebase_storage.UploadTask uploadTask =
//             //           ref.putFile(_image!.absolute);

//             //       Future.value(uploadTask).then((value) async {
//             //         var newUrl = await ref.getDownloadURL();

//             //         String id =
//             //             DateTime.now().microsecondsSinceEpoch.toString();

//             //         databaseRef.child(id).set(
//             //             {'id': id, 'Data': newUrl.toString()}).then((value) {
//             //           setState(() {
//             //             loading = false;
//             //           });
//             //           Utils().sucesstoastMessage("$newUrl uploaded");
//             //         }).onError((error, stackTrace) {
//             //           setState(() {
//             //             loading = false;
//             //           });
//             //         });
//             //       }).onError((error, stackTrace) {
//             //         Utils().toastMessage(error.toString());
//             //       });
//             //     })