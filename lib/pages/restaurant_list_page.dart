import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/restaurant.dart';
import 'package:restaurant_app/pages/restaurant_detail_page.dart';
import 'package:restaurant_app/platform_widget.dart';

class ArticleListPage extends StatelessWidget {
  ArticleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: buildAndroid,
      iosBuilder: buildiOS,
    );
  }

  Scaffold buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: _buildList(context),
    );
  }

  Widget buildiOS(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Restaurant App'),
      ),
      child: _buildList(context),
    );
  }

  FutureBuilder<String> _buildList(BuildContext context) {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
        builder: (context, snapshot) {
          final listArticle = parseArticle(snapshot.data);

          return ListView.builder(
              itemCount: listArticle.length,
              itemBuilder: (context, index) {
                return _buildArticleItem(context, listArticle[index]);
              });
        });
  }

  _buildArticleItem(BuildContext context, Restaurant article) {
    return Material(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            RestaurantDetailPage.routeName,
            arguments: article,
          );
        },
        contentPadding: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 1, color: Colors.grey)),
        leading: Image.network(
          article.urlToImage!,
          width: 100,
          errorBuilder: (context, error, stackTrace) => SizedBox(
            width: 100,
            child: Icon(Icons.error),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                article.restaurantName!,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
                child: RatingBar.builder(
              initialRating: double.parse(article.rating!),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 15,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )),
            RatingBar.builder(
              initialRating: double.parse(article.price!),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 15,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => Icon(
                Icons.attach_money,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ],
        ),
      ),
    );
  }
}
