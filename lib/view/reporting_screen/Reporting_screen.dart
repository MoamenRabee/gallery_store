import 'package:flutter/material.dart';
import 'package:gallery_app/controllers/products_contoller.dart';
import 'package:get/get.dart';

class ReportingScreen extends StatelessWidget {
  ReportingScreen({Key? key}) : super(key: key);

  ProductController controller = Get.put(ProductController());

  var formKey = GlobalKey<FormState>();
  TextEditingController reportingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reporting"),
      ),
      body: GetBuilder<ProductController>(
        builder: (_){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: reportingController,
                    decoration: const InputDecoration(
                        hintText: "Reporting"
                    ),
                    validator: (val){
                      if(val!.isEmpty){
                        return "Enter Your Text";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0,),
                  controller.isLoadingReporting ? const Center(child: CircularProgressIndicator(),) : MaterialButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){

                        controller.addReporting(text: reportingController.text);

                      }
                    },
                    child: const Text("Save",style: TextStyle(color: Colors.white),),
                    color: Colors.blue,
                    minWidth: double.infinity,
                    height: 40.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
