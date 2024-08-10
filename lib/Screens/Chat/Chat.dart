import 'package:allolab/Config/Color.dart';
import 'package:allolab/Models/messages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  String doctorId = 'doctor123';
  String patientId = 'patient456';

  String me = "doctor123";


List<Messages> getMessages() {

    List<Messages> messages = [
    Messages(
      senderId: doctorId,
      receiverId: patientId,
      type: 'text',
      message: 'Please describe your symptoms in detail.',
      timestamp: DateTime(2023, 11, 24, 10, 30),
    ),
    Messages(
      senderId: patientId,
      receiverId: doctorId,
      type: 'text',
      message: 'I have been experiencing headaches and dizziness for the past week.',
      timestamp: DateTime(2023, 11, 24, 10, 35),
    ),
    Messages(
      senderId: doctorId,
      receiverId: patientId,
      type: 'text',
      message: 'Have you noticed any other symptoms?',
      timestamp: DateTime(2023, 11, 24, 10, 40),
    ),
    // ... Add more messages as needed
  ];

  return messages;
  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            flexibleSpace: SafeArea(
              child: Container(
                padding: EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Stack(alignment: Alignment.bottomRight, children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          true
                            ? "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
                            : "fill user profile pic image"),
                        radius: 18,
                      ),
                      // OnlineDotIndicator(
                      //   uid: searchedUser.uid,
                      //   type: type,
                      // ),
                    ]),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                           "Senthil Kumar",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                                  "Online",
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 13),
                                ),
                        ],
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () async {
                    //     if (await Permissions
                    //         .cameraAndMicrophonePermissionsGranted()) {
                    //       DocumentSnapshot documentSnapshot = await fireStore
                    //           .collection("agent")
                    //           .doc(hospitalDocument)
                    //           .collection("healthWorker")
                    //           .doc(data.read("token"))
                    //           .get();
                    //       Users users = Users.fromMap(
                    //           documentSnapshot.data() as Map<String, dynamic>);
                    //       CallUtils.dial(
                    //         from: users,
                    //         to: searchedUser,
                    //         callType: "video",
                    //       );
                    //     } else {}
                    //   },
                    //   icon: Icon(
                    //     Icons.videocam,
                    //     color: PrimaryColor,
                    //     size: 30.0,
                    //   ),
                    // ),
                    // IconButton(
                    //   onPressed: () async {
                    //     if (await Permissions.microphonePermissionsGranted()) {
                    //       DocumentSnapshot documentSnapshot = await fireStore
                    //           .collection("agent")
                    //           .doc(hospitalDocument)
                    //           .collection("healthWorker")
                    //           .doc(data.read("token"))
                    //           .get();
                    //       Users users = Users.fromMap(
                    //           documentSnapshot.data() as Map<String, dynamic>);
                    //       CallUtils.dial(
                    //         from: users,
                    //         to: searchedUser,
                    //         callType: "voice",
                    //       );
                    //     } else {}
                    //   },
                    //   icon: Icon(
                    //     Icons.phone,
                    //     color: PrimaryColor,
                    //     size: 30.0,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Scrollbar(
                  radius: Radius.circular(4),
                  // controller: chatController.scrollController,
                  child:  true?ListView.builder(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            physics: AlwaysScrollableScrollPhysics(),
                            // controller: chatController.scrollController,
                            itemCount: 1,
                            shrinkWrap: true,
                            reverse: true,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(
                                    left: 14, right: 14, top: 8),
                                child: Align(
                                  alignment: (
                                      true
                                      ? Alignment.topRight
                                      : Alignment.topLeft),
                                  child: chatMessageView(
                                      getMessages(), index, context),
                                ),
                              );
                            },
                          ) :Center(child: Text("No messages"))
                      ,
                ),
              ),


              // bottom bar

              Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 6, right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                color: Black100,
                                borderRadius: BorderRadius.circular(35.0)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      // print("Emoji clicked");
                                      // chatController.emojiShowing.value =
                                      //     !chatController.emojiShowing.value
                                      //         .obs();
                                      // chatController.update();
                                    },
                                    child: Icon(
                                      Icons.emoji_emotions_rounded,
                                      color: Black700,
                                    )),
                                SizedBox(
                                  width: 4,
                                ),
                                Flexible(
                                  child: ConstrainedBox(
                                    constraints: new BoxConstraints(
                                      minHeight: 25.0,
                                      maxHeight: 135.0,
                                    ),
                                    child: TextField(
                                      onTap: () {},
                                      // controller: chatController.chatMessage,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      cursorColor: PrimaryColor,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.left,
                                      onChanged: (val) {},
                                      decoration: InputDecoration(
                                        hintText: "Type a message",
                                        hintStyle: TextStyle(fontSize: 18),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 5),
                                        filled: true,
                                        fillColor: Black100,
                                      ),
                                    ),
                                  ),
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Transform.rotate(
                                      angle: 100,
                                      child: InkWell(
                                        onTap: () => Get.bottomSheet(
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 18.0, bottom: 18.0),
                                            color: Get.isDarkMode
                                                ? darkGrey2
                                                : White,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                FloatingActionButton(
                                                    backgroundColor:
                                                        PrimaryColor,
                                                    elevation: 0,
                                                    tooltip: "Gallery",
                                                    onPressed: () async {
                                                      // chatController
                                                      //     .scrollController
                                                      //     .animateTo(
                                                      //   0.0,
                                                      //   curve: Curves.easeOut,
                                                      //   duration:
                                                      //       const Duration(
                                                      //           milliseconds:
                                                      //               300),
                                                      // );
                                                      // Navigator.pop(context);

                                                      // await chatController
                                                      //     .pickImage(
                                                      //         ImageSource
                                                      //             .gallery,
                                                      //         senderId:
                                                      //             data.read(
                                                      //                 "token"),
                                                      //         receiverId:
                                                      //             searchedUser
                                                      //                 .uid,
                                                      //         type: type);
                                                      // Fluttertoast.showToast(
                                                      //     msg:
                                                      //         "Image Sent Successfully",
                                                      //     backgroundColor:
                                                      //         PrimaryColor);
                                                    },
                                                    child: Icon(Icons.photo,
                                                        color: White)),
                                                FloatingActionButton(
                                                    backgroundColor:
                                                        PrimaryColor,
                                                    elevation: 0,
                                                    tooltip: "File",
                                                    onPressed: () async {
                                                      // chatController
                                                      //     .scrollController
                                                      //     .animateTo(
                                                      //   0.0,
                                                      //   curve: Curves.easeOut,
                                                      //   duration:
                                                      //       const Duration(
                                                      //           milliseconds:
                                                      //               300),
                                                      // );
                                                      // Navigator.pop(context);

                                                      // await chatController
                                                      //     .pickFile(
                                                      //         FileType.any,
                                                      //         senderId: data
                                                      //             .read(
                                                      //                 "token"),
                                                      //         receiverId:
                                                      //             searchedUser
                                                      //                 .uid,
                                                      //         type: type);
                                                      // Fluttertoast.showToast(
                                                      //     msg:
                                                      //         "Document Sent Succesfully",
                                                      //     backgroundColor:
                                                      //         PrimaryColor);
                                                    },
                                                    child: Icon(
                                                      Icons.file_copy,
                                                      color: White,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.attach_file_rounded,
                                          color: Black700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        // chatController.scrollController
                                        //     .animateTo(
                                        //   0.0,
                                        //   curve: Curves.easeOut,
                                        //   duration:
                                        //       const Duration(milliseconds: 300),
                                        // );
                                        // await chatController.pickImage(
                                        //     ImageSource.camera,
                                        //     senderId: data.read('token'),
                                        //     receiverId: searchedUser.uid,
                                        //     type: type);
                                        // Fluttertoast.showToast(
                                        //     msg: "Image Sent Successfully",
                                        //     backgroundColor: PrimaryColor);
                                      },
                                      child: Icon(
                                        Icons.camera_alt_rounded,
                                        color: Black700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                            height: 50,
                            width: 50,
                            child: FloatingActionButton(
                              onPressed: () {
                                // var text = chatController.chatMessage.text;
                                // Messages message;
                                // message = Messages(
                                //     receiverId: searchedUser.uid,
                                //     senderId: data.read("token"),
                                //     message: text,
                                //     timestamp: Timestamp.now(),
                                //     type: 'text');
                                // chatController.scrollController.animateTo(
                                //   0.0,
                                //   curve: Curves.easeOut,
                                //   duration: const Duration(milliseconds: 300),
                                // );
                                // chatController.sendMessageToDb(message, type);
                              },
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 22,
                              ),
                              backgroundColor: PrimaryColor,
                              elevation: 0,
                            )),
                      ],
                    ),
                  )),


            ]
          ),
    );
  }

    Widget chatMessageView(
      List<Messages> fullMessage, int index, BuildContext context) {
    DateTime timestamp = fullMessage[index].timestamp!;
    final DateTime dateTime = timestamp.toLocal();
    final dateString = DateFormat.jm().format(dateTime);
    final date = DateFormat("d MMM ").format(dateTime);
    final type = fullMessage[index].type;
    switch (type) {
      case 'image':
        return GestureDetector(
          onTap: () => showDialog(
              builder: (context) => Container(
                  color: Black,
                  height: Get.height,
                  width: Get.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back,
                            color: White,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      fullMessage[index].photoUrl != null
                          ? Expanded(
                              child: Center(
                                child: InteractiveViewer(
                                  child: CachedNetworkImage(
                                    imageUrl: fullMessage[index].photoUrl!,
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                ),
                              ),
                            )
                          : Center(child: CircularProgressIndicator()),
                    ],
                  )),
              context: context),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment:
                  (fullMessage[index].senderId == me
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start),
              children: [
                SizedBox(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: fullMessage[index].photoUrl!,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  date + ", " + dateString,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        );

      case 'text':
        return Container(
          constraints: BoxConstraints(maxWidth: 200),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: (fullMessage[index].senderId == me
                  ? PrimaryColor
                  : Black200)),
          padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: Column(
            crossAxisAlignment:
                (fullMessage[index].senderId == me
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start),
            children: [
              Text(
                fullMessage[index].message!,
                style: TextStyle(
                  fontSize: 16,
                  color: (fullMessage[index].senderId == me
                      ? White
                      : Black),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                date + ", " + dateString,
                style: TextStyle(
                  fontSize: 12,
                  color: (fullMessage[index].senderId == me
                      ? Colors.grey[300]
                      : Colors.grey),
                ),
              )
            ],
          ),
        );

      case 'file':
        return Container(
          constraints: BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: (fullMessage[index].senderId == me
                  ? PrimaryColor
                  : Black200)),
          padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24), color: White),
                  child: 
                  // chatController.messageIndex ==index &&
                  //             chatController.progress != 0.0
                  //         ? Stack(alignment: Alignment.center, children: [
                  //             CircularProgressIndicator(
                  //               value: chatController.progress.toDouble(),
                  //               valueColor:
                  //                   AlwaysStoppedAnimation<Color>(PrimaryColor),
                  //               backgroundColor: White,
                  //             ),
                  //             GestureDetector(
                  //               onTap: () {
                  //                 // FlutterDownloader.cancel(taskId: id!);
                  //               },
                  //               child: Icon(
                  //                 Icons.clear,
                  //                 color: PrimaryColor,
                  //               ),
                  //             )
                  //           ])
                  //         : 
                          GestureDetector(
                              onTap: () async {
                                // final status =
                                //     await Permission.storage.request();
                                // final externalDir =
                                //     await getExternalStorageDirectory();
                                // var a =
                                //     "${externalDir!.path}/${fullMessage[index].fileName}";

                                // bool fileExists = await File(a).exists();
                                // print(fileExists);
                                // if (fileExists) {
                                //   showDialog(
                                //       builder: (context) => Container(
                                //           color: Black,
                                //           height: Get.height,
                                //           width: Get.width / 2,
                                //           child: Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: [
                                //               Material(
                                //                 color: Colors.transparent,
                                //                 child: IconButton(
                                //                   onPressed: () =>
                                //                       Navigator.pop(context),
                                //                   icon: Icon(
                                //                     Icons.arrow_back,
                                //                     color: White,
                                //                   ),
                                //                 ),
                                //               ),
                                //               SizedBox(
                                //                 height: 20,
                                //               ),
                                //               Expanded(
                                //                 child: Center(
                                //                   child: Image.file(
                                //                     File(a),
                                //                     fit: BoxFit.contain,
                                //                   ),
                                //                 ),
                                //               ),
                                //             ],
                                //           )),
                                //       context: context);
                                // } else {
                                //   if (status.isGranted) {
                                //     final externalDir =
                                //         await getExternalStorageDirectory();
                                //     chatController.onMessageIndex(index);
                                //     id = (await FlutterDownloader.enqueue(
                                //         url: fullMessage[index].fileUrl!,
                                //         savedDir: externalDir!.path,
                                //         fileName: fullMessage[index].fileName,
                                //         openFileFromNotification: true,
                                //         showNotification: true))!;
                                //   } else {
                                //     print("permission denied");
                                //   }
                                // }
                              },
                              child: Icon(
                                Icons.arrow_downward,
                                color: PrimaryColor,
                              ),
                            )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      (fullMessage[index].senderId == me
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start),
                  children: [
                    Text(
                      fullMessage[index].fileName!,
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            (fullMessage[index].senderId == me
                                ? White
                                : Black),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          fullMessage[index].fileSize!,
                          style: TextStyle(
                            fontSize: 12,
                            color: (fullMessage[index].senderId ==
                                    me
                                ? Colors.grey[300]
                                : Black),
                          ),
                        ),

                        // GetBuilder<ChatController>(
                        //     builder: (chatController) =>
                        //         chatController.messageIndex == index &&
                        //                 chatController.progress != 0.0
                        //             ? Text(
                        //                 (chatController.progress * 100)
                        //                         .toInt()
                        //                         .toString() +
                        //                     "%",
                        //                 style: TextStyle(
                        //                   fontSize: 12,
                        //                   color: (fullMessage[index].senderId ==
                        //                           me
                        //                       ? Colors.grey[300]
                        //                       : Black),
                        //                 ))
                        //             : Container()),
                        Text(
                          date + ", " + dateString,
                          style: TextStyle(
                            fontSize: 12,
                            color: (fullMessage[index].senderId ==
                                    me
                                ? Colors.grey[300]
                                : Colors.grey),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }
}