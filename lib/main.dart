import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusantaraa/screens/detail_mount_rinjani.dart';
import 'package:nusantaraa/screens/blank_screens.dart';
import 'package:nusantaraa/screens/detail_ayung.dart';
import 'package:nusantaraa/screens/detail_ijen.dart';
import 'package:nusantaraa/screens/detail_jagir.dart';
import 'package:nusantaraa/screens/detail_kalimutu.dart';
import 'package:nusantaraa/screens/detail_mount_bromo.dart';
import 'package:nusantaraa/screens/detail_mount_prau.dart';
import 'package:nusantaraa/screens/detail_pasih_uug.dart';
import 'package:nusantaraa/screens/detail_raja_ampat.dart';
import 'package:nusantaraa/screens/detail_ranu_kumbolo.dart';
import 'package:nusantaraa/screens/payment_page_ranu_kumbolo.dart';
import 'package:nusantaraa/screens/profile_user.dart';
import 'package:nusantaraa/screens/search_page.dart';
import 'package:nusantaraa/screens/search_river.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBnI3YQqO4WW_NO5fn5sK0pmBaZln_DO7I',
      appId: '1:214484290021:android:21088252d83f4eb2e8470c',
      messagingSenderId: '214484290021',
      projectId: 'nusantara-32ec0',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Test APP',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: DetailAyung(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: _currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _tabController.animateTo(index);
    switch (index) {
      case 0:
        // Navigasi ke HomePage
        break;
      case 1:
        // Navigasi ke LocationPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
        break;
      case 2:
        // Navigasi ke ProfilePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      default:
        break;
    }
  }

  Widget _buildIconButton(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _currentIndex == index ? Colors.white : Colors.grey,
          ),
          const SizedBox(height: 5),
          Container(
            height: 2,
            width: 30,
            color: _currentIndex == index ? Colors.white : Colors.transparent,
          ),
        ],
      ),
    );
  }

  // Method untuk membangun widget carousel
  Widget _buildCarousel() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            enableInfiniteScroll: true,
            autoPlay: false,
            autoPlayAnimationDuration: Duration(seconds: 7),
          ),
          items: [
            GestureDetector(
              onTap: () {
                // Tambahkan logika untuk tombol pada bagian bawah di sini
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailRanuKumbolo()),
                );
              },
              child: Image.asset('assets/RanuKumbolo.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailIjen()),
                );
              },
              child: Image.asset('assets/Ijen Crater.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailRaja()),
                );
              },
              child: Image.asset('assets/Raja Ampat.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailMountBromo()),
                );
              },
              child: Image.asset('assets/Moaunt Bromo.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailJagir()),
                );
              },
              child: Image.asset('assets/Jagir.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPasihUug()),
                );
              },
              child: Image.asset('assets/pasih uug.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailKalimutu()),
                );
              },
              child: Image.asset('assets/kalimutu.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailAyung()),
                );
              },
              child: Image.asset('assets/ayung river.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailMountRinjani()),
                );
              },
              child: Image.asset('assets/rinjani.png'),
            ),
          ],
        ),
      ),
    );
  }

