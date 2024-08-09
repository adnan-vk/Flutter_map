import 'package:appscrip/view/detail_page/widgets/widgets.dart';
import 'package:appscrip/view/home/home.dart';
import 'package:appscrip/view/map/map_page.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int? index;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;
  final String? street;
  final String? suit;
  final String? city;
  final String? zipcode;
  final String? companyname;
  final String? catchPhrase;
  final String? bs;
  final double? lat;
  final double? lng;

  const DetailPage({
    super.key,
    required this.name,
    required this.index,
    required this.email,
    required this.phone,
    required this.username,
    required this.bs,
    required this.catchPhrase,
    required this.city,
    required this.companyname,
    required this.street,
    required this.suit,
    required this.zipcode,
    required this.website,
    required this.lat,
    required this.lng,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapPage(
                    longitude: double.parse(
                      lng.toString(),
                    ),
                    latitude: double.parse(
                      lat.toString(),
                    ),
                  ),
                ),
              );
            },
            child: text.textWidget(data: "Location", color: Colors.white),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            EneftyIcons.arrow_left_3_outline,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        title: text.textWidget(
          data: username!.toUpperCase(),
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DetailWidget().listTile(name, Icons.person, "Name"),
            DetailWidget().listTile(email, Icons.email, "Email"),
            DetailWidget().listTile(phone, Icons.phone, "Phone"),
            DetailWidget().listTile(username, Icons.person_outline, "Username"),
            DetailWidget().listTile(bs, Icons.business, "Business"),
            DetailWidget()
                .listTile(catchPhrase, Icons.campaign, "Catch Phrase"),
            DetailWidget().listTile(city, Icons.location_city, "City"),
            DetailWidget()
                .listTile(companyname, Icons.apartment, "Company Name"),
            DetailWidget().listTile(street, Icons.location_on, "Street"),
            DetailWidget()
                .listTile(suit, Icons.location_city_outlined, "Suite"),
            DetailWidget().listTile(zipcode, Icons.location_on, "Zipcode"),
            DetailWidget().listTile(website, Icons.web, "Website"),
          ],
        ),
      ),
    );
  }
}
