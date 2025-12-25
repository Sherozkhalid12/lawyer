import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/signin/presentation/pages/phone_verification_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<_OnboardingData> _pages = const [
    _OnboardingData(
      imageAsset: 'assets/images/carasol1.png',
      title: 'Find Best Lawyer',
      body:
          'Mauris urna velit, congue et aliquam non,\nimperdiet id massa. Etiam commodo interdum\neros, eget hendrerit ex rhoncus in.',
    ),
    _OnboardingData(
      imageAsset: 'assets/images/carasol2.png',
      title: 'Easy To Hire',
      body:
          'Mauris urna velit, congue et aliquam non,\nimperdiet id massa. Etiam commodo interdum\neros, eget hendrerit ex rhoncus in.',
    ),
    _OnboardingData(
      imageAsset: 'assets/images/carasol3.png',
      title: 'Online Payments',
      body:
          'Mauris urna velit, congue et aliquam non,\nimperdiet id massa. Etiam commodo interdum\neros, eget hendrerit ex rhoncus in.',
    ),
  ];

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const PhoneVerificationPage(),
        ),
      );
    }
  }

  void _onSkip() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const PhoneVerificationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Top bar with Skip
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.02,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: _onSkip,
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3F3F3F),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final data = _pages[index];
              return _OnboardingSlide(
                data: data,
                size: size,
                onNext: _onNext,
                currentIndex: _currentIndex,
                pageCount: _pages.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _OnboardingSlide extends StatelessWidget {
  const _OnboardingSlide({
    required this.data,
    required this.size,
    required this.onNext,
    required this.currentIndex,
    required this.pageCount,
  });

  final _OnboardingData data;
  final Size size;
  final VoidCallback onNext;
  final int currentIndex;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.12,
        vertical: size.height * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.04),
          // Illustration
          SizedBox(
            height: size.height * 0.32,
            child: Image.asset(
              data.imageAsset,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: size.height * 0.06),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF222222),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            data.body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Color(0xFF9094A0),
            ),
          ),
          const Spacer(),
          // Next button
          SizedBox(
            width: 360,
            height: 56,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F1011),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.04),
          // Bottom dots
          _DotsIndicator(
            count: pageCount,
            currentIndex: currentIndex,
            activeColor: const Color(0xFF0F1011),
            inactiveColor: const Color(0xFFC3C7D0),
          ),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  const _DotsIndicator({
    required this.count,
    required this.currentIndex,
    required this.activeColor,
    required this.inactiveColor,
  });

  final int count;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 18 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}

class _OnboardingData {
  final String imageAsset;
  final String title;
  final String body;

  const _OnboardingData({
    required this.imageAsset,
    required this.title,
    required this.body,
  });
}


