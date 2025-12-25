// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/core/utils/text_styles.dart';

// class BookingView extends StatefulWidget {
//   const BookingView({super.key});

//   @override
//   State<BookingView> createState() => _BookingViewState();
// }

// class _BookingViewState extends State<BookingView> {
//   bool _isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final screenWidth = size.width;
//     final screenHeight = size.height;

//     return Column(
//       children: [
//         // Profile Picture Section (dark background) with header overlay
//         Container(
//           width: double.infinity,
//           height: screenHeight * 0.4,
//           color: Colors.black,
//           child: Stack(
//             children: [
//               // Profile image
//               Center(
//                 child: Image.asset(
//                   'assets/images/girl.png',
//                   width: screenWidth * 0.7,
//                   height: screenHeight * 0.4,
//                   fit: BoxFit.contain,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       color: Colors.black,
//                       child: const Icon(
//                         Icons.person,
//                         color: Colors.white,
//                         size: 80,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               // Header with back button (overlay)
//               SafeArea(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: screenWidth * 0.05,
//                     vertical: screenHeight * 0.02,
//                   ),
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.arrow_back_ios_new_rounded,
//                       color: Colors.white,
//                       size: 24,
//                     ),
//                     onPressed: () => Navigator.of(context).pop(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // Profile Details Section (white background)
//         Expanded(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: screenHeight * 0.025),
//                 // Name and Rating Row
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Name
//                           Text(
//                             'AD. Jaseon',
//                             style: AppTextStyles.robotoBold(
//                               fontSize: 22,
//                               color: const Color(0xFF333333),
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           // Profession
//                           Text(
//                             'High Court Lawyer',
//                             style: AppTextStyles.inter(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: const Color(0xFF858585),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     // Rating
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Icon(
//                           Icons.star,
//                           color: Color(0xFFD9A22A),
//                           size: 18,
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           '5.0 (332 reviews)',
//                           style: AppTextStyles.inter(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: const Color(0xFF333333),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: screenHeight * 0.025),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _StatCard(
//                         iconPath: 'assets/images/person.png',
//                         value: '658+',
//                         label: 'Clients',
//                       ),
//                     ),
//                     SizedBox(width: screenWidth * 0.03),
//                     Expanded(
//                       child: _StatCard(
//                         iconPath: 'assets/images/messagenew.png',
//                         value: '11+',
//                         label: 'Years expert',
//                       ),
//                     ),
//                     SizedBox(width: screenWidth * 0.03),
//                     Expanded(
//                       child: _StatCard(
//                         iconPath: 'assets/images/star.png',
//                         value: '5.0',
//                         label: 'Rating',
//                       ),
//                     ),
//                     SizedBox(width: screenWidth * 0.03),
//                     Expanded(
//                       child: _StatCard(
//                         iconPath: 'assets/images/message.png',
//                         value: '300+',
//                         label: 'Reviews',
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: screenHeight * 0.035),
//                 // About Me Section
//                 Text(
//                   'About Me',
//                   style: AppTextStyles.robotoBold(
//                     fontSize: 18,
//                     color: const Color(0xFF333333),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.015),
//                 RichText(
//                   text: TextSpan(
//                     style: AppTextStyles.inter(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: const Color(0xFF858585),
//                       height: 1.5,
//                     ),
//                     children: [
//                       const TextSpan(
//                         text:
//                             'AD. Janson is the top most immunologists specialist in Crist Hospital in London, UK. She achived several awards for her wonderful contribution ',
//                       ),
//                       WidgetSpan(
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _isExpanded = !_isExpanded;
//                             });
//                           },
//                           child: Text(
//                             'Read More...',
//                             style: AppTextStyles.inter(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: const Color(0xFFFF9800),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.035),
//                 // Services Section
//                 Text(
//                   'Services',
//                   style: AppTextStyles.robotoBold(
//                     fontSize: 18,
//                     color: const Color(0xFF333333),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.018),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       _ServiceTag(
//                         label: 'Divorce',
//                         isSelected: true,
//                         onTap: () {},
//                       ),
//                       const SizedBox(width: 12),
//                       _ServiceTag(
//                         label: 'Divorce',
//                         isSelected: false,
//                         onTap: () {},
//                       ),
//                       const SizedBox(width: 12),
//                       _ServiceTag(
//                         label: 'Divorce',
//                         isSelected: false,
//                         onTap: () {},
//                       ),
//                       const SizedBox(width: 12),
//                       _ServiceTag(
//                         label: 'Divorce',
//                         isSelected: false,
//                         onTap: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.035),
//                 // Expertise Section
//                 Text(
//                   'Expertise',
//                   style: AppTextStyles.robotoBold(
//                     fontSize: 18,
//                     color: const Color(0xFF333333),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.018),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       _ServiceTag(
//                         label: 'Divorce',
//                         isSelected: true,
//                         onTap: () {},
//                       ),
//                       const SizedBox(width: 12),
//                       _ServiceTag(
//                         label: 'Divorce',
//                         isSelected: false,
//                         onTap: () {},
//                       ),
//                       const SizedBox(width: 12),
//                       _ServiceTag(
//                         label: 'Divorce',
//                         isSelected: false,
//                         onTap: () {},
//                       ),
//                       const SizedBox(width: 12),
//                       _ServiceTag(
//                         label: 'Divorce',
//                         isSelected: false,
//                         onTap: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.04),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _StatCard extends StatelessWidget {
//   final String iconPath;
//   final String value;
//   final String label;

