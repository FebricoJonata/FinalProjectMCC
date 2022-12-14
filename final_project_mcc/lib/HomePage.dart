import 'dart:html';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project_mcc/icon_fish_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.logout_outlined),
            ),
          )
        ],
        leading: Icon(Icons.home),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ImgCarousel(),
          AboutCompany(),
          ListTile(
            title: Text('Fishes',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          // Flexible(
          //   child: FishTypeGrid(),
          // ),
          FishTypeGrid(),
        ],
      ),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}


List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}


class ImgCarousel extends StatefulWidget {
  const ImgCarousel({Key? key}) : super(key: key);

  @override
  State<ImgCarousel> createState() => _ImgCarouselState();
}

class _ImgCarouselState extends State<ImgCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List<String> fishImg = [
      '../asset/ikan_betta.jpeg',
      '../asset/ikan_cupang.jpeg',
      '../asset/ikan_guppy.jpeg',
      '../asset/ikan_koi.jpeg',
      '../asset/ikan_mas.jpeg',
      '../asset/ikan_siamese.jpeg'
    ];

    return Container(
      child: Column(
        children: [
          CarouselSlider(
            items: fishImg.map((src) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: AssetImage(src), 
                        fit: BoxFit.cover
                      )
                  ),
                );
              });
            }).toList(),
            options: CarouselOptions(
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              aspectRatio: 2,
              viewportFraction: 0.8,
              height: MediaQuery.of(context).size.height/4.5,
              autoPlay: true,
              // clipBehavior: Clip.nones,
              onPageChanged: (ind, _){
                setState(() {
                  _current = ind;
                });
              }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(
              fishImg,
                  (index, url) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromARGB(228, 62, 113, 255)
                          : Color.fromRGBO(0, 0, 0, 0.4)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}


class AboutCompany extends StatelessWidget {
  const AboutCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'About Us',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      contentPadding: EdgeInsets.all(15),
      // minVerticalPadding: 10,
    );
  }
}


class FishTypeGridItem extends StatelessWidget {
  const FishTypeGridItem({super.key, required this.fishType, required this.srcBackImg});

  final String srcBackImg;
  final String fishType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(srcBackImg),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 161, 161, 161).withOpacity(0.5),
          width: double.infinity,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            fishType,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),  
          ),
        ),
      ],
    );
  }
}

class FishTypeGrid extends StatefulWidget {
  const FishTypeGrid({Key? key}) : super(key: key);

  @override
  State<FishTypeGrid> createState() => _FishTypeGridState();
}

class _FishTypeGridState extends State<FishTypeGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      padding: EdgeInsets.all(40),
      children: [
        FishTypeGridItem(fishType: 'Freshwater', srcBackImg: '../asset/freshwater.jpg'),
        FishTypeGridItem(fishType: 'Saltwater', srcBackImg: '../asset/saltwater.jpg')
      ],
    );
  }
}


class HomeNavBar extends StatefulWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icon_fish.fish),
          label: 'Fishes',
        )
      ],
      // selectedIndex: ,
      // onDestinationSelected: ,
      backgroundColor: Colors.blue.shade600,
    );
  }
}



// class ImgCarousel extends StatefulWidget {
//   const ImgCarousel({Key? key}) : super(key: key);

//   @override
//   State<ImgCarousel> createState() => _ImgCarouselState();
// }

// class _ImgCarouselState extends State<ImgCarousel> {
//   int _current = 0;

//   @override
//   Widget build(BuildContext context) {
//     List<String> fishImg = [
//       '../asset/ikan_betta.jpeg',
//       '../asset/ikan_cupang.jpeg',
//       '../asset/ikan_guppy.jpeg',
//       '../asset/ikan_koi.jpeg',
//       '../asset/ikan_mas.jpeg',
//       '../asset/ikan_siamese.jpeg'
//     ];

//     return Container(
//       child: Column(
//         children: [
//           CarouselSlider(
//             items: fishImg.map((src) => ClipRRect(
//               child: Image(image: AssetImage(src),
//                 fit: BoxFit.cover,
//               ),
//               borderRadius: BorderRadius.circular(20),
//             )).toList(),
//             options: CarouselOptions(
//               autoPlayInterval: const Duration(seconds: 3),
//               enlargeCenterPage: true,
//               enlargeFactor: 0.3,
//               aspectRatio: 2,
//               viewportFraction: 0.8,
//               height: MediaQuery.of(context).size.height/3.7,
//               autoPlay: true,
//               onPageChanged: (ind, _){
//                 setState(() {
//                   _current = ind;
//                 });
//               }
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: map<Widget>(
//               fishImg,
//                   (index, url) {
//                 return Container(
//                   width: 8.0,
//                   height: 8.0,
//                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: _current == index
//                           ? Color.fromRGBO(0, 0, 0, 0.9)
//                           : Color.fromRGBO(0, 0, 0, 0.4)),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }