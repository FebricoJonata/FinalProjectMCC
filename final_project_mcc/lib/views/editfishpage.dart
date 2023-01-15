import 'dart:io';

import 'package:final_project_mcc/models/fish.dart';
import 'package:final_project_mcc/views/fishespage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import 'HomePage.dart';


/*

[] ambil data dari database pakai fishId -- variabel lain gausa di passing lg
[] hapus passing argumen yg ga perlu

save button - onpressed
[] validasi field keisi semua, simpen ke database

extra: pikirin cara nyimpen + nampilin gambar kalo upload dari web sama HP
soalnya beda tipe file + ngaruh ke page lain (fishespage, detailfish) - insertfish
dari asset project -> assetImage
dari HP -> FileImage -- path File - String
dari Web(Chrome) -> NetworkImage -- dapetnya URL
cara akalin (?) simpen tipe image di database -- upload dari web, hp, asset
*/


class EditFishPage extends StatefulWidget {
  // const EditFishPage({super.key, 
  //   required this.fish,
  //   required this.fishTypeId,
  //   // required this.fishName, 
  //   // required this.choosedFishType,
  //   // required this.fishPrice,
  //   // required this.fishDesc,
  //   // required this.pickedGalleryImage
  // });

  const EditFishPage(
      {Key? key, required this.fish, required this.fishTypeId}) 
      : super(key: key);

  final Fish fish;

  // final fishId;
  final int fishTypeId;
  // final int choosedFishType;
  // final fishName = "killi";
  // final fishPrice = "40000";
  // final fishDesc = "Killi Fish";
  // final pickedGalleryImage = 'assets/freshwater/killifish.jpg';

  @override
  State<EditFishPage> createState() => _EditFishPageState();
}

class _EditFishPageState extends State<EditFishPage> {

  List<DropdownMenuItem<int>> fishTypeOption = [
    DropdownMenuItem(child: Text("Freshwater"), value: 0,),
    DropdownMenuItem(child: Text("Saltwater"), value: 1,),
    DropdownMenuItem(child: Text("Deep Sea"), value: 2,)
  ];

  // String defaultImage = 'assets/fishtype/icon_ikan.png';

  String? newFishName;
  int? newChoosedFishType;
  int? newFishPrice;
  String? newFishDesc;
  File? newPickedGalleryImage;
  // String? imageFileType;

  //sebenernya cukup fishId biar data lain diambil lg dari database
  // get fishId => widget.fishId; //buat database
  get fishTypeId => widget.fishTypeId;
  // get fishName => widget.fishName;
  // get choosedFishType => widget.choosedFishType;
  // get fishPrice => widget.fishPrice;
  // get fishDesc => widget.fishDesc;
  // get pickedGalleryImage => widget.pickedGalleryImage;
  get fish => widget.fish;

  @override
  void initState() {
    // TODO: implement initState
    newFishName = fish.name;
    newChoosedFishType = fish.fish_type_id;
    newFishPrice = fish.price;
    newFishDesc = fish.description;
    super.initState();
  }

  Future PickGalleryImage() async {
      XFile? galleryImage;    
      try {
        galleryImage = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(galleryImage == null){
          return;
        }else{
          setState(() {
            newPickedGalleryImage = File(galleryImage!.path);
            // finalImage = pickedGalleryImage!.path;
          });
        }
      } on PlatformException{
        print('Unable to pick image');
      }
  }

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
            Navigator.pop(context)
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => FishesPage(fishTypeId: fishTypeId)),
            //     (route) => false)
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
                    image: newPickedGalleryImage == null?
                      DecorationImage(image: AssetImage(fish.image_path), fit: BoxFit.cover)
                      : kIsWeb? DecorationImage(image: NetworkImage(newPickedGalleryImage!.path), fit: BoxFit.cover)
                      : DecorationImage(image: FileImage(newPickedGalleryImage!), fit: BoxFit.cover)
                      // : DecorationImage(image: AssetImage(newPickedGalleryImage!.path), fit: BoxFit.cover) -- gabisa
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
                    maxLength: 50,
                    initialValue: fish.name,
                    onChanged: (value) => setState(() {
                      newFishName = value;
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
                    value: newChoosedFishType,
                    onChanged: (int? selectedValue){
                      if(selectedValue is int){
                        newChoosedFishType = selectedValue;
                      }
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
                    initialValue: fish.price.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() {
                      newFishPrice = int.parse(value);
                    }),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: "Rp.0,-",
                      labelText: "Fish Price"
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    initialValue: fish.description,
                    onChanged: (value) => setState(() {
                      newFishDesc = value;
                    }),
                    maxLines: 4,
                    maxLength: 50,
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
                      // print(pickedGalleryImage);
                      //validasi keisi semua, simpen ke database, navigasi ke homepage

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage())
                      );
                      showDialog(
                        context: context, 
                        builder: (_) => EditArticleAlertDialog()
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


class EditArticleAlertDialog extends StatelessWidget {
  const EditArticleAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Fish article edited succesfully ^^", textAlign: TextAlign.center,),
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