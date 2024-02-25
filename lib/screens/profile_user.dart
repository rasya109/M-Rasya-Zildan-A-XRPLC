import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusantaraa/main.dart';
import 'package:nusantaraa/screens/search_mount.dart';
import 'package:nusantaraa/screens/search_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfilePage>
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
        return ProfilePage();
      case 1:
        return HomePage();
      case 2:
        return SearchPage();
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
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/backgroundProfile2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 160,
              child: Container(
                width: 152,
                height: 152,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white, 
                    width: 8.0,           
                  ),
                  borderRadius: BorderRadius.circular(100.0), 
                ),
                child: Image.asset(
                  'assets/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Teks di bawah gambar profil
            Positioned(
              top: 320,
              child: Text(
                'Zahwa Afrida',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Card dengan informasi Email
            Positioned(
              top: 360,
              child: Card(
                color: Colors.white,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'zahwa@gmail.com',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // card phine
            Positioned(
              top: 470,
              child: Card(
                color: Colors.white,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '+1234567890',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Card dengan informasi Password
            Positioned(
              top: 580,
              child: Card(
                color: Colors.white,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'ra**08',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Tambahkan widget lainnya di sini jika diperlukan
          ],
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
                _buildIconButton(Icons.home, 1),
                _buildIconButton(Icons.location_on, 2),
                _buildIconButton(Icons.person, 0),
              ],
            ),
          ),
        ),
      ),
      // Bottom Navigation Bar end
    );
  }
}
