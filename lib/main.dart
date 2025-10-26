import 'package:flutter/material.dart';
import 'florm.dart';
import 'flormpainter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Worm',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Worm'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var florm = Florm();

  AnimationController? animationController;
  Duration? duration;

  @override
  void initState() {
    super.initState();
    duration = const Duration(milliseconds: 2000);
    animationController = AnimationController(vsync: this, duration: duration);
    //_waveColor = widget.waveColor ?? Colors.lightBlueAccent;
    animationController!.repeat();
  }

  void _incrementWorm() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      florm.increment = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: GestureDetector(
          onTapDown: (details) {
            setState(() {
              if (florm.worms.isEmpty) {
                // Start the game on first tap
                florm.increment = true;
              } else {
                // Direct worm to tapped location
                for (var worm in florm.worms) {
                  worm.setTarget(details.localPosition.dx, details.localPosition.dy);
                }
              }
            });
          },
          onPanUpdate: (details) {
            setState(() {
              // Direct worm to dragged location for smooth control
              for (var worm in florm.worms) {
                worm.setTarget(details.localPosition.dx, details.localPosition.dy);
              }
            });
          },
          /*onHorizontalDragStart: (detail) {
            _x = detail.globalPosition.dx;
          },*/

          /*onHorizontalDragStart: (details) {
            dragX = details.localPosition.dx;
            dragY = details.localPosition.dy;
          },
          //onPan
          onHorizontalDragEnd: (details) {
            var selectedNode =
                treeDraw.findSelectedNode(treeDraw.getRoot(), dragX, dragY);
            var y = details.primaryVelocity;
            if (selectedNode != null && y != null) {
              setState(() {
                if (y.isNegative) {
                  selectedNode.recursiveSwapNodes();
                } else {
                  selectedNode.swapNodes();
                }
              });
            }
          },*/

          /*onScaleStart: (details) {
            currenthchunk = treeDraw.hchunk;
          },
          onScaleUpdate: (details) {
            //if (treeDraw.hchunk.isNaN) treeDraw.hchunk = 1.0;
            //if (currenthchunk == 0.0) currenthchunk = treeDraw.hchunk;
            //debugPrint(details.verticalScale.toString());
            _incrementZoom(details.verticalScale);
          },
          onLongPressEnd: (details) {
            var selectedNode =
                treeDraw.findSelectedNode(treeDraw.getRoot(), dragX, dragY);
            var pt = details.localPosition;
            if (selectedNode != null) {
              setState(() {
                if ((dragY - pt.dy).isNegative) {
                  selectedNode.recursiveSwapNodes();
                } else {
                  selectedNode.swapNodes();
                }
              });
            }
          },
          onLongPressStart: (details) {
            dragX = details.localPosition.dx;
            dragY = details.localPosition.dy;
          },*/

          /*onHorizontalDragUpdate: (detail) {
            setState(() {
              _len -= detail.globalPosition.dx - _x;
              _x = detail.globalPosition.dx;
            });
          },
          onVerticalDragUpdate: (detail) {
            setState(() {
              _len += detail.globalPosition.dy - _y;
              _y = detail.globalPosition.dy;
            });
          },*/

          /*onDoubleTapDown: (details) {
            setState(() {
              var x = details.localPosition.dx;
              var y = details.localPosition.dy;
              var selectedNode =
                  treeDraw.findSelectedNode(treeDraw.getRoot(), x, y);
              if (selectedNode != null) {
                treeDraw.pressroot == LongPressBehaviour.root
                    ? treeDraw.setNode(selectedNode)
                    : treeDraw.reroot(selectedNode);
              }
            });
          },
          onTapUp: (details) {
            setState(() {
              var x = details.localPosition.dx;
              var y = details.localPosition.dy;
              var selectedNode =
                  treeDraw.findSelectedNode(treeDraw.getRoot(), x, y);
              if (selectedNode != null) {
                this.selectedNode = selectedNode;
                treeDraw.selectRecursive(
                    selectedNode, !selectedNode.isSelected());
              }
            });
          },*/

          /*onTap: () {
            setState(() {
              //var x = detail.globalPosition.x;
              //var selectedNode = findSelectedNode(root, x, y);
              //if (selectedNode != null) {
              //  selectRecursive(selectedNode, !selectedNode.isSelected());
              //}
            });
          },
          child: DragTarget(
            builder: (context, List<String> candidateData, rejectedData) {
              return CustomPaint(
                painter: TreePainter(treeDraw),
                size: Size(1024, 1024),
              );
            },
            onWillAccept: (data) {
              return true;
            },
            onAccept: (data) {
              var k = 0;
            },
          ),*/

          child: AnimatedBuilder(
            animation: animationController!,
            builder: (BuildContext context, Widget? child) {
              return CustomPaint(
                painter: FlormPainter(florm),
                size: const Size(1024, 1024),
              );
            },
          ),
        ),
      ),
      // Removed floating action button - tap screen to start/control worm
    );
  }
}
