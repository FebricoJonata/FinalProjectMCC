import 'dart:html';

import 'package:final_project_mcc/temppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';

/*
FishesPage
[ ] navigasi -> Floating action button ke InsertFishPage
--TabBarView
[ ] buat API biar bisa ngambil data banyak ikan per type (path gambar, nama ikan, harga ikan) -> simpan di 1 list

FishArticleList
[ ] navigasi -> on tap -> DetailFishPage with fish as its arguments
[ ] ubah nama dan harga sesuai data ikan
*/




class FishesPage extends StatelessWidget {
  FishesPage({super.key, required this.fishTypeId});

  int fishTypeId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: fishTypeId,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Fishes"),
          actions: const [          //atur navigasi di homepage.dart
           LogoutButtonAlert()
          ],
          leading: BackButton(
            color: Colors.white,
            onPressed: () => {
              Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(builder: (context) => const HomePage()), 
                (route) => false
                )
            },
          ),
          titleSpacing: 0,
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: Colors.white.withOpacity(0.5),
            ),
            indicatorPadding: EdgeInsets.all(6),
            tabs: [
              Tab(text: 'Freshwater',),
              Tab(text: 'Saltwater',),
              Tab(text: 'Deep Sea',)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //API buat ngambil data fish article (?)
            FishArticleList(fishTypeId: 0,),
            FishArticleList(fishTypeId: 1),
            FishArticleList(fishTypeId: 2),
          ]
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 5,
          child: Icon(Icons.add),
          onPressed: () => {
            Navigator.pushAndRemoveUntil(
              context,
              //ubah navigasi ke insert fish page !!! 
              MaterialPageRoute(builder: (context) => TempPage()), 
              (route) => false
            )
          }
        ),
      ),
    );
  }
}



class FishArticleList extends StatelessWidget {
  FishArticleList({super.key, this.fishTypeId});

  int? fishTypeId = 0;

  List<String> fishArticleSrc = [
    'assets/freshwater/bettablue.jpg',
    'assets/freshwater/killifish.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.separated(
        itemBuilder: (context, arcticleInd){
          return GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                //ubah navigasi ke Detail Fish Page with fish as its arguments !!! 
                MaterialPageRoute(builder: (context) => TempPage())
              )
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        child: Image(image: AssetImage(fishArticleSrc[arcticleInd]), fit: BoxFit.cover, width: double.infinity, height: double.infinity,),),
                      SizedBox(height: 5,),
                      Text(
                        //ubah sesuai nama ikan
                        'Fish Name',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700      
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        //ubah sesuai harga ikan
                        'Rp. Price',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey      
                        ),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
              ),
            ),
          );
        }, 
        separatorBuilder: (context, i) {
          return SizedBox(height: 15,);
        }, 
        itemCount: fishArticleSrc.length
      ),
    );
  }
}