
import 'dart:async';

import 'package:allolab/Config/Color.dart';
import 'package:allolab/Config/OurFirebase.dart';
import 'package:allolab/Models/messages.dart';
import 'package:allolab/db/dbHelper.dart';
import 'package:allolab/db/sqlite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher ; 
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher ; 
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as Io;
import 'dart:io' ;
import 'dart:convert' as convert;

class Chat extends StatefulWidget {
  String title;
  String chatId;
  String p2;
  String p1;
  String p1Name;
  String p2Name;

  Chat({super.key, required this.title, required this.chatId, required this.p2, required this.p1, 
  required this.p1Name , required this.p2Name});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  List<Messages> messages = [];
  final ScrollController _scrollController = ScrollController();

  

  TextEditingController textInput = TextEditingController();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference _chatsCollection = _firestore.collection('chats');

  void submit() async {

    String type = "text";

    if(image!=null){
      type = "image";
    }

    // insertMessage(id: widget.chatId,
    // senderId: widget.p1,
    // receiverId: widget.p2,
    // message: textInput.text,
    // timestamp: DateTime.now()
    // );

    // print(messages);

    Messages msg = Messages(
    id: widget.chatId,
    senderId: widget.p1,
    receiverId: widget.p2,
    message: textInput.text,
    timestamp: DateTime.now(),
    type: type
    );

    final chatDetails = {
      "p1Name":widget.p1Name,
      "p2Name":widget.p2Name
    };

    await OurFirebase.addMessages(msg,widget.p2,chatDetails);
    

    messages.add(msg);

    await insertMessage(id: widget.chatId,
    senderId: widget.p1,
    receiverId: widget.p2,
    message: textInput.text,
    timestamp: DateTime.now(),
    type: type);

    textInput.text = "";

    setState((){
    });
  
  }

  static Future<void> insertMessage({
    required String id,
    required String senderId,
    required String receiverId,
    required String message,
    required DateTime timestamp,
    String type = 'text',
  }) async {
    await _chatsCollection.add({
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
      'type': type,
    });
  }