// Method untuk membangun widget carousel
  Widget _buildCardNearby() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            enableInfiniteScroll: true,
            autoPlay: false,
            autoPlayAnimationDuration: Duration(seconds: 7),
          ),
          items: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailIjen()),
                );
              },
              child: Image.asset('assets/Ijen Crater.png'),
            ),
            GestureDetector(
              onTap: () {
                // Tambahkan logika untuk tombol pada bagian bawah di sini
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailRanuKumbolo()),
                );
              },
              child: Image.asset('assets/RanuKumbolo.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailMountBromo()),
                );
              },
              child: Image.asset('assets/Moaunt Bromo.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailRaja()),
                );
              },
              child: Image.asset('assets/Raja Ampat.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailJagir()),
                );
              },
              child: Image.asset('assets/Jagir.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPasihUug()),
                );
              },
              child: Image.asset('assets/pasih uug.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailKalimutu()),
                );
              },
              child: Image.asset('assets/kalimutu.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailAyung()),
                );
              },
              child: Image.asset('assets/ayung river.png'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailMountRinjani()),
                );
              },
              child: Image.asset('assets/rinjani.png'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      body: Column(
        children: [
          // Text Title Home
          Container(
            margin: EdgeInsets.fromLTRB(168.0, 58.0, 0.0, 0.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Home',
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 111, 119, 137),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Pindah ke halaman profil
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  // Profile foto
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 30.0,
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
          ),
          // Text Wonderful Indonesia
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 35.0, 74.0, 0.0),
            child: Text(
              'Wonderful Indonesia',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          // Text Let's Explore Together
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 110.0, 0.0),
            child: Text(
              "Let's Explore Together",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 111, 119, 137),
              ),
            ),
          ),
          // Tab Bar
          Padding(
            padding: EdgeInsets.only(top: 20.0), // Padding keseluruhan
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Popular'),
                Tab(text: 'Nearby'),
                Tab(text: 'Recommended'),
              ],
              labelColor: Color.fromARGB(255, 243, 109, 114),
              isScrollable: true,
              labelPadding: EdgeInsets.only(
                left: 0.0,
                right: 20.0,
              ), // Padding tab pertama
              labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 14.0),
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 243, 109, 114),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          // Tab Bar View (bagian halaman)
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // tabbar All
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCarousel(), // method carousel
                    SizedBox(height: 20), // Spasi antara carousel dan ListView
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 10),
                      child: Text(
                        'Top Place',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailIjen(),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    110, // Sesuaikan tinggi item sesuai kebutuhan
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/list_0.png'), // Path gambar pertama
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                           Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailRanuKumbolo(),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    110, // Sesuaikan tinggi item sesuai kebutuhan
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/list_1.png'), // Path gambar pertama
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                           Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailMountBromo(),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    110, // Sesuaikan tinggi item sesuai kebutuhan
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/list_2.png'), // Path gambar pertama
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // halaman popular
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPasihUug(),
                              ),
                            );
                          },
                          child: Container(
                            height:
                                235, // Sesuaikan tinggi item sesuai kebutuhan
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/pasih uug.png'), // Path gambar
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailIjen(),
                              ),
                            );
                          },
                          child: Container(
                            height:
                                235, // Sesuaikan tinggi item sesuai kebutuhan
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/Ijen Crater.png'), // Path gambar
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailRaja(),
                              ),
                            );
                          },
                          child: Container(
                            height:
                                235, // Sesuaikan tinggi item sesuai kebutuhan
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/Raja Ampat.png'), // Path gambar
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailMountBromo(),
                              ),
                            );
                          },
                          child: Container(
                            height:
                                235, // Sesuaikan tinggi item sesuai kebutuhan
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/Moaunt Bromo.png'), // Path gambar
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailJagir(),
                              ),
                            );
                          },
                          child: Container(
                            height:
                                235, // Sesuaikan tinggi item sesuai kebutuhan
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/Jagir.png'), // Path gambar
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailRanuKumbolo(),
                              ),
                            );
                          },
                          child: Container(
                            height:
                                235, // Sesuaikan tinggi item sesuai kebutuhan
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/RanuKumbolo.png'), // Path gambar
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // halaman nearby
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCardNearby(), // method carousel
                    SizedBox(height: 20), // Spasi antara carousel dan ListView
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 10),
                      child: Text(
                        'Top Place',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailMountBromo(),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    110, // Atur tinggi item sesuai kebutuhan
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/list_2.png'), // Path gambar kedua
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailIjen(),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    110, // Atur tinggi item sesuai kebutuhan
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/list_0.png'), // Path gambar kedua
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailRanuKumbolo(),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    110, // Atur tinggi item sesuai kebutuhan
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/list_1.png'), // Path gambar kedua
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // halaman recomended
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailMountRinjani(),
                              ),
                            );
                          },
                          child: Container(
                            height: 110, // Atur tinggi item sesuai kebutuhan
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/list_3.png'), // Path gambar kedua
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailIjen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 110, // Atur tinggi item sesuai kebutuhan
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/list_0.png'), // Path gambar kedua
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailMountBromo(),
                              ),
                            );
                          },
                          child: Container(
                            height: 110, // Atur tinggi item sesuai kebutuhan
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/list_2.png'), // Path gambar kedua
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailRanuKumbolo(),
                              ),
                            );
                          },
                          child: Container(
                            height: 110, // Atur tinggi item sesuai kebutuhan
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/list_1.png'), // Path gambar kedua
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            // Tambahkan logika navigasi ke halaman yang diinginkan di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailMountPrau(),
                              ),
                            );
                          },
                          child: Container(
                            height: 110, // Atur tinggi item sesuai kebutuhan
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/list_4.png'), // Path gambar kedua
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar start
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIconButton(Icons.home, 0),
                _buildIconButton(Icons.location_on, 1),
                _buildIconButton(Icons.person, 2),
              ],
            ),
          ),
        ),
      ),
      // Bottom Navigation Bar end
    );
  }
}
