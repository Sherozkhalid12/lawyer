import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';
import 'package:flutter_application_1/features/chat/presentation/pages/chat_detail_page.dart';

/// Pixel-perfect recreation of the Chat screen UI
/// 
/// Image Analysis Details:
/// - Header: 84px height, back arrow (24px left margin, 28x28px, #333333), "Chat" title (24px, bold, #333333, centered)
/// - Search bar: 44px height, rounded (8-10px), light gray border (#E0E0E0), search icon (20x20px, #A0A0A0), "Search" placeholder (16px, #A0A0A0)
/// - Chat items: 72-80px height, 12-16px vertical spacing, 16px horizontal padding
/// - Profile pictures: 56px diameter, circular, various patterns
/// - Names: 16px, bold, #333333
/// - Messages: 14px, normal, #757575
/// - Timestamps: 12px, normal, #757575
/// - Unread indicators: 8-10px red circle (#FF0000)
/// - Active status: 10-12px green dot (#4CAF50) on profile picture
class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header with "Chat" title (no back arrow since it's part of main navigation)
          _ChatHeader(),
          // Search bar
          _SearchBar(),
          // Chat list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _chatItems.length,
              itemBuilder: (context, index) {
                return _ChatItem(chatData: _chatItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Chat data matching the image
  static final List<_ChatData> _chatItems = [
    _ChatData(
      name: 'Daniel Atkins',
      lastMessage: 'The weather will be perfect for the st...',
      timestamp: '2:14 PM',
      hasUnread: true,
      isActive: true,
      profileImageIndex: 0,
    ),
    _ChatData(
      name: 'Erin, Ursula, Matthew',
      lastMessage: 'You: The store only has (gasp!) 2% m...',
      timestamp: '10:16 PM',
      hasUnread: true,
      isActive: false,
      profileImageIndex: 1,
    ),
    _ChatData(
      name: 'Photographers',
      lastMessage: '@Philippe: Hmm, are you sure?',
      timestamp: 'Friday',
      hasUnread: true,
      isActive: false,
      profileImageIndex: 2,
    ),
    _ChatData(
      name: 'Nelms, Clayton, Wagner, Morgan',
      lastMessage: 'You: The game went into OT, it\'s gonn...',
      timestamp: '12/28/20',
      hasUnread: false,
      isActive: false,
      profileImageIndex: 3,
    ),
    _ChatData(
      name: 'Regina Jones',
      lastMessage: 'The class has open enrollment until th...',
      timestamp: '08/09/20',
      hasUnread: false,
      isActive: false,
      profileImageIndex: 4,
    ),
    _ChatData(
      name: 'Baker Hayfield',
      lastMessage: '@waldo Is Cleveland nice in October?',
      timestamp: '22/08/20',
      hasUnread: false,
      isActive: false,
      profileImageIndex: 5,
    ),
    _ChatData(
      name: 'Kaitlyn Henson',
      lastMessage: 'You: Can you mail my rent check?',
      timestamp: '08/09/20',
      hasUnread: false,
      isActive: false,
      profileImageIndex: 6,
    ),
  ];
}

/// Header component: 84px height, "Chat" title (24px, bold, centered) - no back arrow since it's part of main navigation
class _ChatHeader extends StatelessWidget {
  const _ChatHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84, // Header height: ~84 pixels
      padding: const EdgeInsets.symmetric(horizontal: 0),
      alignment: Alignment.center,
      child: Center(
        child: Text(
          'Chat',
          style: AppTextStyles.robotoBold(
            fontSize: 24, // Font size: ~24 pixels
            color: const Color(0xFF333333), // Dark gray (#333333)
            fontWeight: FontWeight.w700, // Bold
          ),
        ),
      ),
    );
  }
}

