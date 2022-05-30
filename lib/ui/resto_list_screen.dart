import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_v2/data/api/api_service.dart';
import 'package:resto_app_v2/provider/resto_list_provider.dart';
import 'package:resto_app_v2/ui/resto_search_screen.dart';
import 'package:resto_app_v2/widgets/list_page.dart';

class RestoListScreen extends StatelessWidget {
  static const routeName = '/resto-list';

  const RestoListScreen({Key? key}) : super(key: key);

  Widget _buildRestoList(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RestoListProvider(apiService: ApiService()),
      child: Consumer<RestoListProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.brown,
                backgroundColor: Colors.grey,
              ),
            );
          } else if (state.state == ResultState.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var resto = state.result.restaurants[index];
                return ListPage(restaurant: resto);
              },
              itemCount: state.result.restaurants.length,
            );
          } else if (state.state == ResultState.noData) {
            return Center(
              child: Text(state.message),
            );
          } else if (state.state == ResultState.error) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.signal_wifi_off_rounded,
                      color: Colors.grey, size: 90),
                  SizedBox(height: 24),
                  Text(
                    'Harap cek koneksi Anda',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Gagal memuat',
                style: TextStyle(fontSize: 24),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resto App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RestoSearchScreen.routeName);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: _buildRestoList(context),
    );
  }
}
