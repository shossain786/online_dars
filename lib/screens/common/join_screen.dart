import 'package:flutter/material.dart';
import 'package:online_dars/api_call.dart';

import 'meeting_screen.dart';

class JoinScreen extends StatelessWidget {
  final _meetingIdController = TextEditingController();
  final _userNameController = TextEditingController();
  JoinScreen({super.key});

  void onCreateButtonPressed(BuildContext context) async {
    String userName = _userNameController.text.trim();
    if (userName.isNotEmpty) {
      await createMeeting().then((meetingId) {
        if (!context.mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MeetingScreen(
              user: _userNameController.text,
              meetingId: meetingId,
              token: token,
            ),
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your name"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void onJoinButtonPressed(BuildContext context) {
    String userName = _userNameController.text.trim();
    String meetingId = _meetingIdController.text;
    var re = RegExp("\\w{4}\\-\\w{4}\\-\\w{4}");
    // check meeting id is not null or invaild
    // if meeting id is vaild then navigate to MeetingScreen with meetingId,token
    if (userName.isNotEmpty && meetingId.isNotEmpty && re.hasMatch(meetingId)) {
      _meetingIdController.clear();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MeetingScreen(
            user: _userNameController.text,
            meetingId: meetingId,
            token: token,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter name and valid meeting id"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Class'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Your Name',
                      border: OutlineInputBorder(),
                    ),
                    controller: _userNameController,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Meeting Id',
                      border: OutlineInputBorder(),
                    ),
                    controller: _meetingIdController,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => onCreateButtonPressed(context),
                      label: const Text('Create Class'),
                      icon: const Icon(Icons.video_call_rounded),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: () => onJoinButtonPressed(context),
                      label: const Text('Join Class'),
                      icon: const Icon(Icons.video_call_rounded),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
