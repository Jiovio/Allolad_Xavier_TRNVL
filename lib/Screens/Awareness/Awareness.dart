import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class Awareness extends StatelessWidget {
  const Awareness({super.key});

  @override
  Widget build(BuildContext context) {
    return true?Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
                body: Center(
                  child: Text(
                    "Sorry No Awareness Post Found",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ):Scaffold();
              
              // StoryView(
              //   // controller: controller,
              //   controller: controller,

              //   repeat: true,
              //   inline: true,
              //   onComplete: () => Navigator.pop(context),
              //   onVerticalSwipeComplete: (direction) {
              //     if (direction == Direction.down) {
              //       Navigator.pop(context);
              //     }
              //   },
              //   storyItems: List.generate(
              //       awarenessController.awareness.length,
              //       (index) => StoryItem.pageImage(
              //           url: awarenessController.awareness[index],
              //           controller: controller,
              //           duration: Duration(seconds: 10)))
                        
              //           );
  }
}