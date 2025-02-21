import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable PageView with Smooth Indicator',
      home: SlidablePageView(),
    );
  }
}

class SlidablePageView extends StatefulWidget {
  @override
  _SlidablePageViewState createState() => _SlidablePageViewState();
}

class _SlidablePageViewState extends State<SlidablePageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slidable PageView with Smooth Indicator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: Center(child: Text('Page 1', style: TextStyle(fontSize: 24, color: Colors.white))),
                ),
                Container(
                  color: Colors.green,
                  child: Center(child: Text('Page 2', style: TextStyle(fontSize: 24, color: Colors.white))),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(child: Text('Page 3', style: TextStyle(fontSize: 24, color: Colors.white))),
                ),
              ],
            ),
          ),
          _buildSmoothIndicator(),
        ],
      ),
    );
  }

  Widget _buildSmoothIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: 3,
      effect: WormEffect(
        activeDotColor: Colors.black,
        dotColor: Colors.grey,
        dotHeight: 10,
        dotWidth: 10,
        spacing: 16,
      ),
    );
  }
}