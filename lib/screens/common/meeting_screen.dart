// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:online_dars/screens/common/home_screen.dart';
import 'package:videosdk/videosdk.dart';

import 'meeting_controls.dart';
import 'participant_tile.dart';

var micEnabled = false;
var camEnabled = false;

class MeetingScreen extends StatefulWidget {
  final String meetingId;
  final String token;
  final String user;
  const MeetingScreen({
    super.key,
    required this.meetingId,
    required this.token,
    required this.user,
  });

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  late Room _room;

  Map<String, Participant> participants = {};

  @override
  void initState() {
    _room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: widget.token,
      displayName: widget.user,
      micEnabled: micEnabled,
      camEnabled: camEnabled,
      defaultCameraIndex: kIsWeb ? 0 : 1,
    );
    setMeetingEventListener();
    _room.join();
    super.initState();
  }

  void setMeetingEventListener() {
    _room.on(Events.roomJoined, () {
      setState(() {
        participants.putIfAbsent(
            _room.localParticipant.id, () => _room.localParticipant);
      });
    });
    _room.on(
      Events.participantJoined,
      (Participant participant) {
        setState(
          () => participants.putIfAbsent(participant.id, () => participant),
        );
      },
    );

    _room.on(Events.participantLeft, (String participantId) {
      if (participants.containsKey(participantId)) {
        setState(
          () => participants.remove(participantId),
        );
      }
    });

    _room.on(Events.roomLeft, () {
      participants.clear();
      Navigator.popUntil(context, ModalRoute.withName('/'));
    });
  }

  Future<bool> _onWillPop() async {
    _room.leave();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Live ClassRoom'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(widget.meetingId),
              //render all participant
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 300,
                    ),
                    itemBuilder: (context, index) {
                      return ParticipantTile(
                          key: Key(participants.values.elementAt(index).id),
                          participant: participants.values.elementAt(index));
                    },
                    itemCount: participants.length,
                  ),
                ),
              ),
              MeetingControls(
                onToggleMicButtonPressed: () {
                  micEnabled ? _room.muteMic() : _room.unmuteMic();
                  setState(() {
                    micEnabled = !micEnabled;
                  });
                },
                onToggleCameraButtonPressed: () {
                  camEnabled ? _room.disableCam() : _room.enableCam();
                  micEnabled ? _room.muteMic() : _room.unmuteMic();
                  setState(() {
                    camEnabled = !camEnabled;
                  });
                },
                onLeaveButtonPressed: () {
                  _room.leave();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
