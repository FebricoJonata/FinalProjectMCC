
import 'dart:io';

import 'package:final_project_mcc/fishespage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'HomePage.dart';


/*
save button - onpressed
[] validasi field keisi semua, simpen ke database, navigasi ke fishespage? atau homepage aja ya

*/



class InsertFishPage extends StatefulWidget {
  const InsertFishPage({super.key, required this.fishTypeId});
  final int fishTypeId;
  
  @override
  State<InsertFishPage> createState() => _InsertFishPageState();
}

class _InsertFishPageState extends State<InsertFishPage> {
  
  List<DropdownMenuItem<int>> fishTypeOption = [
    // DropdownMenuItem(child: Text("  --"), value: -1,),
    DropdownMenuItem(child: Text("Freshwater"), value: 0,),
    DropdownMenuItem(child: Text("Saltwater"), value: 1,),
    DropdownMenuItem(child: Text("Deep Sea"), value: 2,)
  ];
  int choosedFishType = 0;
  String defaultImage = 'assets/fishtype/icon_ikan.png';
  File? pickedGalleryImage;

  String? fishName;
  String? fishPrice;
  String? fishDesc;
  
  get fishTypeId => widget.fishTypeId;

  Future PickGalleryImage() async {
      XFile? galleryImage;    
      try {
        galleryImage = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(galleryImage == null){
          return;
        }else{
          setState(() {
            pickedGalleryImage = File(galleryImage!.path);
            // finalImage = pickedGalleryImage!.path;
          });
        }
      } on PlatformException{
        print('Unable to pick image');
      }
  }

  // void dropDownCallBack(int? selectedValue){
  //   if(selectedValue is int){
  //       setState(() {
  //       choosedFishType = selectedValue;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("New Fish"),
        titleSpacing: 0,
        actions: const [
          //atur navigasi di homepage.dart
          LogoutButtonAlert()
        ],
        leading: BackButton(
          color: Colors.white,
          onPressed: () => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => FishesPage(fishTypeId: fishTypeId)),
                (route) => false)
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 250,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                    image: pickedGalleryImage == null?
                      DecorationImage(image: AssetImage(defaultImage), scale: 0.3)
                      : kIsWeb? DecorationImage(image: NetworkImage(pickedGalleryImage!.path), fit: BoxFit.cover)
                      : DecorationImage(image: FileImage(pickedGalleryImage!), fit: BoxFit.cover)
                      //kalo pake chrome filenya bentuk URL, kalo dari hp gambarnya bentuk file
                      //kIsWeb buat ngecek app nya dijalanin lewat web atau ga
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle
                  ),
                  child: IconButton(
                    onPressed: () async{
                      PickGalleryImage();
                    }, 
                    icon: const Icon(Icons.collections_rounded, color: Colors.white,),
                  )
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) => setState(() {
                      fishName = value;
                    }),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: "Input Fish Name Here",
                      labelText: "Fish Name"
                    ),
                  ),
                  SizedBox(height: 20,),
                  DropdownButtonFormField(
                    items: fishTypeOption, 
                    value: choosedFishType,
                    onChanged: (int? selectedValue){
                      setState(() {
                        if(selectedValue is int){
                          choosedFishType = selectedValue;
                        }
                      });
                    },
                    icon: Icon(Icons.expand_more_rounded),
                    // hint: Text("Choose Fish Type Here"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      labelText: "Fish Type",
                      hintText: "Choose Fish Type Here"
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() {
                      fishPrice = value;
                    }),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: "Rp.0,-",
                      labelText: "Fish Price"
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (value) => setState(() {
                      fishDesc = value;
                    }),
                    maxLines: 4,
                    maxLength: 150,
                    textAlignVertical: TextAlignVertical.top,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: "Input Description Here",
                      labelText: "Description",
                    ),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: () {
                      // print(fishName);
                      // print(choosedFishType);
                      // print(fishPrice);
                      // print(fishDesc);
                      //validasi keisi semua, simpen ke database, navigasi ke fishespage? atau homepage aja ya
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage())
                      );
                      showDialog(
                        context: context, 
                        builder: (_) => CreateArticleAlertDialog()
                      );
                    }, 
                    child: Text("Save",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)
                      ),
                      minimumSize: Size(100, 50)
                    ),
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class CreateArticleAlertDialog extends StatelessWidget {
  const CreateArticleAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("New fish article created succesfully ^^", textAlign: TextAlign.center,),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500
      ),
      content: Text("Tap anywhere outside this box to continue", textAlign: TextAlign.center,),
      contentTextStyle: const TextStyle(
        color: Colors.grey
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      // alignment: Alignment.center,
    );
  }
}


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