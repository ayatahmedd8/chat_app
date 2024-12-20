import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_bubble.dart';

class ChatScreen extends StatelessWidget{

  CollectionReference messages=FirebaseFirestore.instance.collection(KMessagesCollections);
  static String id='ChatScreen';
  TextEditingController controller=TextEditingController();
  final _controller=ScrollController();

  @override
  Widget build(BuildContext context) {
    //if you sure from the type of object but if not write var
    String email=ModalRoute.of(context)!.settings.arguments as String;
     return StreamBuilder<QuerySnapshot>(
         stream: messages.orderBy(KCreatedAt, descending: true).snapshots(),
         builder: (context, snapshot){
           if(snapshot.hasData) {
             List<MessageModel> messagesList=[];
             for(int i=0; i<snapshot.data!.docs.length;i++){
               messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
             }
            // print(snapshot.data!.docs[0]['message']);
             return Scaffold(
               appBar: AppBar(
                 automaticallyImplyLeading: false,
                 backgroundColor: KprimaryColor,
                 title: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Image.asset(Klogo, height: 50,),
                     const Text(
                       ' chat',
                       style: TextStyle(
                         color: Colors.white,
                       ),
                     ),
                   ],
                 ),
                 centerTitle: true,
               ),
               body: Column(
                 children: [
                   Expanded(
                     child: ListView.builder(
                       reverse: true,
                       controller: _controller,
                       itemCount: messagesList.length,
                       itemBuilder: (context, index) {
                       return messagesList[index].id == email ? ChatBubble(
                         messageModel: messagesList[index],
                       ) : ChatBubbleForFriend(messageModel: messagesList[index]);
                     },),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(16),
                     child: TextField(
                       controller: controller,
                       onSubmitted: (data) {
                         messages.add({
                           Kmessage : data,
                           KCreatedAt : DateTime.now(),
                           'id': email
                         });
                         controller.clear();
                         _controller.animateTo(
                             0,
                             duration: const Duration(seconds: 1),
                             curve: Curves.fastOutSlowIn);
                       },
                       decoration: InputDecoration(
                           suffixIcon: const Icon(
                             Icons.send, color: KprimaryColor,),
                           hintText: 'send message',
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(16),
                           ),
                           enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(16),
                               borderSide: const BorderSide(
                                   color: KprimaryColor
                               )
                           )
                       ),
                     ),
                   ),
                 ],
               ),
             );
           }else {
             return const Center(
                 child: CircularProgressIndicator(
                   color: KprimaryColor,
                 ),
             );
           }
         });
  }
}

