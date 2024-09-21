import 'package:flutter/material.dart';
import 'package:sviour_app/widgets/Drawer.dart';

class tripsLocationPage extends StatelessWidget {
  static const Color primary = Color(0xFF326BFB);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primary,
        title: const Text(
          'Trips',
          style: TextStyle(color: Colors.white, fontFamily: "cursive", fontSize: 40),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {},
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'), // Placeholder image
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 26),
              child: const Text(
                "Book The Best Location\nWhere You Want To Go ",
                style: TextStyle(
                  fontFamily: "cursive",
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                child: ListView(
                  padding: EdgeInsets.all(24),
                  scrollDirection: Axis.horizontal,
                  children: [
                    DestinationCard(
                      imageUrl: 'assets/images/destination1.jpeg',
                      title: "Water boat, Desert Safari, Quad Bike, Camel Ride",
                      rating: "4.9",
                      reviews: "(15,180 reviews)",
                    ),
                    DestinationCard(
                      imageUrl: 'assets/images/destination2.jpeg',
                      title: "Mountain Climbing, Skiing, Hiking",
                      rating: "4.8",
                      reviews: "(12,345 reviews)",
                    ),
                    DestinationCard(
                      imageUrl: 'assets/images/destination3.jpeg',
                      title: "Mountain Climbing, Skiing, Hiking",
                      rating: "4.8",
                      reviews: "(12,345 reviews)",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Travel_Drawer(),
    );
  }
}



class DestinationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rating;
  final String reviews;

  DestinationCard({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.reviews,
  });

  static const Color primary = Color(0xFF326BFB);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width * 0.7, // Make card responsive
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imageUrl,
              height: 300, // Use MediaQuery for height
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 20),
                SizedBox(width: 4),
                Text(rating),
                SizedBox(width: 4),
                Text(reviews),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: primary,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    // Add your booking logic here
                  },
                  child: Text(
                    'Book Now',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