//   const _StatCard({
//     required this.iconPath,
//     required this.value,
//     required this.label,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image.asset(iconPath, width: 40, height: 40, fit: BoxFit.contain),
//         const SizedBox(height: 10),
//         Text(
//           value,
//           style: AppTextStyles.robotoBold(
//             fontSize: 18,
//             color: const Color(0xFF333333),
//           ),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           label,
//           style: AppTextStyles.inter(
//             fontSize: 11,
//             fontWeight: FontWeight.w500,
//             color: const Color(0xFF858585),
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }

// class _ServiceTag extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const _ServiceTag({
//     required this.label,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 31,
//         width: 100,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: isSelected ? const Color(0xFF4A4A4A) : const Color(0xFFFFF9E6),
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: isSelected ? Colors.black : const Color(0xFFD9A22A),
//             width: 1.5,
//           ),
//         ),
//         child: Text(
//           label,
//           style: AppTextStyles.inter(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: isSelected ? Colors.white : const Color(0xFF333333),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';
import 'package:flutter_application_1/features/payment/presentation/pages/payment_method_page.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Profile Picture Section (dark background) with header overlay
          Container(
            width: double.infinity,
            height: screenHeight * 0.4,
            color: Colors.black,
            child: Stack(
              children: [
                // Profile image
                Center(
                  child: Image.asset(
                    'assets/images/girl.png',
                    width: screenWidth * 0.7,
                    height: screenHeight * 0.4,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.black,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 80,
                        ),
                      );
                    },
                  ),
                ),
                // Header with back button (overlay)
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.02,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Profile Details Section (white background)
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.025),
                  // Name and Rating Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name
                            Text(
                              'AD. Jaseon',
                              style: AppTextStyles.robotoBold(
                                fontSize: 22,
                                color: const Color(0xFF333333),
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Profession
                            Text(
                              'High Court Lawyer',
                              style: AppTextStyles.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF858585),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Rating
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFD9A22A),
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '5.0 (332 reviews)',
                            style: AppTextStyles.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          iconPath: 'assets/images/person.png',
                          value: '658+',
                          label: 'Clients',
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: _StatCard(
                          iconPath: 'assets/images/messagenew.png',
                          value: '11+',
                          label: 'Years expert',
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: _StatCard(
                          iconPath: 'assets/images/star.png',
                          value: '5.0',
                          label: 'Rating',
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: _StatCard(
                          iconPath: 'assets/images/message.png',
                          value: '300+',
                          label: 'Reviews',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.035),
                  // About Me Section
                  Text(
                    'About Me',
                    style: AppTextStyles.robotoBold(
                      fontSize: 18,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyles.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF858585),
                        height: 1.5,
                      ),
                      children: [
                        const TextSpan(
                          text:
                              'AD. Janson is the top most immunologists specialist in Crist Hospital in London, UK. She achived several awards for her wonderful contribution ',
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            child: Text(
                              'Read More...',
                              style: AppTextStyles.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFF9800),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.035),
                  // Services Section
                  Text(
                    'Services',
                    style: AppTextStyles.robotoBold(
                      fontSize: 18,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.018),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _ServiceTag(
                          label: 'Divorce',
                          isSelected: true,
                          onTap: () {},
                        ),
                        const SizedBox(width: 12),
                        _ServiceTag(
                          label: 'Divorce',
                          isSelected: false,
                          onTap: () {},
                        ),
                        const SizedBox(width: 12),
                        _ServiceTag(
                          label: 'Divorce',
                          isSelected: false,
                          onTap: () {},
                        ),
                        const SizedBox(width: 12),
                        _ServiceTag(
                          label: 'Divorce',
                          isSelected: false,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.035),
                  // Expertise Section
                  Text(
                    'Expertise',
                    style: AppTextStyles.robotoBold(
                      fontSize: 18,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.018),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _ServiceTag(
                          label: 'Divorce',
                          isSelected: true,
                          onTap: () {},
                        ),
                        const SizedBox(width: 12),
                        _ServiceTag(
                          label: 'Divorce',
                          isSelected: false,
                          onTap: () {},
                        ),
                        const SizedBox(width: 12),
                        _ServiceTag(
                          label: 'Divorce',
                          isSelected: false,
                          onTap: () {},
                        ),
                        const SizedBox(width: 12),
                        _ServiceTag(
                          label: 'Divorce',
                          isSelected: false,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ],
      ),
      // Footer Button
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const PaymentMethodPage()),
          );
        },
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: const BoxDecoration(color: Color(0xFF2C2C2C)),
          child: Center(
            child: Text(
              'Start Now-100\$',
              style: AppTextStyles.robotoBold(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String iconPath;
  final String value;
  final String label;

  const _StatCard({
    required this.iconPath,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(iconPath, width: 40, height: 40, fit: BoxFit.contain),
        const SizedBox(height: 10),
        Text(
          value,
          style: AppTextStyles.robotoBold(
            fontSize: 18,
            color: const Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: AppTextStyles.inter(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF858585),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ServiceTag extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ServiceTag({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 31,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4A4A4A) : const Color(0xFFFFF9E6),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.black : const Color(0xFFD9A22A),
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF333333),
          ),
        ),
      ),
    );
  }
}
