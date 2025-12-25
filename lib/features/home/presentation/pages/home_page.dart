import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/widgets/home_view.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/chat_list_view.dart';
import 'package:flutter_application_1/features/profile/presentation/widgets/profile_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return const HomeView();
      case 2:
        return const ChatListView();
      case 3:
        return const ProfileView();
      default:
        return const HomeView(); // Default to home for other indices
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _getBody(),
      bottomNavigationBar: _BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNavigation({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 8,
        top: 8,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home icon
          _buildNavItem(
            imageAsset: 'assets/images/home.png',
            isSelected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          // Mask icon (second index)
          _buildNavItem(
            imageAsset: 'assets/images/Mask.png',
            isSelected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          // Union icon (third index) - Chat
          _buildNavItem(
            imageAsset: 'assets/images/Union.png',
            isSelected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          // User icon (fourth index)
          _buildNavItem(
            imageAsset: 'assets/images/User.png',
            isSelected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String imageAsset,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: ColorFiltered(
          colorFilter: isSelected
              ? const ColorFilter.mode(
                  Color(0xFFD9A22A),
                  BlendMode.srcIn,
                )
              : const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.srcIn,
                ),
          child: Image.asset(
            imageAsset,
            width: 28,
            height: 28,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 28,
                height: 28,
                color: Colors.grey,
              );
            },
          ),
        ),
      ),
    );
  }
}

