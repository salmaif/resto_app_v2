import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_v2/data/api/api_service.dart';
import 'package:resto_app_v2/provider/resto_search_provider.dart';
import 'package:resto_app_v2/widgets/search_page.dart';

class RestoSearchScreen extends StatefulWidget {
  static const routeName = '/resto-search';
  const RestoSearchScreen({Key? key}) : super(key: key);

  @override
  State<RestoSearchScreen> createState() => _RestoSearchScreenState();
}

class _RestoSearchScreenState extends State<RestoSearchScreen> {
  String queries = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RestoSearchProvider(
        apiService: ApiService(),
      ),
      child: Consumer<RestoSearchProvider>(builder: (context, state, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Pencarian'),
          ),
          body: Stack(
            children: [
              SafeArea(
                child: Container(
                    padding: const EdgeInsets.all(25),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "Cari restoran atau menu"),
                      onChanged: (String result) {
                        setState(
                          () {
                            queries = result;
                          },
                        );
                        state.fetchRestoQuery(result);
                      },
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: _buildRestoSearch(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildRestoSearch(BuildContext context) {
    return Consumer<RestoSearchProvider>(
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
              var resto = state.result!.restaurants[index];
              return SearchPage(restaurant: resto);
            },
            itemCount: state.result!.restaurants.length,
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
            child: Icon(
              Icons.content_paste_search_rounded,
              color: Colors.brown,
              size: 100,
            ),
          );
        }
      },
    );
  }
}
