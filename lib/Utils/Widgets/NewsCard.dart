import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      height: 85,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 2)),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830__340.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 22.0, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Information Seminar",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff0B5964),
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Tuesday, 14/2/2023",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
