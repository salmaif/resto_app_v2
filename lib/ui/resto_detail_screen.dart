import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_v2/widgets/detail_page.dart';
import 'package:resto_app_v2/data/api/api_service.dart';
import 'package:resto_app_v2/provider/resto_detail_provider.dart';

class RestoDetailScreen extends StatelessWidget {
  static const routeName = '/resto-detail';
  final String id;

  const RestoDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RestoDetailProvider(apiService: ApiService(), id: id),
      child: Consumer<RestoDetailProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.brown,
                backgroundColor: Colors.grey,
              ),
            );
          } else if (state.state == ResultState.hasData) {
            return DetailPage(restaurant: state.result.restaurant);
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
}
