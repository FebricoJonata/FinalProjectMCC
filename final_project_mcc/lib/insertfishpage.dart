// import 'dart:html';
import 'dart:io';

import 'package:final_project_mcc/fishespage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import 'HomePage.dart';


// class InsertFishPage extends StatefulWidget {
//   const InsertFishPage({super.key, required this.fishTypeId});
//   final int fishTypeId;
  
//   @override
//   State<InsertFishPage> createState() => _InsertFishPageState();
// }

// class _InsertFishPageState extends State<InsertFishPage> {
  
//   // int fishTypeId;
//   String finalImage = 'assets/fishtype/icon_ikan.png';
//   File? pickedGalleryImage;
  
//   get fishTypeId => widget.fishTypeId;

//   Future PickGalleryImage() async {
//       XFile? galleryImage;    
//       try {
//         galleryImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//         if(galleryImage == null){
//           return;
//         }else{
//           setState(() {
//             pickedGalleryImage = File(galleryImage!.path);
//             // finalImage = pickedGalleryImage!.path;
//           });
//         }
//       } on PlatformException{
//         print('Unable to pick image');
//       }
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("New Fish"),
//         titleSpacing: 0,
//         actions: const [
//           //atur navigasi di homepage.dart
//           LogoutButtonAlert()
//         ],
//         leading: BackButton(
//           color: Colors.white,
//           onPressed: () => {
//             Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => FishesPage(fishTypeId: fishTypeId)),
//                 (route) => false)
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Container(
//               alignment: Alignment.center,
//               height: 200,
//               margin: const EdgeInsets.all(30),
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [  
//                   pickedGalleryImage == null? 
//                     Image(image: AssetImage(finalImage), fit: BoxFit.cover,)
//                     : Image(image: NetworkImage(pickedGalleryImage!.path), fit: BoxFit.cover,),
//                     // : Image.file(File(pickedGalleryImage!.path))
//                   Container(
//                     decoration: const BoxDecoration(
//                       color: Colors.blue,
//                       shape: BoxShape.circle
//                     ),
//                     child: IconButton(
//                       onPressed: () async{
//                         PickGalleryImage();
//                       }, 
//                       icon: const Icon(Icons.collections_rounded, color: Colors.white,),
//                     )
//                   ),
//                 ]
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class InsertFishPage extends StatelessWidget {
//   InsertFishPage({super.key, required this.fishTypeId});

//   int fishTypeId;
//   String finalImage = 'assets/fishtype/icon_ikan.png';
//   File? pickedGalleryImage;

//   Future PickGalleryImage() async {
//       XFile? galleryImage;    
//       try {
//         galleryImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//         if(galleryImage == null){
//           return;
//         }else{
//           setState(() {
//             pickedGalleryImage = File(galleryImage!.path);
//           });
//         }
//       } on PlatformException{
//         print('Unable to pick image');
//       }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("New Fish"),
//         titleSpacing: 0,
//         actions: const [
//           //atur navigasi di homepage.dart
//           LogoutButtonAlert()
//         ],
//         leading: BackButton(
//           color: Colors.white,
//           onPressed: () => {
//             Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => FishesPage(fishTypeId: fishTypeId)),
//                 (route) => false)
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(width: 20),
//           Container(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image(image: AssetImage(finalImage))
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               shape: BoxShape.circle
//             ),
//             child: IconButton(
//               onPressed: () async{
//                 PickGalleryImage();
//               }, 
//               icon: Icon(Icons.collections_rounded, color: Colors.white,),
//             )
//           ),
//           // Container(
//           //   decoration: BoxDecoration(
//           //     color: Colors.blue,
//           //     shape: BoxShape.circle
//           //   ),
//           //   child: IconButton(
//           //     onPressed: () async{
//           //       await newImage.pickImage(source: ImageSource.camera);
//           //       // await newImage.pickImage(source: ImageSource.camera);
//           //     }, 
//           //     icon: Icon(Icons.camera_alt_rounded, color: Colors.white,),
//           //   )
//           // )
//         ],
//       ),
//     );
//   }
// }