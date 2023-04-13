import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class MyPomodoro extends StatelessWidget {
  const MyPomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return Pomodoro();
  }
}

class Pomodoro extends StatefulWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> with TickerProviderStateMixin {
  late int duration = 0;
  bool showControllers = false;
  final CountDownController _controller = CountDownController();
  late AnimationController _icon_controller = AnimationController(
    duration: const Duration(
      milliseconds: 500,
    ),
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("My Pomodoro", style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),),
          CircularCountDownTimer(
            // Countdown duration in Seconds.
            duration: duration,

            // Countdown initial elapsed Duration in Seconds.
            initialDuration: 0,

            // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
            controller: _controller,

            // Width of the Countdown Widget.
            width: MediaQuery.of(context).size.width / 2,

            // Height of the Countdown Widget.
            height: MediaQuery.of(context).size.height / 2,

            // Ring Color for Countdown Widget.
            ringColor: Colors.grey[300]!,

            // Ring Gradient for Countdown Widget.
            ringGradient: null,

            // Filling Color for Countdown Widget.
            fillColor: Color(0xffeb5228),

            // Filling Gradient for Countdown Widget.
            fillGradient: null,

            // Background Color for Countdown Widget.
            backgroundColor: Color.fromARGB(255, 103, 59, 46),

            // Background Gradient for Countdown Widget.
            backgroundGradient: null,

            // Border Thickness of the Countdown Ring.
            strokeWidth: 20.0,

            // Begin and end contours with a flat edge and no extension.
            strokeCap: StrokeCap.round,

            // Text Style for Countdown Text.
            textStyle: const TextStyle(
              fontSize: 33.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),

            // Format for the Countdown Text.
            textFormat: CountdownTextFormat.S,

            // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
            isReverse: false,

            // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
            isReverseAnimation: false,

            // Handles visibility of the Countdown Text.
            isTimerTextShown: true,

            // Handles the timer start.
            autoStart: false,

            // This Callback will execute when the Countdown Starts.
            onStart: () {
              // Here, do whatever you want
              debugPrint('Countdown Started');
            },

            // This Callback will execute when the Countdown Ends.
            onComplete: () {
              // Here, do whatever you want
              debugPrint('Countdown Ended');
            },

            // This Callback will execute when the Countdown Changes.
            onChange: (String timeStamp) {
              // Here, do whatever you want
              debugPrint('Countdown Changed $timeStamp');
            },

            timeFormatterFunction: (defaultFormatterFunction, duration) {
              if (duration.inSeconds == 0) {
                // only format for '0'
                return "Start";
              } else {
                // other durations by it's default format
                return Function.apply(defaultFormatterFunction, [duration]);
              }
            },
          ),
          !showControllers
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            side: BorderSide(color: Colors.orange, width: 3),
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                        ),
                        onPressed: () => {
                              setState(() {
                                showControllers = true;
                              }),
                              _controller.restart(duration: 10),
                              _icon_controller.forward()
                            },
                        child: const Text("10 sec",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20))),
                    TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            side: BorderSide(color: Colors.orange, width: 3),
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                        ),
                        onPressed: () => {
                              setState(() {
                                showControllers = true;
                              }),
                              _controller.restart(duration: 100),
                              _icon_controller.forward()
                            },
                        child: const Text("100 sec",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20))),
                    TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            side: BorderSide(color: Colors.orange, width: 3),
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                        ),
                        onPressed: () => {
                              setState(() {
                                showControllers = true;
                              }),
                              _controller.restart(duration: 250),
                              _icon_controller.forward()
                            },
                        child: const Text("250 sec",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20))),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 6),
                            borderRadius: BorderRadius.circular(50)),
                        child: AnimatedIcon(
                          icon: AnimatedIcons.play_pause,
                          progress: _icon_controller,
                          size: 60,
                        ),
                      ),
                      onTap: () => {
                        if (!_controller.isStarted)
                          {_controller.start(), _icon_controller.forward()}
                        else if (_controller.isStarted && _controller.isPaused)
                          {_controller.resume(), _icon_controller.forward()}
                        else
                          {_controller.pause(), _icon_controller.reverse()}
                      },
                    ),
                    IconButton(
                        onPressed: () => {
                              _icon_controller.reverse(),
                              _controller.reset(),
                              setState(() {
                                showControllers = false;
                              })
                            },
                        icon: Icon(
                          Icons.square_rounded,
                          size: 30,
                        ))
                  ],
                ),
        ],
      ),
    );
  }
}
