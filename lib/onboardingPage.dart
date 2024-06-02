import 'package:flutter/material.dart';
import 'package:qatra/Auth/logSignupPage.dart';
import 'package:qatra/Auth/loginPage.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  double _fillProgress = 0.0;

  List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to MyApp',
      'description': 'Discover amazing features and functionalities.',
      'image': 'assets/images/Onboarding 1.png',
    },
    {
      'title': 'Explore the App',
      'description': 'Navigate through various sections easily.',
      'image': 'assets/images/Onboarding 2.png',
    },
    // {
    //   'title': 'Get Started Now',
    //   'description': 'Join us and experience the MyApp journey.',
    //   'image': 'assets/images/Onboarding 3.png',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
                _fillProgress = page / (onboardingData.length - 1);
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                title: onboardingData[index]['title']!,
                description: onboardingData[index]['description']!,
                image: onboardingData[index]['image']!,
                isLastPage: index == onboardingData.length - 1,
                onSkipPressed: () {
                  // Handle skip action only on the first page
                  if (index == 0) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Logsignuppage()),
                    );
                  }
                },
              );
            },
          ),
          Positioned(
            left: 20.0,
            top: 50.0,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: onboardingData.length,
              effect: const WormEffect(
                activeDotColor: Color(0xffC93636),
              ), // You can use different effects
            ),
          ),
          Positioned(
            top: 50.0,
            right: 20.0,
            child: _currentPage <
                    2 // Change to 1 if you want it only on the first and second pages
                ? GestureDetector(
                    onTap: () {
                      // Handle skip action on the first and second pages
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Logsignuppage()),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xffC93636),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
          Positioned(
            right: 20.0,
            bottom: 20.0,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: _fillProgress),
              duration: const Duration(milliseconds: 500),
              builder: (context, double value, child) {
                return GestureDetector(
                  onTap: () {
                    // Perform your action when the button is clicked
                    if (_currentPage < onboardingData.length - 1) {
                      _pageController.animateToPage(
                        _currentPage + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Logsignuppage()),
                      );
                    }
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffC93636), // Change color as needed
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool isLastPage;
  final VoidCallback onSkipPressed;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.isLastPage,
    required this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 300.0,
          ),
          const SizedBox(height: 20.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 20.0),
          isLastPage
              ? GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Logsignuppage()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xffC93636),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
