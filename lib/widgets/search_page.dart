import 'package:flutter/material.dart';
import 'package:resto_app_v2/data/model/resto_search.dart';
import 'package:resto_app_v2/ui/resto_detail_screen.dart';

class SearchPage extends StatelessWidget {
  final Restaurant restaurant;

  const SearchPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RestoDetailScreen.routeName,
            arguments: restaurant.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Hero(
            tag: restaurant.pictureId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://restaurant-api.dicoding.dev/images/small/" +
                    restaurant.pictureId,
                width: 90,
              ),
            ),
          ),
          title: Text(
            restaurant.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(restaurant.city),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text('${restaurant.rating}')
                ],
              ),
              const SizedBox(height: 12),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
