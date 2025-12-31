import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../domain/notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationItem> notifications = [
    NotificationItem(
      title: "Payment Successful",
      message: "Your bill payment was completed successfully.",
      date: "2025-11-26 15:06:59",
    ),
    NotificationItem(
      title: "New Bill Generated",
      message: "Your electricity bill is now available.",
      date: "2025-11-25 10:30:00",
    ),
  ];

  String formatDate(String date) {
    DateTime dt = DateTime.parse(date);
    return DateFormat("dd MMM yyyy, hh:mm a").format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                item.isRead ? Colors.grey.shade300 : Colors.blue.shade100,
                child: Icon(
                  Icons.notifications,
                  color: item.isRead ? Colors.grey : Colors.blue,
                ),
              ),
              title: Text(
                item.title,
                style: TextStyle(
                  fontWeight:
                  item.isRead ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.message),
                  const SizedBox(height: 4),
                  Text(
                    formatDate(item.date),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  item.isRead = true;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
