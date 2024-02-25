import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BookingPageBromoCrater(),
  ));
}

class BookingPageBromoCrater extends StatefulWidget {
  BookingPageBromoCrater({Key? key}) : super(key: key);

  @override
  State<BookingPageBromoCrater> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPageBromoCrater> {
  int _selectedPackage = 1; // Variabel untuk menyimpan paket yang dipilih
  DateTime _selectedDate =
      DateTime.now(); // variabel untuk menyimpan tanggal yang dipilih
  int _totalPrice = 190; // Harga total awal
  int _pricePerPerson = 190; // Harga per orang

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Tombol back
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 50, left: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(
                          context); // Fungsi untuk kembali ke halaman sebelumnya
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ), // jarak text dengan icon
              // text raja ampat islands
              Padding(
                padding: EdgeInsets.only(left: 13),
                child: Text(
                  'Bromo Crater',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              // icon location
              Padding(
                padding: EdgeInsets.only(left: 7),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color.fromARGB(255, 238, 104, 74),
                      size: 30,
                    ),
                    SizedBox(width: 5),
                    // text raja ampat, papua barat
                    Text(
                      'Jawa Timur',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // text rating
              Padding(
                padding: EdgeInsets.only(left: 7),
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Text(
                      '4.5',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 111, 119, 137),
                      ),
                    ),
                    SizedBox(width: 10),
                    // 5 icon stars
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 238, 104, 74),
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 238, 104, 74),
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 238, 104, 74),
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 238, 104, 74),
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 238, 104, 74),
                      size: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // text booking
              Padding(
                padding: EdgeInsets.only(left: 13),
                child: Text(
                  'Booking',
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 15),
              // text Choose a package
              Padding(
                padding: EdgeInsets.only(left: 13),
                child: Text(
                  'Choose a Package',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                ),
                margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedPackage = 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            backgroundColor: _selectedPackage == 1
                                ? Color.fromARGB(255, 243, 109, 114)
                                : Color.fromARGB(255, 246, 246, 246),
                            foregroundColor: _selectedPackage == 1
                                ? Colors.white
                                : Color.fromARGB(255, 0, 0, 0),
                            elevation: 0,
                            onPrimary: _selectedPackage == 1
                                ? Color.fromARGB(255, 243, 109, 114)
                                : Color.fromARGB(255, 0, 0, 0),
                          ),
                          child: Text(
                            '1 Person',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedPackage = 2;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            backgroundColor: _selectedPackage == 2
                                ? Color.fromARGB(255, 243, 109, 114)
                                : Color.fromARGB(255, 246, 246, 246),
                            foregroundColor: _selectedPackage == 2
                                ? Colors.white
                                : Color.fromARGB(255, 0, 0, 0),
                            elevation: 0,
                            onPrimary: _selectedPackage == 2
                                ? Color.fromARGB(255, 243, 109, 114)
                                : Color.fromARGB(255, 0, 0, 0),
                          ),
                          child: Text(
                            '2 Person',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedPackage = 3;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            backgroundColor: _selectedPackage == 3
                                ? Color.fromARGB(255, 243, 109, 114)
                                : Color.fromARGB(255, 246, 246, 246),
                            foregroundColor: _selectedPackage == 3
                                ? Colors.white
                                : Color.fromARGB(255, 0, 0, 0),
                            elevation: 0,
                            onPrimary: _selectedPackage == 3
                                ? Color.fromARGB(255, 243, 109, 114)
                                : Color.fromARGB(255, 0, 0, 0),
                          ),
                          child: Text(
                            '3 Person',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedPackage = 4;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            backgroundColor: _selectedPackage == 4
                                ? Color.fromARGB(255, 243, 109, 114)
                                : Color.fromARGB(255, 246, 246, 246),
                            foregroundColor: _selectedPackage == 4
                                ? Colors.white
                                : Color.fromARGB(255, 0, 0, 0),
                            elevation: 0,
                            onPrimary: _selectedPackage == 4
                                ? Color.fromARGB(255, 243, 109, 114)
                                : Color.fromARGB(255, 0, 0, 0),
                          ),
                          child: Text(
                            '4 Person',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedPackage = 6;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        backgroundColor: _selectedPackage == 6
                            ? Color.fromARGB(255, 243, 109, 114)
                            : Color.fromARGB(255, 246, 246, 246),
                        foregroundColor: _selectedPackage == 6
                            ? Colors.white
                            : Color.fromARGB(255, 0, 0, 0),
                        elevation: 0,
                        onPrimary: _selectedPackage == 6
                            ? Color.fromARGB(255, 243, 109, 114)
                            : Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: Text(
                        '6 Person/Family',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),
              // Widget kalender
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 99),
                child: ElevatedButton(
                  onPressed: () {
                    _selectDate(context); // fungsi memanggil calender
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(0, 50),
                    backgroundColor: Color.fromARGB(255, 243, 109, 114),
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Choose a Date',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Selected Package: $_selectedPackage Person\nSelected Date: ${_selectedDate.toLocal().toString().split(' ')[0]}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              SizedBox(
                height: 20,
              ),
              // Booking button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {
                    // logika jika tombol di klik
                    _confirmBooking();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: Size(150, 50),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Booking',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _confirmBooking() {
    // Hitung harga total berdasarkan jumlah orang yang dipilih
    int numberOfPersons = _selectedPackage;
    _totalPrice = numberOfPersons * _pricePerPerson;

    // Generate unique code based on selected package and date
    String uniqueCode = generateUniqueCode();
    // Navigate to payment page with unique code
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              PaymentPage(uniqueCode: uniqueCode, totalPrice: _totalPrice)),
    );
  }

  String generateUniqueCode() {
    var uuid = Uuid();
    String randomCode = uuid.v4().substring(0, 8);
    String currentDate = _selectedDate.toString().split(' ')[0];

    return "$randomCode\_$_selectedPackage\_$currentDate\_NTREXPR";
  }
}

class PaymentPage extends StatelessWidget {
  final String uniqueCode;

  final int totalPrice; // Tambahkan variabel totalPrice

  PaymentPage({required this.uniqueCode, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 70.0, 0.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.only(left: 10.0),
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    "Payment Methods",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 40.0),
                ],
              ),
            ),
            SizedBox(height: 80.0),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/paypal-card.png'),
                        SizedBox(height: 30.0),
                        Image.asset('assets/qris-card.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Balance",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$$totalPrice", // Tampilkan harga total yang dihitung
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60.0),
                  ElevatedButton(
                    onPressed: () {
                      _confirmPayment(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmPayment(BuildContext context) {
    // Navigate to QRCodePage with unique code
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => QRCodePage(uniqueCode: uniqueCode)),
    );
  }
}

class QRCodePage extends StatelessWidget {
  final String uniqueCode;

  QRCodePage({required this.uniqueCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 80),
                Text(
                  'Your QR Code',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QrImageView(
                    data: uniqueCode,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Generated Unique Code:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    uniqueCode,
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
