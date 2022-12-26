import 'dart:html';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:final_project_mcc/fishespage.dart';
import 'package:final_project_mcc/temppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';

/*
bedanya apa (?)
[] Back button to direct back to the Fish Page.
[] Button to navigate to the Fishes Page.

DetailFishPage
[] Button to navigate to the Edit Fish Page. Make sure that only the poster can see this button.
[] Button to delete the fish article. Make sure that only the poster can see this button.
*/

class DetailFishPage extends StatelessWidget {
  DetailFishPage({super.key, required this.fishTypeId, required this.imagesrc});

  int fishTypeId; //jenis ikan
  String imagesrc;
  //hilangin '?'
  String? fishId; //buat ambil data dari database
  String? fishName;
  String? fishPrice;
  String? fishDesc;
  String? creatorName;

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
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(15),
                height: 300,
                // child: Image(image: AssetImage(imagesrc), fit: BoxFit.cover,),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagesrc),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
              onTap: () => {showImageViewer(context, AssetImage(imagesrc))},
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'FishName',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
            ),
            Text(
              'Price',
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
              'FishDesc',
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
              'creatorName',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 122, 122, 122)),
            ),
          ],
        ),
      ),
      floatingActionButton: FabCircularMenu(
        children: [
          //edit
          IconButton(
            onPressed: () => {
              //navigasi ke edit page
              Navigator.push(context, MaterialPageRoute(builder: (context) => TempPage()))
            }, 
            icon: Icon(Icons.edit, color: Colors.grey[700], size: 30,)
          ),
          //delete
          IconButton(
            onPressed: () => {
              //delete data dari database & return ke FishesPage
              Navigator.push(context, MaterialPageRoute(builder: (context) => FishesPage(fishTypeId: fishTypeId)))
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
