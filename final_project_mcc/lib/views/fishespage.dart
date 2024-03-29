import 'package:final_project_mcc/models/fish.dart';
import 'package:final_project_mcc/views/detailfishpage.dart';
import 'package:final_project_mcc/views/insertfishpage.dart';
import 'package:flutter/material.dart';

import 'package:final_project_mcc/views/HomePage.dart';

/*
FishesPage
[v] navigasi -> Floating action button ke InsertFishPage
--TabBarView
[ ] buat API biar bisa ngambil data banyak ikan per type (path gambar, nama ikan, harga ikan) -> simpan di 1 list
[ ] cek perlu bikin class beda per type atau cukup 1 aja

FishArticleList
[v?] navigasi -> on tap -> DetailFishPage with fish as its arguments + fishtypeid -> buat backbutton di detailfishpage
[ ] hapus passing argumen yg ga perlu - nunggu edit dari detailfishpage
[v] ubah nama dan harga sesuai variabel data ikan
*/

class FishesPage extends StatelessWidget {
  FishesPage({
    super.key,
    required this.fishTypeId,
  });

  int fishTypeId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: fishTypeId,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Fishes"),
          actions: const [
            //atur navigasi di homepage.dart
            LogoutButtonAlert()
          ],
          leading: BackButton(
            color: Colors.white,
            onPressed: () => {
              // Navigator.pop(context)
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false)
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
              Tab(
                text: 'Freshwater',
              ),
              Tab(
                text: 'Saltwater',
              ),
              Tab(
                text: 'Deep Sea',
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          //API buat ngambil data fish article (?)
          FishArticleList(
            fishTypeId: 0,
          ),
          FishArticleList(
            fishTypeId: 1,
          ),
          FishArticleList(
            fishTypeId: 2,
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            elevation: 5,
            child: Icon(Icons.add),
            onPressed: () => {
                  Navigator.pushAndRemoveUntil(
                      context,
                      //ubah navigasi ke insert fish page !!!
                      MaterialPageRoute(
                          builder: (context) => InsertFishPage(
                                fishTypeId: fishTypeId,
                              )),
                      (route) => false)
                }),
      ),
    );
  }
}

class FishArticleList extends StatelessWidget {
  FishArticleList({super.key, required this.fishTypeId});

  int fishTypeId;

  // List<String> fishArticleSrc = [
  //   'assets/freshwater/bettablue.jpg',
  //   'assets/freshwater/killifish.jpg'
  // ];

  // String fishName = "Killi";
  // String fishPrice = "4.000";

  List<Fish> fishArticleSrc = [
    Fish(id: 0, user_id: 12345, fish_type_id: 0, name: 'Killi', description: 'A fish', price: 20000, image_path: 'assets/freshwater/killifish.jpg'),
    Fish(id: 0, user_id: 12345, fish_type_id: 0, name: 'Betta', description: 'A Blue fish', price: 40000, image_path: 'assets/freshwater/bettablue.jpg')
  ];


  @override
  Widget build(BuildContext context) {

    var fishByTypeId = fishArticleSrc.where((fish)=>fish.fish_type_id == fishTypeId);

    if(fishByTypeId.isEmpty){
      return Center(
        child: Container(
          child: Text("Fish not Available :)"),
        ),
      );
    }else{
      return Container(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
            itemBuilder: (context, arcticleInd) {
                return GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        //ubah navigasi ke Detail Fish Page with fish as its arguments !!!
                        MaterialPageRoute(
                            builder: (context) => DetailFishPage(
                                  selectedFish: fishArticleSrc[arcticleInd],
                                  fishTypeId: fishTypeId,
                                  // imagesrc: fishArticleSrc[arcticleInd].image_path,
                                  // fishName: fishName,
                                  // fishPrice: fishPrice,
                                )))
                  },
                  child: Card(
                    margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150,
                              padding: EdgeInsets.zero,
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage(fishArticleSrc[arcticleInd].image_path),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              //ubah sesuai nama ikan
                              '${fishArticleSrc[arcticleInd].name}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              //ubah sesuai harga ikan
                              'Rp.${fishArticleSrc[arcticleInd].price}',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 92, 92, 92)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );   
            },
            separatorBuilder: (context, i) {
              return SizedBox(
                height: 15,
              );
            },
            itemCount: fishArticleSrc.length),
      );
    }
  }
}
