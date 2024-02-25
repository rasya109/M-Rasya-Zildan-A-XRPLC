import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusantaraa/main.dart';
import 'package:nusantaraa/screens/detail_ayung.dart';
import 'package:nusantaraa/screens/detail_jagir.dart';
import 'package:nusantaraa/screens/detail_kalimutu.dart';
import 'package:nusantaraa/screens/detail_mount_bromo.dart';
import 'package:nusantaraa/screens/detail_mount_rinjani.dart';
import 'package:nusantaraa/screens/detail_pasih_uug.dart';
import 'package:nusantaraa/screens/detail_raja_ampat.dart';
import 'package:nusantaraa/screens/detail_ranu_kumbolo.dart';
import 'package:nusantaraa/screens/profile_user.dart';
import 'package:nusantaraa/screens/search_beach.dart';
import 'package:nusantaraa/screens/search_crater.dart';
import 'package:nusantaraa/screens/search_mount.dart';
import 'package:nusantaraa/screens/search_river.dart';
import 'package:nusantaraa/screens/search_waterfall.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  final List<String> texts = ['Mount', 'Beach', 'Crater', 'Waterfall', 'River'];

  @override
  State<SearchPage> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<SearchPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: _currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _tabController.animateTo(0);
          break;
        case 1:
          _tabController.animateTo(1);
          break;
        case 2:
          _tabController.animateTo(2);
          break;
      }
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _getPage(_currentIndex),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return SearchPage();
      case 1:
        return ProfilePage();
      case 2:
        return HomePage();
      default:
        return HomePage();
    }
  }

  Widget _buildIconButton(IconData icon, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _onTabChanged(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: _currentIndex == index ? Colors.white : Colors.grey,
            ),
            SizedBox(height: 5),
            Container(
              height: 2,
              width: 30,
              color: _currentIndex == index ? Colors.white : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Search',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 111, 119, 137),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 16.0,
                      ),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile.png',
                          fit: BoxFit.cover,
                          width: 38,
                          height: 38,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Category',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Carousel Horizontal
              Container(
                height: 90.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.texts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchMount(),
                              ),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchBeach(),
                              ),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchCrater(),
                              ),
                            );
                            break;
                          case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchWaterfall(),
                              ),
                            );
                            break;
                          case 4:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchRiver(),
                              ),
                            );
                            break;
                          default:
                            break;
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/category_$index.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              widget.texts[index],
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                  height:
                      20.0), // Tambahkan jarak antara carousel dan teks "Recomended"
              Text(
                'Recommend',
                style: GoogleFonts.poppins(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30.0),
              // Scrollable image below the text "Recommend"
             Container(
  height: 200.0,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 4,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          // Tambahkan logika navigasi ke halaman yang berbeda sesuai dengan indeks gambar
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMountBromo(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMountRinjani(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailRaja(),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailAyung(),
                ),
              );
              break;
            default:
              break;
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(
            'assets/recommend${index + 1}.png',
            fit: BoxFit.cover,
            width: 283.0,
            height: 195.0,
          ),
        ),
      );
    },
  ),
),

              SizedBox(height: 30.0),
              // Scrollable image below the text "Recommend"
              Container(
  height: 200.0,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 4,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          // Tambahkan logika navigasi ke halaman yang berbeda sesuai dengan indeks gambar
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailRanuKumbolo(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPasihUug(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailKalimutu(),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailJagir(),
                ),
              );
              break;
            default:
              break;
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(
            'assets/recommen${index + 1}.png', // Perhatikan nama file gambar yang benar
            fit: BoxFit.cover,
            width: 283.0,
            height: 195.0,
          ),
        ),
      );
    },
  ),
),

            ],
          ),
        ),
      ),
      // Bottom Navigation Bar start
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIconButton(Icons.home, 2),
                _buildIconButton(Icons.location_on, 0),
                _buildIconButton(Icons.person, 1),
              ],
            ),
          ),
        ),
      ),
      // Bottom Navigation Bar end
    );
  }
}
