
import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project_mcc/fishespage.dart';
import 'package:final_project_mcc/route.dart';
import 'package:final_project_mcc/temppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*
belum :
[] navigasi -> logout button - HomePage -> Login Page 
[v] navigasi -> grid of button - FishTypeGridItem -> fishes page, pass argument fish type
tinggal ubah route
*/


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          //jangan lupa navigation ke login pagee !!!
          LogoutButtonAlert()
        ],
        leading: const Icon(Icons.home),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 30,
            ),
            ImgCarousel(),
            AboutCompany(),
            ListTile(
              title: Text('Fish Types',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            FishTypeGrid(),
          ],
        ),
      ),
      // bottomNavigationBar: const HomeNavBar(),
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
      'assets/carousel/ikan_betta.jpeg',
      'assets/carousel/ikan_cupang.jpeg',
      'assets/carousel/ikan_guppy.jpeg',
      'assets/carousel/ikan_koi.jpeg',
      'assets/carousel/ikan_mas.jpeg',
      'assets/carousel/ikan_siamese.jpeg'
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
              // height: MediaQuery.of(context).size.height/4.5,
              height: 190,
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
    return const ListTile(
      title: Text(
        'About Us',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'HE Fish is a fish shop that have lists many popular decorative fish... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        textAlign: TextAlign.justify,
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
  FishTypeGridItem({super.key, required this.fishType, required this.srcBackImg, required this.fishTypeId});

  //tambah navigation --> class(?)
  final String srcBackImg;
  final String fishType;
  int fishTypeId;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Stack(
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
          GestureDetector(
            //navigation ke fish pagee !!!! with the fish type as its arguments.
            onTap: () => {
              Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                  builder: (context) => FishesPage(fishTypeId: fishTypeId),
                ), 
                (route) => false)
            },
          )
        ],
      ),
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
      crossAxisSpacing: 30,
      mainAxisSpacing: 30,
      padding: EdgeInsets.all(40),
      children: [
        FishTypeGridItem(fishType: 'Freshwater', srcBackImg: 'assets/fishtype/freshwater.jpg', fishTypeId: 0,),
        FishTypeGridItem(fishType: 'Saltwater', srcBackImg: 'assets/fishtype/saltwater.jpg', fishTypeId: 1,),
        FishTypeGridItem(fishType: 'Deep Sea', srcBackImg: 'assets/fishtype/deepsea.jpg', fishTypeId: 2,),
        // FishTypeGridItem(fishType: 'Saltwater', srcBackImg: '../asset/saltwater.jpg')
      ],
      controller: ScrollController(),
    );
  }
}


class LogoutAlert extends StatelessWidget {
  const LogoutAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Logout of your account?', textAlign: TextAlign.center,),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
      titlePadding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 25),
      buttonPadding: EdgeInsets.zero,
      actions: [
        Container(
          decoration: const BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide(color: Color.fromARGB(136, 216, 216, 216), width: 2))
          ),
          // width: double.infinity,
          child: CupertinoDialogAction(
            child: Text('Logout'),
            textStyle: TextStyle(
              color: Colors.red[600],
              fontWeight: FontWeight.w600
            ),
            onPressed: () => {
              Navigator.pushAndRemoveUntil(
                context,
                //navigasi ke exit page !!!! 
                // ku ganti ke login page yaa
                // MaterialPageRoute(builder: (context) => TempPage()), 
                // (route) => false)
                RouterGenerator.generateRoute(
                  RouteSettings(
                    name: '/login'
                  )
                ),
                (route) => false)
            },
          ),
        ),
        CupertinoDialogAction(
          child: Text('Cancel'),
          textStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
      elevation: 24,
      backgroundColor: Color.fromARGB(240, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
    );
  }
}


class LogoutButtonAlert extends StatelessWidget {
  const LogoutButtonAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: GestureDetector(
        //jangan lupa navigation ke login pagee !!!
        onTap: () => {
          showDialog(
            context: context, 
            builder: (_) => LogoutAlert()
          )
        },
        child: const Icon(Icons.logout_rounded, color: Colors.red,),
      ),
    );
  }
}

// class HomeNavBar extends StatefulWidget {
//   const HomeNavBar({Key? key}) : super(key: key);

//   @override
//   State<HomeNavBar> createState() => _HomeNavBarState();
// }

// class _HomeNavBarState extends State<HomeNavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       fixedColor: Colors.white,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.home_outlined,
//           ),
//           label: 'Home'
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icon_fish.fish),
//           label: 'Fishes',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.account_circle_outlined),
//           label: 'Profile',
//         )
//       ],
//       // selectedIndex: ,
//       // onDestinationSelected: ,
//       backgroundColor: Colors.blue.shade600,
//     );
//   }
// }



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