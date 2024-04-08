// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_element, sort_child_properties_last, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_pref_detail/details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  XFile? pick;
  File? image;
  var date;

  void pickdate() {
    setState(() {
      selectDate = date;
    });
  }

  DateTime? selectDate;
  String? Gender = '';

  var name = TextEditingController();
  var number = TextEditingController();
  var email = TextEditingController();
  var address = TextEditingController();

  var list=[];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add your details",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        child: image == null
                            ? null
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.orange, width: 4)),
                      ),
                      Align(
                        child: InkWell(
                          onTap: () async {
                            ImagePicker picked = ImagePicker();
                            pick = await picked.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              image = File(pick!.path);
                            });
                          },
                          child: Container(
                            width: width / 10,
                            height: height / 20,
                            decoration: BoxDecoration(
                              color: Colors.amber[200],
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: Icon(Icons.add_a_photo_outlined),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: [
                  Text(
                    "Name",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    )),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width - 30,
                  height: height / 15,
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        hintText: "enter your name",
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder()),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        "Date of birth",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: selectDate != null
                                  ? DateFormat('dd-mm-yyyy').format(date)
                                  : 'Enter DOB',
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1999, 1, 1),
                                        lastDate: DateTime(2100, 1, 1));
                                    pickdate();
                                  },
                                  icon: Icon(Icons.calendar_month_outlined)),
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder()),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 30),
                      child: Text(
                        "Gender",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: RadioListTile(
                                fillColor:
                                    MaterialStatePropertyAll(Colors.orange),
                                activeColor: Colors.orange,
                                title: Text('Male'),
                                value: 'male',
                                groupValue: Gender,
                                onChanged: (value) {
                                  setState(() {
                                    Gender = value.toString();
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 160,
                            height: 40,
                            child: RadioListTile(
                                activeColor: Colors.orange,
                                fillColor:
                                    MaterialStatePropertyAll(Colors.orange),
                                title: Text('Female'),
                                value: 'female',
                                groupValue: Gender,
                                onChanged: (value) {
                                  setState(() {
                                    Gender = value.toString();
                                  });
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    "Number",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    )),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width - 30,
                  height: 50,
                  child: TextFormField(
                    controller: number,
                    decoration: InputDecoration(
                        hintText: "enter mobile number",
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder()),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: [
                  Text(
                    "Email",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    )),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width - 30,
                  height: 50,
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        hintText: "enter mail id",
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder()),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: [
                  Text(
                    "Address",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    )),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width - 30,
                  height: 140,
                  child: TextFormField(
                    controller: address,
                    maxLines: 4,
                    decoration: InputDecoration(
                        hintText: "enter your Address",
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder()),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: (){
                  list.add({
                    'name' : name.text,
                    'dob' : selectDate,
                    'gender': Gender,
                    'number': number.text,
                    'email': email.text,
                    'address' : address.text
                  });
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => Details(value : list),));
                },
                child: Container(
                  width: width - 30,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Icon(Icons.arrow_forward,color: Colors.white,size: 40,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
