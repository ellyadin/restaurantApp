// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key, required this.restaurant});

  static const routeName = '/restaurant-detail';
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.restaurantName!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              restaurant.urlToImage!,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.description!),
                  Divider(),
                  Text(
                    restaurant.restaurantName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Rating : ${restaurant.rating}')),
                      RatingBar.builder(
                        initialRating: double.parse(restaurant.price!),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.attach_money,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  ),
                  Text('Address : ${restaurant.address}'),
                  Divider(),
                  Text('Top Review: ${restaurant.review!}'),
                  SizedBox(height: 16),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(
                  //         context,
                  //         RestaurantWebview.routeName,
                  //         arguments: restaurant.url,
                  //       );
                  //     },
                  //     child: Text('Read More..'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
