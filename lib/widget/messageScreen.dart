
import 'package:app_chat/model/user.dart';
import 'package:flutter/material.dart';

import 'boxChat.dart';

class messageScreen extends StatefulWidget {
  messageScreen({Key? key, required this.user}) : super(key: key);
  User user;

  @override
  State<messageScreen> createState() => _messageScreenState();
}

class _messageScreenState extends State<messageScreen> {
  late List<boxChat> message;
  TextEditingController controller = TextEditingController();
  String text = '';

  @override
  void initState() {
    super.initState();
     message = [
      boxChat(text: 'hi, guys', isMe: false),
      boxChat(text: 'how are you?', isMe: false),
      boxChat(text: 'hi, im fine thank you, and you?', isMe: true),
      boxChat(text: 'me too', isMe: false),
      boxChat(text: 'Where are you from ?', isMe: false),
      boxChat(text: 'Im from Viet Nam', isMe: true),
      boxChat(text: 'hi, guys', isMe: false),
    ];
     // message.add(boxChat(text: 'ahihi', isMe: true));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(254, 238, 238, 1),
        appBar:
        // preferredSize: Size.fromHeight(90.0),
        AppBar(
          leadingWidth: 30,
          automaticallyImplyLeading: false,
          toolbarHeight: 60,
          leading: const BackButton(color: Colors.grey),
          title: Row(
            children: [
              Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.user.image!),
                      backgroundColor: const Color.fromRGBO(255, 230, 230, 1),
                    ),
                    const Positioned.fill(child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.circle,size: 13,color: Color.fromRGBO(82, 243, 68, 1),),
                    ))
                  ]
              ),
              const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.user.firstName! + ' ' + widget.user.lastName!, style: TextStyle(color: Colors.grey[700], fontSize: 20),),
                  Text('online', style: TextStyle(color: Colors.grey[500], fontSize: 15),)
                ],
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          actions: const [
            Icon(Icons.phone, color: Color.fromRGBO(246, 105, 105, 1),size: 24,),
            SizedBox(width: 10,),
            Icon(Icons.error, color: Color.fromRGBO(246, 105, 105, 1),size: 24,),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return message[index];
                },
                itemCount: message.length,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.more_vert, color: Color.fromRGBO(246, 105, 105, 1),),
                  const Icon(Icons.attach_file, color: Color.fromRGBO(246, 105, 105, 1),),
                  const Icon(Icons.mic, color: Color.fromRGBO(246, 105, 105, 1),),
                  SizedBox(
                    height: 48,
                    width: 220,
                    child: TextField(
                      // minLines: 1,
                      // maxLines: 5,
                      autofocus: true,
                      // onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                      decoration: InputDecoration(
                          hintText: 'Chat',
                          fillColor: Colors.grey[200],
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(40),
                          )),
                      onSubmitted: (value) {
                        if(controller.text.isNotEmpty) {
                          message.add(boxChat(text: controller.text, isMe: true));
                        }
                      },
                      // onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                      controller: controller,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color.fromRGBO(246, 105, 105, 1),),
                    onPressed: () {
                      if(controller.text.isNotEmpty)  {
                        setState(() {
                          message.add(boxChat(text: controller.text, isMe: true));
                          controller.text = '';
                        });
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

