import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:konect_desktop/database/NotificationData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excl;

import 'CustomDesign.dart';


class PiGenerator extends StatefulWidget {



  const PiGenerator({Key? key}) : super(key: key);

  @override
  State<PiGenerator> createState() => _PiGeneratorState();
}


class _PiGeneratorState extends State<PiGenerator> {

  List customDesigns = [];



  html.File? _selectedImage;
  Uint8List? _selectedImageBytes;
  String? imageUrl;
  String? name;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isAuthenticated = prefs.getBool('auth');
    imageUrl = prefs.getString("imageUrl");
    name = prefs.getString("name");
    setState(() {

    });
  }


  Future<void> _pickImage() async {
    html.FileUploadInputElement input = html.FileUploadInputElement()..accept = 'image/*';
    input.click();

    input.onChange.listen((event) {
      if (input.files != null && input.files!.isNotEmpty) {
        final reader = html.FileReader();
        reader.readAsArrayBuffer(input.files!.first);
        reader.onLoad.listen((event) {
          setState(() {
            _selectedImageBytes = reader.result as Uint8List;
            _selectedImage = input.files!.first;
          });
        });
      }
    });
  }

  Future<void> _downloadExcel(List<int> bytes) async {
    final html.Blob blob = html.Blob([Uint8List.fromList(bytes)]);
    final String url = html.Url.createObjectUrlFromBlob(blob);
    final html.AnchorElement anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "generated_excel.xlsx")
      ..click();
    html.Url.revokeObjectUrl(url);
  }



  Future<void> _addImageToExcel() async {
    final excl.Workbook workbook = excl.Workbook();
    final excl.Worksheet sheet = workbook.worksheets[0];


    if (_selectedImageBytes != null) {
      final String base64Image = base64Encode(_selectedImageBytes!);
      sheet.pictures.addBase64(10, 10, base64Image);
    }

    // Save the Excel data as bytes.
    final List<int> bytes = workbook.saveAsStream();

    // Dispose the document.
    workbook.dispose();

    // Download the Excel file.
    await _downloadExcel(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ListView.builder(
              itemBuilder: (BuildContext context , int index ){
                return customDesigns[index];
              },
              itemCount: customDesigns.length,
              ),
          ),
          ElevatedButton(onPressed: (){
              setState(() {
                customDesigns.add(CustomDesignLayout());
              });
              },
              child: Text("Add more"))
        ],
      ),
    );
  }

  Widget salesItem(List<Map<String, dynamic>> dataList) => ListView.separated(
    shrinkWrap: true,
    padding: const EdgeInsets.all(20),
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemBuilder: (BuildContext context, int index) {
      Map<String, dynamic>? query = dataList[index]["query"];
      String? genderValue;

      if (query != null && query.containsKey("Gender")) {
        genderValue = query["Gender"].toString();
      } else {
        genderValue = "N/A";
      }

      return Card(
        elevation: 10,
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("This is button")),

          ],
        ),
      );
    },
    itemCount: dataList.length,
  );




  Widget buildItems(List<Map<String, dynamic>> dataList) => ListView.separated(
    shrinkWrap: true,
    padding: const EdgeInsets.all(8),
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text(
          dataList[index]["description"].toString(),
        ),
        subtitle: Text(
          dataList[index]["documentId"].toString(),
        ),
      );
    },
    itemCount: dataList.length,
  );
}

/*
* Column(
        children: [
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Select Image'),
          ),
          _selectedImageBytes != null
              ? Image.memory(
            _selectedImageBytes!,
            height: 200,
            width: 200,
          )
              : SizedBox(),
          ElevatedButton(
            onPressed: _addImageToExcel,
            child: Text('Generate Excel'),
          ),
        ],
      ),
* */

/*
* builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<Map<String, dynamic>> dataList = snapshot.data!;
                  return salesItem(dataList);
                } else {
                  // Handle the case when data is null
                  return const Text("Data is null");
                }
              }
              return const Center(child: CircularProgressIndicator());
            },
*
* */
