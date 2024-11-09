import 'package:allolab/API/Local.dart';
import 'package:allolab/Controller/Chatdisplaycontroller.dart';
import 'package:allolab/Controller/User/UserController.dart';
import 'package:allolab/Models/messages.dart';
import 'package:allolab/Screens/Chat/Chat.dart';
import 'package:allolab/Screens/Chat/ChatScreen.dart';
import 'package:allolab/db/dbHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Widget healthWorkerContactList(ChatController chatcontroller) {



  String type = "patient";

  print(type);

  Usercontroller controller = Get.put(Usercontroller());



  return StreamBuilder<List<Map<String, dynamic>>>(
  stream: chatcontroller.healthWorkerChatListStream,
  builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return Center(child: Text("Error: ${snapshot.error}"));
    }

    if (snapshot.hasData) {
      if (snapshot.data!.isEmpty) {
        return Center(
          child: Text("No Chats found"),
        );
      } else {
        return ListView.separated(
          itemBuilder: (context, index) {
            Map<String, dynamic> data = snapshot.data![index];

            print(data);
            
            return ListTile(
              title: Text(
                data["name"],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
                    ),
                    radius: 26,
                  ),
                  Icon(Icons.circle_rounded, color: Colors.green, size: 20),
                ],
              ),
              subtitle: Text(data["lastMessage"]),
              onTap: () {
                String type = "patient";
                print(data);

                String uid = Local.getUserID().toString();
                String myid = "H$uid";
                String id = data["id"];
                String p2 = id.split("-").first != myid ? id.split("-").first : id.split("-")[0];
                print(p2);

                Get.to(Chat(
                  title: data["name"],
                  chatId: id,
                  p1: myid,
                  p2: p2,
                  p1Name: controller.name.text,
                  p2Name: data["name"]
                ));
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 20);
          },
          itemCount: snapshot.data!.length,
        );
      }
    }

    return Center(child: Text("No data available"));
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



