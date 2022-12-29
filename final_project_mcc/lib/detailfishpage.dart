
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:final_project_mcc/editfishpage.dart';
import 'package:final_project_mcc/fishespage.dart';
import 'package:final_project_mcc/temppage.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

/*
bedanya apa (?)
[v] Back button to direct back to the Fish Page.
[] Button to navigate to the Fishes Page.

DetailFishPage
[] Button to navigate to the Edit Fish Page. Make sure that only the poster can see this button.
[] Button to delete the fish article. Make sure that only the poster can see this button.
[] Buat API untuk delete
[v] ubah nama, harga, desc, pakai variabel
[] hapus passing argumen yg ga perlu, cukup fishId 
*/

class DetailFishPage extends StatelessWidget {
  DetailFishPage({super.key, 
    required this.fishTypeId, 
    required this.imagesrc,
    required this.fishName,
    required this.fishPrice,
  });

  int fishTypeId; //jenis ikan
  String imagesrc;
  List <String> detailBackImgsrc = [
    'assets/fishtype/freshwater.jpg',
    'assets/fishtype/saltwater.jpg',
    'assets/fishtype/deepsea.jpg'
  ];

  //hilangin '?'
  String? fishId = "F001"; //buat ambil data dari database
  String fishName;
  String fishPrice; //nanti ambilnya lewat database aja pakai fishId, daripada kebanyakan passing argument
  String? fishDesc = "Freshwater fish";
  String? creatorName = "Siapa Ya?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
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
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(detailBackImgsrc[fishTypeId]), fit: BoxFit.cover),
                  ),
                  height: 210,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 200,),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(height: 50,),
                GestureDetector(
                  child: Container(
                    // padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    height: 250,
                    // child: Image(image: AssetImage(imagesrc), fit: BoxFit.cover,),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagesrc),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onTap: () => {showImageViewer(context, AssetImage(imagesrc))},
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  //ubah sesuai data
                  '${fishName}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                ),
                Text(
                  //ubah sesuai data
                  'Rp.${fishPrice},-',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 92, 92, 92)),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Description',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  //ubah sesuai data
                  '${fishDesc}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 122, 122, 122)),
                ),
                Text(
                  'Created By',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  //ubah sesuai data
                  '${creatorName}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 122, 122, 122)),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ]
        ),
      ),
      floatingActionButton: FabCircularMenu(
        children: [
          //edit
          IconButton(
            onPressed: () => {
              //navigasi ke edit page
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditFishPage(
                fishId: fishId,
                fishTypeId: fishTypeId, 
                fishName: fishName, 
                choosedFishType: 2, 
                fishPrice: fishPrice, 
                fishDesc: fishDesc, 
                pickedGalleryImage: imagesrc
                )))
            }, 
            icon: Icon(Icons.edit, color: Colors.grey[700], size: 30,)
          ),
          //delete
          IconButton(
            onPressed: () => {
              //delete data dari database & return ke FishesPage
              Navigator.push(context, MaterialPageRoute(builder: (context) => FishesPage(fishTypeId: fishTypeId,)))
            }, 
            icon: Icon(Icons.delete_forever_rounded, color: Colors.red[700], size: 30,)
          )
        ],
        ringColor: Colors.white.withOpacity(0),
        ringDiameter: 250,
        ringWidth: 70,
        fabOpenIcon: Icon(Icons.more_horiz, color: Colors.white,),
        fabCloseIcon: Icon(Icons.close_rounded, color: Colors.white,),
        fabMargin: EdgeInsets.all(20),
      )
    );
  }
}
