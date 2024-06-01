import 'package:flutter/material.dart';

import 'meeting_screen.dart';

class MeetingControls extends StatefulWidget {
  final void Function() onToggleMicButtonPressed;
  final void Function() onToggleCameraButtonPressed;
  final void Function() onLeaveButtonPressed;

  const MeetingControls(
      {super.key,
      required this.onToggleMicButtonPressed,
      required this.onToggleCameraButtonPressed,
      required this.onLeaveButtonPressed});

  @override
  State<MeetingControls> createState() => _MeetingControlsState();
}

class _MeetingControlsState extends State<MeetingControls> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: widget.onLeaveButtonPressed,
          icon: const Icon(Icons.call_end_rounded),
          color: Colors.red,
          iconSize: 30,
        ),
        IconButton(
          onPressed: widget.onToggleMicButtonPressed,
          iconSize: 30,
          icon: micEnabled
              ? const Icon(
                  Icons.mic_rounded,
                  color: Colors.blue,
                )
              : const Icon(
                  Icons.mic_off_rounded,
                  color: Colors.red,
                ),
        ),
        IconButton(
          onPressed: widget.onToggleCameraButtonPressed,
          iconSize: 30,
          icon: camEnabled
              ? const Icon(
                  Icons.videocam_rounded,
                  color: Colors.blue,
                )
              : const Icon(
                  Icons.videocam_off_rounded,
                  color: Colors.red,
                ),
        ),
      ],
    );
  }
}
