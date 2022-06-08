import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/models/caller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  var data;

  set currentPage(int currentPage) {}
  Future<void> getUserApi() async {
    final response = await http.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, color: Colors.black)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Shop',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart, color: Colors.black)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart, color: Colors.black)),
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: getUserApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  childAspectRatio: 2 / 3,
                  children: List.generate(data.length, (index) {
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 200,
                                width: 150,
                                child: Image(
                                    image: NetworkImage(
                                        data[index]['image_link'].toString())),
                              ),
                            ],
                          ),
                          Caller(
                              title: 'price',
                              value: data[index]['price'].toString()),
                        ],
                      ),
                    );
                  }),
                );
              }
            },
          )),
        ],
      ),
    );
  }
}
