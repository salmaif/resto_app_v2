import 'package:flutter/material.dart';
import 'package:resto_app_v2/data/model/resto_detail.dart';
import 'package:resto_app_v2/ui/resto_review_screen.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/resto-detail';

  final Restaurant restaurant;
  const DetailPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Gambar dan Tombol Back
              Stack(
                children: [
                  Hero(
                    tag: restaurant.pictureId,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      child: Image.network(
                          "https://restaurant-api.dicoding.dev/images/large/" +
                              restaurant.pictureId),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(12.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 12),
                child: Text(
                  restaurant.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),

              /// Simbol
              Container(
                padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          restaurant.city,
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(width: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${restaurant.rating}',
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              /// Deskripsi dan Menu
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: const [
                        Text(
                          'Tentang Restoran',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: [
                        Text(
                          restaurant.description,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                    const SizedBox(height: 25),

                    /// Menu
                    const Center(
                      child: Text(
                        'Menu Kami',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          ),
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Column(
                            children: [
                              const Text(
                                'Makanan',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: restaurant.menus.foods
                                    .map(
                                      (e) => Text(
                                        e.name,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      color: Colors.grey, width: 1.0))),
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              const Text(
                                'Minuman',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: restaurant.menus.drinks
                                      .map(
                                        (e) => Text(
                                          e.name,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      )
                                      .toList()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),

                    /// Reviews
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 48,
                          width: 175,
                          child: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RestoReviewScreen(restaurant: restaurant),
                              ),
                            ),
                            child: const Text(
                              'Ulasan Restoran',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.brown,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
