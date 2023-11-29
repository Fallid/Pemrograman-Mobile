import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_5_latihan/app/modules/home/controllers/realtime_controller.dart';

class RealtimeView extends StatefulWidget {
  RealtimeView({Key? key}) : super(key: key);

  @override
  _RealtimeViewState createState() => _RealtimeViewState();
}

class _RealtimeViewState extends State<RealtimeView> {
  final RealtimeController realtimeController = Get.put(RealtimeController());
  List<String> fileEvents = [];

  @override
  void initState() {
    super.initState();
    realtimeController.subsUserName();
    // Assuming the RealtimeController is properly implemented to handle streams,
    // you can listen to the stream and update your state accordingly.
    realtimeController.realtime!.subscribe(['files']).stream.listen((response) {
          if (response.events.contains('buckets.*.files.*.create')) {
            setState(() {
              fileEvents.add("New file created: ${response.payload}");
            });
          }
        });
  }

  @override
  void dispose() {
    // Unsubscribe from the real-time updates to prevent memory leaks.
    // realtimeController.realtime!.unsubscribe(['files']);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime View'),
      ),
      body: ListView.builder(
        itemCount: fileEvents.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(fileEvents[index]),
              ),
              // Text(fileEvents[index])
            ],
          );
        },
      ),
    );
  }
}