  static Future<List<Messages>> getMessages(int limit, int offset) async {
    QuerySnapshot querySnapshot = await _chatsCollection
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .get();

    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Messages(
        id: data['id'],
        senderId: data['senderId'],
        receiverId: data['receiverId'],
        message: data['message'],
        timestamp: (data['timestamp'] as Timestamp).toDate(),
        type: data['type'],
      );
    }).toList();
  }

  static Stream<List<Messages>> getMessagesStream(String chatId) {
    return _chatsCollection
        .where('id', isEqualTo: chatId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Messages(
          id: data['id'],
          senderId: data['senderId'],
          receiverId: data['receiverId'],
          message: data['message'],
          timestamp: (data['timestamp'] as Timestamp).toDate(),
          type: data['type'],
        );
      }).toList();
    });
  }

  static Future<void> updateMessage(String messageId, Map<String, dynamic> data) async {
    await _chatsCollection.doc(messageId).update(data);
  }

  static Future<void> deleteMessage(String messageId) async {
    await _chatsCollection.doc(messageId).delete();
  }



  final picker = ImagePicker();
  late var fileImage64;

   File? image;

  Future getImageFromCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 20);
    if (pickedFile != null) {
      final bytes = await Io.File(pickedFile.path).readAsBytes();
      fileImage64 = convert.base64Encode(bytes);
      image = File(pickedFile.path);

      Fluttertoast.showToast(
          msg: "Report Updated Successfully", backgroundColor: PrimaryColor);
    } else {
      print('No image selected.');
    }
  setState(() {
    
  });
  }

    Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 20,
    );
    if (pickedFile != null) {
      final bytes = await Io.File(pickedFile.path).readAsBytes();
      fileImage64 = convert.base64Encode(bytes);
      image = File(pickedFile.path);

      Fluttertoast.showToast(
          msg: "Report Updated Successfully", backgroundColor: PrimaryColor);
    } else {
      print('No image selected.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                                  widget.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )
                              ,
                          SizedBox(
                            height: 1,
                          ),

                                 Text(
                                  "Online",
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 13),
                                ),

                          // StreamBuilder<DocumentSnapshot>(
                          //     stream: title == "Doctor"
                          //         ? MainScreenController().getUserStream(
                          //             uID: chatController
                          //                 .doctorDetails.value.uid!,
                          //             type: "Doctor")
                          //         : MainScreenController().getUserStream(
                          //             uID: chatController
                          //                 .healthWorkerDetails.value.uid!,
                          //             type: "HealthWorker"),
                          //     builder: (context, snapshot) {
                          //       Users? users;
                          //       if (snapshot.hasData &&
                          //           snapshot.data!.data() != null) {
                          //         users = Users.fromMap(snapshot.data!.data()
                          //             as Map<String, dynamic>);
                          //       }
                          //       return Text(
                          //         "${users?.status}",
                          //         style: TextStyle(
                          //             color: Colors.grey.shade600,
                          //             fontSize: 13),
                          //       );
                          //     }),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () async {

                        // createChatTable();
                        // if (await Permissions
                        //     .cameraAndMicrophonePermissionsGranted()) {
                        //   DocumentSnapshot documentSnapshot = await fireStore
                        //       .collection(patientCollection)
                        //       .doc(authUser!.uid)
                        //       .get();
                        //   Users users = Users.fromMap(
                        //       documentSnapshot.data() as Map<String, dynamic>);
                        //   CallUtils.dial(
                        //     from: users,
                        //     to: searchedUser,
                        //     callType: "video",
                        //   );
                        // } else {}
                      },
                      icon: Icon(
                        Icons.videocam,
                        color: PrimaryColor,
                        size: 30.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                       widget.title == 'Doctor' ? await urlLauncher.launch('tel:04523500629') : await urlLauncher.launch('tel:04523500630');
                        // if (await Permissions.microphonePermissionsGranted()) {
                        //   DocumentSnapshot documentSnapshot = await fireStore
                        //       .collection(patientCollection)
                        //       .doc(authUser!.uid)
                        //       .get();
                        //   Users users = Users.fromMap(
                        //       documentSnapshot.data() as Map<String, dynamic>);
                        //   CallUtils.dial(
                        //     from: users,
                        //     to: searchedUser,
                        //     callType: "voice",
                        //   );
                        // } else {}
                      
                      },
                      icon: Icon(
                        Icons.phone,
                        color: PrimaryColor,
                        size: 30.0,
                      ),
                    ),
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
                    controller: _scrollController,
                    
 child : StreamBuilder<List<Messages>>(
      stream: getMessagesStream(widget.chatId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Text('Error: ${snapshot.error}'));

        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No messages yet'));
        }

        List<Messages> messages = snapshot.data!;

        return ListView.builder(
          itemCount: messages.length,
          shrinkWrap: true,
          reverse: true, // To show latest messages at the bottom
          padding: EdgeInsets.only(top: 10, bottom: 10),
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(left: 14, right: 14, top: 8),
              child: Align(
                alignment: (messages[index].senderId == widget.p1
                    ? Alignment.topRight
                    : Alignment.topLeft),
                child: chatMessageView(messages, index, widget.p1, context),
              ),
            );
          },
        );
      },
    )
                        
                        ),
              ),
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
                                      // print("Clicked Emoji Picker");
                                      emojiContainer();
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
                                      controller: textInput,
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

                                                    },
                                                    child: Icon(Icons.photo,
                                                        color: White)),
                                                FloatingActionButton(
                                                    backgroundColor:
                                                        PrimaryColor,
                                                    elevation: 0,
                                                    tooltip: "File",
                                                    onPressed: () async {
                                                     
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
                                        // title == "Doctor"
                                        //     ? await chatController.pickImage(
                                        //         ImageSource.camera,
                                        //         senderId: FirebaseAuth
                                        //             .instance.currentUser!.uid,
                                        //         receiverId: chatController
                                        //             .doctorDetails.value.uid!,
                                        //         type: title,
                                        //         receiverDetails: searchedUser)
                                        //     : await chatController.pickImage(
                                        //         ImageSource.camera,
                                        //         senderId: FirebaseAuth
                                        //             .instance.currentUser!.uid,
                                        //         receiverId: chatController
                                        //             .healthWorkerDetails
                                        //             .value
                                        //             .uid!,
                                        //         type: title,
                                        //         receiverDetails: searchedUser);
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
                                submit();
                                // var text = chatController.chatMessage.text;
                                // if (text != "") {
                                //   Messages message;
                                //   title == "Doctor"
                                //       ? message = Messages(
                                //           receiverId: chatController
                                //               .doctorDetails.value.uid,
                                //           senderId: FirebaseAuth
                                //               .instance.currentUser?.uid,
                                //           message: text,
                                //           timestamp: Timestamp.now(),
                                //           type: 'text')
                                //       : message = Messages(
                                //           receiverId: chatController
                                //               .healthWorkerDetails.value.uid,
                                //           senderId: FirebaseAuth
                                //               .instance.currentUser?.uid,
                                //           message: text,
                                //           timestamp: Timestamp.now(),
                                //           type: 'text');
                                //   chatController.scrollController.animateTo(
                                //     0.0,
                                //     curve: Curves.easeOut,
                                //     duration: const Duration(milliseconds: 300),
                                //   );
                                //   String? senderName = title == "Doctor"
                                //       ? chatController.doctorDetails.value.name
                                //       : chatController
                                //           .healthWorkerDetails.value.name;
                                //   String? deviceToken = title == "Doctor"
                                //       ? chatController
                                //           .doctorDetails.value.fcmToken
                                //       : chatController
                                //           .healthWorkerDetails.value.fcmToken;
                                //   chatController.sendMessageToDb(
                                //       message, title, senderName, deviceToken);
                                // }
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
              Offstage(
                // offstage: !chatController.emojiShowing.value,
                child: SizedBox(
                  height: 250,
                  child: emojiContainer(),
                ),
              ),
              
            ],
          ),
        

      
      );
    
  }
}

