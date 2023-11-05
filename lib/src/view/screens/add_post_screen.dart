import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/service.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePostScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
            'Create Post',
          style: GoogleFonts.acme(
            fontSize: 26,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  prefixIcon: Icon(Icons.newspaper_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: bodyController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.padding_sharp),
                  labelText: "Body",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  child: Text(
                      'Submit',
                    style: GoogleFonts.acme(
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () async {
                    var title = titleController.text;
                    var body = bodyController.text;
                    var newPost = await ApiService().createPost(title, body, 1);

                    if(newPost != null){
                      Get.snackbar('', 'body send successfully',backgroundColor: Colors.white24);
                    }else{
                    Get.snackbar('', 'error',backgroundColor: Colors.white24);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}