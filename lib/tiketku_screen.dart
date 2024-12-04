import 'package:flutter/material.dart';

class TiketkuScreen extends StatelessWidget {
  final List<Ticket> myTickets = [
    Ticket(
      title: 'GLADIATOR II',
      rating: 'D17+',
      genre: 'Action, Adventure',
      score: 9.5,
      imagePath: 'assets/gladiator_ii.jpg',
    ),
    Ticket(
      title: 'RED ONE',
      rating: 'R13+',
      genre: 'Action, Adventure',
      score: 9.3,
      imagePath: 'assets/red_one.jpg',
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Pencarian dan Lokasi
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Color.fromARGB(255, 6, 45, 90),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari di TIX ID',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lokasi: JAKARTA',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Icon(Icons.location_on, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
          // Daftar Tiket
          Expanded(
            child: myTickets.isEmpty
                ? Center(child: Text('Tidak ada tiket yang tersedia.'))
                : ListView.builder(
                    itemCount: myTickets.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                myTickets[index].imagePath,
                                width: 100,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        myTickets[index].title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Rating: ${myTickets[index].rating}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        'Genre: ${myTickets[index].genre}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: List.generate(
                                          myTickets[index].score.round(),
                                          (i) => Icon(Icons.star, color: Colors.amber, size: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class Ticket {
  final String title;
  final String rating;
  final String genre;
  final double score;
  final String imagePath;

  Ticket({
    required this.title,
    required this.rating,
    required this.genre,
    required this.score,
    required this.imagePath,
  });
}