String testUID = "2";


  Widget chatMessageView(
      List<Messages> fullMessage, int index,String p1, BuildContext context) {
    DateTime timestamp = fullMessage[index].timestamp!;
    final String dateTime = "14-07-23";
    final dt = fullMessage[index].timestamp;
    final dateString = DateFormat.jm().format(dt!);
    final date = DateFormat("d MMM ").format(dt);
    final type = fullMessage[index].type;
    switch (type) {
      case 'image':
        return GestureDetector(
          onTap: () => showDialog(
              builder: (context) => Container(
                  color: Black,
                  height: Get.height,
                  width: Get.width * 0.8,
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
                        height: 10,
                      ),
                      fullMessage[index].photoUrl != null
                          ? Center(
                              child: SizedBox(
                                height: Get.height * 0.8,
                                width: Get.width * 0.8,
                                child: InteractiveViewer(
                                  child: CachedNetworkImage(
                                    imageUrl: fullMessage[index].photoUrl!,
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
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
              crossAxisAlignment: (fullMessage[index].senderId == p1
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: fullMessage[index].photoUrl!,
                    placeholder: (context, url) => CircularProgressIndicator(),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  date + "," + dateString,
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
              color: (fullMessage[index].senderId ==
                      p1
                  ? PrimaryColor
                  : Black200)),
          padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: (fullMessage[index].senderId ==
                    p1
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start),
            children: [
              Text(
                fullMessage[index].message!,
                style: TextStyle(
                  fontSize: 16,
                  color: (fullMessage[index].senderId ==
                          testUID
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
                  color: (fullMessage[index].senderId ==
                          testUID
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
              color: (fullMessage[index].senderId ==
                      testUID
                  ? PrimaryColor
                  : Black200)),
          padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Container(
              //     height: 42,
              //     width: 42,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(24), color: White),
              //     child: GetBuilder<ChatController>(
              //         builder: (chatController) => chatController
              //                         .messageIndex ==
              //                     index &&
              //                 chatController.progress != 0.0
              //             ? Stack(alignment: Alignment.center, children: [
              //                 CircularProgressIndicator(
              //                   value: chatController.progress.toDouble(),
              //                   valueColor:
              //                       AlwaysStoppedAnimation<Color>(PrimaryColor),
              //                   backgroundColor: White,
              //                 ),
              //                 GestureDetector(
              //                   onTap: () {
              //                     FlutterDownloader.cancel(taskId: id);
              //                   },
              //                   child: Icon(
              //                     Icons.clear,
              //                     color: PrimaryColor,
              //                   ),
              //                 )
              //               ])
              //             : GestureDetector(
              //                 onTap: () async {
              //                   final status =
              //                       await Permission.storage.request();
              //                   final externalDir =
              //                       await getExternalStorageDirectory();
              //                   var a =
              //                       "${externalDir!.path}/${fullMessage[index].fileName}";

              //                   bool fileExists = await File(a).exists();
              //                   print(fileExists);
              //                   if (fileExists) {
              //                     showDialog(
              //                         builder: (context) => Container(
              //                             color: Black,
              //                             height: Get.height,
              //                             width: Get.width / 2,
              //                             child: Column(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: [
              //                                 Material(
              //                                   color: Colors.transparent,
              //                                   child: IconButton(
              //                                     onPressed: () =>
              //                                         Navigator.pop(context),
              //                                     icon: Icon(
              //                                       Icons.arrow_back,
              //                                       color: White,
              //                                     ),
              //                                   ),
              //                                 ),
              //                                 SizedBox(
              //                                   height: 20,
              //                                 ),
              //                                 Expanded(
              //                                   child: Center(
              //                                     child: Image.file(
              //                                       File(a),
              //                                       fit: BoxFit.contain,
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ],
              //                             )),
              //                         context: context);
              //                   } else {
              //                     if (status.isGranted) {
              //                       final externalDir =
              //                           await getExternalStorageDirectory();
              //                       chatController.onMessageIndex(index);
              //                       id = (await FlutterDownloader.enqueue(
              //                           url: fullMessage[index].fileUrl!,
              //                           savedDir: externalDir!.path,
              //                           fileName: fullMessage[index].fileName,
              //                           openFileFromNotification: true,
              //                           showNotification: true))!;
              //                     } else {
              //                       print("permission denied");
              //                     }
              //                   }
              //                 },
              //                 child: Icon(
              //                   Icons.arrow_downward,
              //                   color: PrimaryColor,
              //                 ),
              //               ))),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: (fullMessage[index].senderId ==
                         testUID
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start),
                  children: [
                    Text(
                      fullMessage[index].fileName!,
                      style: TextStyle(
                        fontSize: 16,
                        color: (fullMessage[index].senderId ==
                                testUID
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
                            color: (fullMessage[index].senderId == p1
                                ? Colors.grey[300]
                                : Black),
                          ),
                        ),
                                // chatController.messageIndex == index &&
                                //         chatController.progress != 0.0
                                //     ? Text(
                                //         (chatController.progress * 100)
                                //                 .toInt()
                                //                 .toString() +
                                //             "%",
                                //         style: TextStyle(
                                //           fontSize: 12,
                                //           color: (fullMessage[index].senderId == 2

                                //               ? Colors.grey[300]
                                //               : Black),
                                //         ))
                                //     : Container(),
                                      Text(
                                        // (chatController.progress * 100)
                                        //         .toInt()
                                        //         .toString() 
                                                "90"
                                                +
                                            "%",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: (fullMessage[index].senderId == p1

                                              ? Colors.grey[300]
                                              : Black),
                                        )),

                        Text(
                          date + ", " + dateString,
                          style: TextStyle(
                            fontSize: 12,
                            color: (fullMessage[index].senderId == p1
                                    
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

    emojiContainer() {
    // print("working");
    return EmojiPicker(

      onEmojiSelected: (category, emoji) {
        // chatController.onEmojiSelected(emoji);
      },
      // onBackspacePressed: chatController.onBackspacePressed(),
      config:const  Config(
emojiViewConfig: EmojiViewConfig(
            columns: 7,
          emojiSizeMax: 32.0,
          verticalSpacing: 0,
          horizontalSpacing: 0,
          recentsLimit: 28,
          buttonMode: ButtonMode.MATERIAL
          ),

          categoryViewConfig: CategoryViewConfig(
          initCategory: Category.RECENT,
          indicatorColor: Colors.blue,
          iconColor: Colors.grey,
          iconColorSelected: Colors.blue,
          categoryIcons: const CategoryIcons(),
          ),



      // bottomActionBarConfig: BottomActionBarConfig(                      
      //   bgColor: Color(0xFFF2F2F2),
      //     progressIndicatorColor: Colors.blue,
      //     showRecentsTab: true,
      //     noRecentsText: "No Recents",
      //     noRecentsStyle: const TextStyle(fontSize: 20, color: Colors.black26),)

),



    );
  }

