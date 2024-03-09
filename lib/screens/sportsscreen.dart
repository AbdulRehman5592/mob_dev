import 'dart:ui';

import 'package:flutter/material.dart';

class SportsScreen extends StatefulWidget {
  @override
  _SportsScreenState createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  bool _showText = true;
  bool _showImageStack = false; // Initially show the text

  @override
  void initState() {
    super.initState();
    // Delay hiding the text and showing the image stack after 1 second
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _showText = false; // Hide the text
      });
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _showImageStack = true;
          // Show the image stack
        });
      });
    });
  }

  final List<String> imagePaths = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg'
    // Add more image paths as needed
  ];

  bool isAnimating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Image Stack'),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/backimage.jpg'), // Your background image
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: _showText
              ? _buildAnimatedText()
              : _showImageStack
                  ? _buildAnimatedImageStack()
                  : SizedBox(),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isAnimating = !isAnimating;
          });
        },
        child: Icon(isAnimating ? Icons.pause : Icons.play_arrow),
      ),
    );
  }

  Widget _buildAnimatedText() {
    return AnimatedOpacity(
      opacity: _showText ? 1.0 : 0.0, // Fade in/out based on _showText
      duration: Duration(seconds: 5), // Fade animation duration
      curve: Curves.easeInOut, // Fade animation curve
      child: Text(
        'Hello Folks!',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  Widget _buildAnimatedImageStack() {
    return Stack(
      children: [
        // Add the grey background container

        // Add the animated images
        ..._buildAnimatedImages(),
      ],
    );
  }

  List<Widget> _buildAnimatedImages() {
    List<Widget> animatedImages = [];
    final imageSize = 250.0; // Adjust image size as needed
    final screenHeight = MediaQuery.of(context).size.height;
    final startPosition =
        Offset(MediaQuery.of(context).size.width / 2.25, screenHeight / 2.25);
    final containerHeight = 120.0; // Height of the container

    for (int i = 0; i < imagePaths.length; i++) {
      final image = Image.asset(
        imagePaths[i],
        width: imageSize,
        height: imageSize,
      );

      final endPosition = Offset(
        MediaQuery.of(context).size.width * 0.1 + (imageSize + 10) * i,
        screenHeight * 0.1,
      );

      final animatedImage = AnimatedPositioned(
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
        top: isAnimating
            ? (containerHeight)
            : lerpDouble(startPosition.dy, endPosition.dy, 0),
        left: lerpDouble(startPosition.dx, endPosition.dx, isAnimating ? 1 : 0),
        child: image,
      );

      animatedImages.add(animatedImage);
    }

    return animatedImages;
  }
}
