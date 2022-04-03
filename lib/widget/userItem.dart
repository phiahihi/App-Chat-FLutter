
import 'package:flutter/material.dart';
import 'package:app_chat/model/user.dart';
import 'package:intl/intl.dart';
import 'messageScreen.dart';

class UserItem extends StatelessWidget {
  User user;
  UserItem({Key? key, required this.user}) : super(key: key);
  String time = DateFormat('yyyy/MM/dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return messageScreen(user: user,);
              }
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Stack(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.image!),
                        backgroundColor: const Color.fromRGBO(254, 238, 238, 1),
                      ),
                    ),
                    const Positioned.fill(

                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.circle,size: 16,color: const Color.fromRGBO(82, 243, 68, 1),),
                        ))
                  ],
                ),
              ),
              const SizedBox(width: 20,),
              SizedBox(
                width: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user.firstName! + ' ' + user.lastName!,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        '${user.firstName}',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 266,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(time),
                    const SizedBox(height: 3,),
                    Container(
                      alignment: Alignment.center,
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        // border: Border.all(
                        //   // color: Colors.red
                        // ),
                          color: Color.fromRGBO(246, 105, 105, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: const Text('2', style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
