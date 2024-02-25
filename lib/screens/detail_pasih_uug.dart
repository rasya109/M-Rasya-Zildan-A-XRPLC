import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusantaraa/main.dart';
import 'package:nusantaraa/screens/payment_page_pasih_uug.dart';

void main() {
  runApp(DetailPasihUug());
}

class DetailPasihUug extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, vsync: this, initialIndex: _currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/background_pasih_uug_beach.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tombol Back dan Favorite
            Padding(
              padding:
                  const EdgeInsets.only(top: 55.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white30,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.black45,
                      iconSize: 20.0,
                      padding: EdgeInsets.only(left: 6.0),
                      onPressed: () {
                         Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.bookmark_add),
                      color: Color.fromARGB(255, 243, 109, 114),
                      iconSize: 20.0,
                      onPressed: () {
                        // Tambahkan logika untuk tombol favorite di sini
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Judul dan Informasi
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 300.0),
              child: Row(
                children: [
                  Text(
                    "Pasih Uug Beach",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Informasi tambahan (lokasi, harga, rating)
            Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, top: 15.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.deepOrange,
                        size: 30.0,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Nusa Penida, Bali",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "\$1",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        "/person",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Rating
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 15.0),
              child: Row(
                children: [
                  Text(
                    "4.9",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                        size: 18,
                      ),
                    ).expand((widget) => [widget, SizedBox(width: 3)]).toList(),
                  ),
                ],
              ),
            ),
            // Tab Bar
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 0.0),
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'About'),
                  Tab(text: 'Review'),
                  Tab(text: 'Photo'),
                ],
                labelColor: const Color.fromARGB(255, 243, 109, 114),
                isScrollable: true,
                labelPadding: const EdgeInsets.only(
                  left: 0.0,
                  right: 30.0,
                ),
                labelStyle: const TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 14.0,
                ),
                indicator: const BoxDecoration(
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
                  AboutContent(),
                  ReviewPage(),
                  PhotoPage(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            // Tambahkan logika untuk tombol pada bagian bawah di sini
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => BookingPagePasihUug()),
  );
          },
          child: Text(
            'Book a Trip',
            style: TextStyle(
              color: Colors.white, // Warna teks putih
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12.0), // Ubah nilai sesuai kebutuhan
            ),
          ),
        ),
      ),
    );
  }
}

class AboutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Description',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Located on the rugged coast of Nusa Penida, an island off the coast of Bali, Indonesia, Pasih Uug, also known as Broken Beach, is a mesmerizing natural wonder that captivates visitors with its dramatic cliffs and stunning turquoise waters. This iconic destination offers a glimpse into the raw beauty and untamed landscapes of Indonesia lesser-known islands. As travelers approach Pasih Uug,',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: ExpandableText(
                'they are greeted by the breathtaking sight of towering limestone cliffs that stretch as far as the eye can see. Carved over millennia by the relentless forces of wind and water, these majestic formations rise sharply from the azure sea below, creating a dramatic backdrop for the turquoise lagoon that lies at their feet.',
                expandText: 'Show more',
                collapseText: 'Show less',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ini ulasan pepek

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Daftar Ulasan
            Text(
              'Reviews:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),

            // Ulasan Pertama
            ReviewCard(
              username: 'Shandy Ganteng',
              rating: 5,
              comment: 'Amazing place!',
              profileImage: 'assets/john_doe_profile.jpg',
            ),
            
            // Ulasan Kedua
            ReviewCard(
              username: 'Shandy',
              rating: 4,
              comment: 'Great experience',
              profileImage: 'assets/traveler_profile.jpg',
            ),
            
            // Ulasan Ketiga
            // Tambahkan ulasan sesuai kebutuhan

          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String username;
  final int rating;
  final String comment;
  final String profileImage;

  ReviewCard({required this.username, required this.rating, required this.comment, required this.profileImage});

 List<Widget> buildStarRating(int rating) {
    List<Widget> starList = [];

    for (int i = 1; i <= 5; i++) {
      Icon starIcon = Icon(
        i <= rating ? Icons.star : Icons.star_border,
        color: i <= rating ? Colors.orange : Colors.grey,
        size: 18.0,
      );
      starList.add(starIcon);
    }

    return starList;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto Profil Lingkaran
            CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(profileImage),
            ),
            SizedBox(width: 16.0),

            // Informasi Ulasan (Username, Rating, dan Comment)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$username',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),

                  // Rating dalam Bentuk Icon Bintang
                  Row(
                    children: buildStarRating(rating),
                  ),
                  SizedBox(height: 5.0),

                  // Komentar Ulasan
                  Text(
                    '$comment',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3, // Ubah sesuai jumlah foto yang Anda miliki
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            height: 200.0, // Sesuaikan tinggi foto sesuai kebutuhan
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0), // Melengkungkan sisinya
              image: DecorationImage(
                image: AssetImage('assets/photos/pasih${index + 1}.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

