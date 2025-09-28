import 'package:flutter/material.dart';
import 'package:nusacodes_final_project/constants/detail_home.dart';
import 'package:nusacodes_final_project/pages/detail_home_page.dart';
import 'package:nusacodes_final_project/widgets/banner_widget.dart';
import 'package:nusacodes_final_project/widgets/home_card.dart';
import 'package:nusacodes_final_project/widgets/promo_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner Section
            const BannerWidget(),
            // Welcome Section
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 16),
                  Column(
                    children: [
                      Text(
                        'Welcome to Rumah Impian!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8.0,
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: Text(
                          'Temukan rumah impian Anda dengan mudah dan cepat.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Promo Section
            Divider(thickness: 1, color: Colors.grey[300]),
            Text(
              'Hot Promo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const PromoWidget(),
            // products card
            Divider(thickness: 1, color: Colors.grey[300]),
            Text(
              'Popular Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Jelajahi desain rumah terpopuler kami dan temukan pilihan yang sempurna untuk Anda.',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            // const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 275,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: detailProducts.length,
                  itemBuilder: (context, index) {
                    final house = detailProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailHomePage(house: house),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 200, // kasih lebar untuk tiap card
                        child: HomeCard(house: house),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
