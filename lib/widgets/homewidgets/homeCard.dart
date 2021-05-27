import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget homeCard(
        {BuildContext context,
        String cardImage,
        String cardText,
        Widget category}) =>
    GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => category));
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.withOpacity(0.2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black.withOpacity(0.6),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 170,
              child: CachedNetworkImage(
                imageUrl: cardImage,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      cardText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey[700]),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
