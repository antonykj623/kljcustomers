import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kljcafe_customers/bloc/notification_bloc/notification_bloc.dart';
import 'package:kljcafe_customers/domain/notification_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/notification.dart';
import '../utils/apputils.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationData> notifications = [
  ];

  String formatDate(String date) {
    DateTime dt = DateTime.parse(date);
    return DateFormat("dd MMM yyyy, hh:mm a").format(dt);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<NotificationBloc>(context).add(
      getNotifications(


      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,

        title:  Text("Notifications",style: TextStyle(fontSize: 15,color: Colors.white),),
      ),
      body:     BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) async {
          if(state is NotificationsSuccess)
          {
                 AppUtils.hideLoader(context);
            NotificationEntity wb=state.notificationEntity;
            setState(() {

              if(wb.status==1)
              {

     notifications.addAll(wb.data!);


              }

            });
          }

          if (state is NotificationFailure) {
             AppUtils.hideLoader(context);







          }
          else if(state is NotificationsLoading)
          {

             AppUtils.showLoader(context);
          }














        },
        builder: (context, state) {
          return   ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final item = notifications[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                elevation: 2,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                    Colors.grey.shade300 ,
                    child: Icon(
                      Icons.notifications,
                      color:  Colors.grey ,
                    ),
                  ),
                  title: Text(
                    item.messageTest.toString(),
                    style: TextStyle(
                      fontWeight:
                      FontWeight.normal ,
                    ),
                  ),
                  subtitle:  Text(
                    formatDate(item.createdAt.toString()),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  onTap: () {
                    //  setState(() {
                    //  item.isRead = true;
                    //  });
                  },
                ),
              );
            },
          );
        },
      ),











    );
  }
}
