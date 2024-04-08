// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_pref_detail/home.dart';

class Details extends StatefulWidget {
  List value;
  Details({super.key, required this.value});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: (){
              widget.value.clear();
              Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MyHomePage(),));
            },
            icon: Icon(Icons.arrow_back)),
          Expanded(
            child: ListView.builder(
              itemCount: widget.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)),
                    width: 350,
                    height: 200,
                    child: Row(
                      
                      children: [
                        Image.file(
                          widget.value[index]['image'],
                          width: 150,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.value[index]['name']),
                            Text(widget.value[index]['dob']),
                            Text(widget.value[index]['gender']),
                            Text(widget.value[index]['number']),
                            Text(widget.value[index]['email']),
                            Text(widget.value[index]['address'])
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
