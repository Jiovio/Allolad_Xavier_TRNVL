
import 'package:allolab/Models/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Chat.dart';

Widget healthWorkerContactList(BuildContext context) {
  return false
          ? Center(
              child: Text("No Chats found"),
            )
          : ListView.separated(
          padding: EdgeInsets.only(top: 18.0),
          itemBuilder: (context, index) {
            return healthWorkerChatList("");
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: 1);
}

Widget healthWorkerChatList(id) {
  // use Future Builder
  String type = "Doctor";
  return  ListTile(
          title: Text(
            "Nurse ${"Padma"}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          leading: Stack(alignment: Alignment.bottomRight, children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: Image.asset("assets/avatar.png",fit: BoxFit.contain,).image,
              // backgroundImage:  NetworkImage(searchedUser.profilePhoto.isEmpty
              //     ? "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
              //     : searchedUser.profilePhoto),
              radius: 26,
            ),
            // OnlineDotIndicator(
            //   uid: searchedUser.uid,
            //   type: type,
            // ),
            Icon(Icons.circle_rounded, color: Colors.green,size: 20,)
          ]),
          subtitle: Text("How are you"),
          // lastMessage(_chatController.fetchLastMessageBetween(
          //     senderId: data.read("token"),
          //     receiverId: searchedUser.uid,
          //     type: type)
              
          //     ),
          onTap: () {
            String type = "HealthWorker";
                        Get.to(() => Chat(),
                transition: Transition.rightToLeft);
            // Get.to(() => Chat(),
            //     arguments: [searchedUser, type],
            //     transition: Transition.rightToLeft);
          },
        );
      
}

// StreamBuilder lastMessage(Stream<QuerySnapshot> fetchLastMessageBetween) {
//   return StreamBuilder(
//       stream: fetchLastMessageBetween,
//       builder: (context, AsyncSnapshot<dynamic> snapshot) {
//         if (snapshot.hasData) {
//           var docList = snapshot.data.docs;
//           if (docList.isNotEmpty) {
//             Messages message = Messages.fromMap(docList.last.data());
//             return SizedBox(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Row(
//                 children: [
//                   message.type == 'text'
//                       ? Container()
//                       : Icon(
//                           _IconChange(message),
//                           size: 15,
//                           color: Colors.grey,
//                         ),
//                   Text(
//                     message.message!,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//           return Text(
//             "No Message",
//             style: TextStyle(
//               color: Colors.grey,
//               fontSize: 14,
//             ),
//           );
//         }
//         return Text(
//           "..",
//           style: TextStyle(
//             color: Colors.grey,
//             fontSize: 14,
//           ),
//         );
//       });
// }

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