/// Search bar: 44px height, rounded (8-10px), light gray border, search icon, "Search" placeholder
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8), // 16-20px spacing from header
      child: Container(
        height: 44, // Height: ~44 pixels
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10), // Border radius: ~8-10 pixels
          border: Border.all(
            color: const Color(0xFFE0E0E0), // Light gray border (#E0E0E0)
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Search icon - left side with ~12-16px padding
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.search,
                color: Color(0xFFA0A0A0), // Medium-light gray (#A0A0A0)
                size: 20, // Size: ~20x20 pixels
              ),
            ),
            const SizedBox(width: 10), // 8-10px spacing between icon and text
            // Search text field
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 16, // Font size: ~16 pixels
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFA0A0A0), // Medium-light gray (#A0A0A0)
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF333333),
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

/// Chat item data model
class _ChatData {
  final String name;
  final String lastMessage;
  final String timestamp;
  final bool hasUnread;
  final bool isActive;
  final int profileImageIndex;

  const _ChatData({
    required this.name,
    required this.lastMessage,
    required this.timestamp,
    required this.hasUnread,
    required this.isActive,
    required this.profileImageIndex,
  });
}

/// Chat list item: profile picture, name, message, timestamp, unread indicator
class _ChatItem extends StatelessWidget {
  final _ChatData chatData;

  const _ChatItem({required this.chatData});

  @override
  Widget build(BuildContext context) {
    // Determine profile image path based on index (cycling through n1, n2, n3)
    final imagePaths = [
      'assets/images/n1.png',
      'assets/images/n2.png',
      'assets/images/n3.png',
    ];
    final profileImagePath = imagePaths[chatData.profileImageIndex % imagePaths.length];

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatDetailPage(
              chatName: chatData.name,
              profileImagePath: profileImagePath,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8), // Vertical spacing: 12-16px total (8px top + 8px bottom)
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile picture with optional active status indicator
          _ProfilePicture(
            index: chatData.profileImageIndex,
            isActive: chatData.isActive,
          ),
          const SizedBox(width: 12), // 12-16px spacing between profile and text
          // Text content - name and message
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name - 16px, bold, #333333
                Text(
                  chatData.name,
                  style: AppTextStyles.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700, // Bold
                    color: const Color(0xFF333333), // Dark gray (#333333)
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4), // ~4px spacing between name and message
                // Last message - 14px, normal, #757575
                Text(
                  chatData.lastMessage,
                  style: AppTextStyles.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400, // Normal
                    color: const Color(0xFF757575), // Lighter gray (#757575)
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Timestamp and unread indicator (right side)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Timestamp - 12px, normal, #757575
              Text(
                chatData.timestamp,
                style: AppTextStyles.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400, // Normal
                  color: const Color(0xFF757575), // Lighter gray (#757575)
                ),
              ),
              if (chatData.hasUnread) ...[
                const SizedBox(height: 4), // 4-6px spacing between timestamp and indicator
                // Unread indicator - 8-10px red circle
                Container(
                  width: 10, // Diameter: ~8-10 pixels
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF0000), // Vibrant red (#FF0000)
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ],
          ),
        ],
        ),
      ),
    );
  }
}

/// Profile picture: 56px diameter, circular, with optional active status indicator
class _ProfilePicture extends StatelessWidget {
  final int index;
  final bool isActive;

  const _ProfilePicture({
    required this.index,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56, // Diameter: ~56 pixels
      height: 56,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Profile picture circle
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: _getProfileImage(index),
            ),
          ),
          // Active status indicator (green dot on top-right edge)
          if (isActive)
            Positioned(
              top: -2,
              right: -2,
              child: Container(
                width: 12, // Diameter: ~10-12 pixels
                height: 12,
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50), // Vibrant green (#4CAF50)
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _getProfileImage(int index) {
    // Using images n1.png, n2.png, n3.png for circular avatars
    // Cycling through the 3 images for the chat items
    final imagePaths = [
      'assets/images/n1.png',
      'assets/images/n2.png',
      'assets/images/n3.png',
    ];

    return Image.asset(
      imagePaths[index % imagePaths.length],
      width: 56,
      height: 56,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        // Fallback to placeholder if image fails to load
        return Container(
          color: const Color(0xFFE0E0E0),
          child: Center(
            child: Icon(
              Icons.person,
              size: 32,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        );
      },
    );
  }
}

