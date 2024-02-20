import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFC2B9FB),
        body: LibraryHomePage(),
      ),
    );
  }
}

class LibraryHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white, // Warna putih
          height: 100, // Tinggi 150
          width: double.infinity, // Mengikuti lebar halaman
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Image.asset(
                'assets/logo.png', // Path ke logo
                width: 80,
                height: 80,
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Nama Anda', // Ganti dengan nama Anda
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Kelas Anda', // Ganti dengan kelas Anda
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 100),
              BookImageWithTextWidget('assets/book.png', 'Buku'),
              SizedBox(width: 100),
              BookImageWithTextWidget('assets/book.png', 'Buku'),
              SizedBox(width: 100),
              BookImageWithTextWidget('assets/book.png', 'Buku'),
              SizedBox(width: 100),
              BookImageWithTextWidget('assets/book.png', 'Buku'),
              SizedBox(width: 100),
              BookImageWithTextWidget('assets/book.png', 'Buku'),
              SizedBox(width: 100),
              BookImageWithTextWidget('assets/book.png', 'Buku'),
              SizedBox(width: 100),
              BookImageWithTextWidget('assets/book.png', 'Buku'),
              SizedBox(width: 100),
              BookImageWithTextWidget('assets/book.png', 'Buku'),
              SizedBox(width: 100),
            ],
          ),
        ),
      ],
    );
  }
}

class BookImageWidget extends StatelessWidget {
  final String imagePath;

  BookImageWidget(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BookImageWithTextWidget extends StatelessWidget {
  final String imagePath;
  final String text;

  BookImageWithTextWidget(this.imagePath, this.text);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
