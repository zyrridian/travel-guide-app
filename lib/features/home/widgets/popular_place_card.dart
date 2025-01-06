import 'package:flutter/material.dart';

class PopularPlaceCard extends StatelessWidget {
  const PopularPlaceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 240,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/fuji.jpg',
                    width: double.infinity,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Mount Fuji',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 18,
                  color: Colors.grey[600],
                ),
                SizedBox(width: 4),
                Text(
                  "Kyoto, Japan",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "4.8",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.reviews,
                      size: 18,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "200 reviews",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
