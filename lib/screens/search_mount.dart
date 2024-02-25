import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusantaraa/screens/detail_kalimutu.dart';
import 'package:nusantaraa/screens/detail_mount_bromo.dart';
import 'package:nusantaraa/screens/detail_mount_prau.dart';
import 'package:nusantaraa/screens/detail_mount_rinjani.dart';
import 'package:nusantaraa/screens/profile_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchMount(),
    );
  }
}

class SearchMount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      body: Container(
        margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 111, 119, 137),
                  ),
                ),
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
                      MaterialPageRoute(builder: (context) => ProfilePage()),
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
              'Mount',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
  child: ListView.builder(
    itemCount: 4, // Ganti dengan jumlah gambar yang ingin ditampilkan
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          // Tambahkan logika navigasi ke halaman yang berbeda sesuai dengan indeks gambar
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMountPrau(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMountBromo(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMountRinjani(),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailKalimutu(),
                ),
              );
              break;
            default:
              break;
          }
        },
        child: ListTile(
          title: Image.asset(
            'assets/mountain${index + 1}.png', // Ganti dengan nama gambar yang sesuai
            fit: BoxFit.cover,
            width: 326.0, // Sesuaikan lebar gambar sesuai keinginan
            height: 249.0, // Sesuaikan tinggi gambar sesuai keinginan
          ),
        ),
      );
    },
  ),
),

          ],
        ),
      ),
    );
  }
}
