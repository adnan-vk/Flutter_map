import 'dart:developer';

import 'package:appscrip/controller/user_controller.dart';
import 'package:appscrip/model/user_model.dart';
import 'package:appscrip/view/detail_page/detail_page.dart';
import 'package:appscrip/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final text = Widgets();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final userController = Provider.of<UserController>(context, listen: false);
    userController.loadUser();
    userController.getUser();
  }

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: text.textWidget(data: "User Details", color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => userController.search(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: "Search...",
                prefixIcon: Icon(Icons.search, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: FutureBuilder(
                future: userController.getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return Consumer<UserController>(
                      builder: (context, userController, child) {
                        if (userController.allUsers.isEmpty) {
                          return const Center(
                            child: Text(
                              "No users available",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          );
                        } else {
                          return RefreshIndicator(
                            onRefresh: () => userController.refresh(),
                            child: ListView.builder(
                              itemCount: userController.searchedList.length,
                              itemBuilder: (context, index) {
                                UserModel item =
                                    userController.searchedList[index];
                                double lat =
                                    double.parse(item.address!.geo!.lat!);
                                log("lat log home : ${item.address!.geo!.lat}");
                                double lng =
                                    double.parse(item.address!.geo!.lng!);
                                return Card(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  elevation: 4.0,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 16.0),
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.teal,
                                      child: text.textWidget(
                                          data: item.name![0].toUpperCase(),
                                          color: Colors.white),
                                    ),
                                    title: text.textWidget(
                                      data: item.name,
                                      color: Colors.teal,
                                      weight: FontWeight.bold,
                                      size: 16.0,
                                    ),
                                    subtitle: text.textWidget(
                                      data: item.email,
                                      color: Colors.grey[600],
                                      size: 14.0,
                                    ),
                                    trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.teal),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                            index: index,
                                            name: item.name,
                                            email: item.email,
                                            phone: item.phone,
                                            username: item.username,
                                            bs: item.company!.bs,
                                            catchPhrase:
                                                item.company!.catchPhrase,
                                            city: item.address!.city,
                                            companyname: item.company!.name,
                                            street: item.address!.street,
                                            suit: item.address!.suit,
                                            zipcode: item.address!.zipcode,
                                            website: item.website,
                                            lat: lat,
                                            lng: lng,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
