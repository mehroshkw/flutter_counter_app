import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
}
class Home extends StatelessWidget {

  @override
  Widget build(context) {

    final Controller c = Get.put(Controller());

    return Scaffold(
      backgroundColor: const Color(0xffF4DAD3),
        appBar: AppBar(backgroundColor: const Color(0xffD46E56),
                  title: const Text("Counter App")
                  ),

        body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage("assets/images/logo.png"),
                  width: 200,
                  height: 200,),
                  SizedBox(height: 80,),
                  Obx(() => Text("Number of Clicks: ${c.count}",
                      style: const TextStyle(
                        fontSize: 24,
                        color: Color(0xffD46E56)
                      )
                    )),
                    ElevatedButton(
                    child: Text("Click to Navigate to Other Screen"),
                        onPressed: () => Get.to(Other()),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffD46E56),
                    ),),
                ],
              )),
              floatingActionButton:
              FloatingActionButton(child: const Icon(Icons.add),
                                    onPressed: c.increment,
                                    backgroundColor: const Color(0xffD46E56),));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context){
    // Access the updated count variable
    return Scaffold(backgroundColor: const Color(0xffF4DAD3),
              appBar: AppBar(backgroundColor: const Color(0xffD46E56),
                  title: const Text("Counter App")
              ),
              body: Center(child: Text("${c.count}")));
  }
}