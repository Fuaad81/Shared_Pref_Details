// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
        title: Text("Details"),
      ),
      body: ListView.builder(
        itemCount: widget.value.length,
        itemBuilder: (context, index) {
        return Container(
          color: Colors.orange,
          width: 350,
          height: 80,
          child: Column(
            children: [
              Text(widget.value[index]['name']),
              Text(widget.value[index]['dob']),
              Text(widget.value[index]['gender']),
              Text(widget.value[index]['number']),
              Text(widget.value[index]['email']),
              Text(widget.value[index]['address'])
            ],
          ),
        );
      },),
    );
  }
}