import 'package:allolab/Models/messages.dart';
import 'package:allolab/Screens/Chat/Chat.dart';
import 'package:allolab/Screens/Chat/ChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

patientList() {



  return false?Center(
    child: Text("No Chats found"),
  ):ListView.separated(
              padding: EdgeInsets.only(
                top: 18.0,
              ),
              itemBuilder: (context, index) {
                return patientChatList("");
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: 1);
}

FutureBuilder patientChatList(id) {

  String type = "patient";
  return FutureBuilder(
    future: new Future.delayed(Durations.extralong4),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListTile(
          title: Text(
            "Vijay",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          leading: Stack(alignment: Alignment.bottomRight, children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(true
                  ? "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
                  : "photo link of user"),
              radius: 26,
            ),
            // OnlineDotIndicator(
            //   uid: searchedUser.uid,
            //   type: type,
            // ),
            Icon(Icons.circle_rounded, color: Colors.green,size: 20,)
          ]),
          subtitle: Text("Last Message"),
          onTap: () {
            String type = "patient";
            Get.to(() =>Chat(),
                // arguments: [searchedUser, type],
                arguments: [type],

                transition: Transition.rightToLeft);
          },
        );

      return Container();
    },
  );
}

StreamBuilder lastMessage(Stream fetchLastMessageBetween) {
  return StreamBuilder(
      stream: fetchLastMessageBetween,
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          var docList = snapshot.data.docs;
          if (docList.isNotEmpty) {
            Messages message = Messages.fromMap(docList.last.data());
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Row(
                children: [
                  message.type == 'text'
                      ? Container()
                      : Icon(
                          _IconChange(message),
                          size: 15,
                          color: Colors.grey,
                        ),
                  Text(
                    message.message!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }
          return Text(
            "No Message",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          );
        }
        return Text(
          "..",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        );
      });
}

IconData _IconChange(Messages message) {
  final type = message.type;
  switch (type) {
    case 'image':
      return Icons.image;
    case 'file':
      return Icons.file_copy_rounded;
    default:
      return Icons.image;
  }
}
