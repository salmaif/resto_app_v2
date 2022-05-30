import 'package:flutter/material.dart';
import 'package:resto_app_v2/data/model/resto_detail.dart';

class RestoReviewScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestoReviewScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulasan Restoran'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final reviews = restaurant.customerReviews[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person_pin,
                        color: Colors.brown,
                        size: 30.0,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        reviews.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        reviews.date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    reviews.review,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: restaurant.customerReviews.length,
      ),
    );
  }
}
