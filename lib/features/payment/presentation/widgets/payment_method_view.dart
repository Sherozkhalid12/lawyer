import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';
import 'package:flutter_application_1/features/payment/presentation/pages/add_new_card_page.dart';

class PaymentMethodView extends StatefulWidget {
  const PaymentMethodView({super.key});

  @override
  State<PaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  String? _selectedPaymentMethod = 'PayPal'; // PayPal selected by default

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return SafeArea(
      child: Column(
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Row(
              children: [
                // Back button
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF333333),
                    size: 24,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                // Title
                Expanded(
                  child: Center(
                    child: Text(
                      'Payment Method',
                      style: AppTextStyles.robotoBold(
                        fontSize: 20,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                ),
                // Right icon (square bracket with vertical line)
                IconButton(
                  icon: CustomPaint(
                    size: const Size(24, 24),
                    painter: _SquareBracketIconPainter(),
                  ),
                  onPressed: () {
                    // TODO: Handle scan card action
                  },
                ),
              ],
            ),
          ),
          // Instructions
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.015,
            ),
            child: Text(
              'Select the payment method you want to use.',
              style: AppTextStyles.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF858585),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          // Payment Options
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  // PayPal option
                  _PaymentOptionCard(
                    logo: 'PayPal',
                    logoColor: const Color(0xFF0070BA),
                    isSelected: _selectedPaymentMethod == 'PayPal',
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = 'PayPal';
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Google Pay option
                  _PaymentOptionCard(
                    logo: 'Google Pay',
                    logoColor: const Color(0xFF4285F4),
                    isGooglePay: true,
                    isSelected: _selectedPaymentMethod == 'Google Pay',
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = 'Google Pay';
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Apple Pay option
                  _PaymentOptionCard(
                    logo: 'Apple Pay',
                    logoColor: Colors.black,
                    isApplePay: true,
                    isSelected: _selectedPaymentMethod == 'Apple Pay',
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = 'Apple Pay';
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Add New Card button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddNewCardPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2C2C2C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Add New Card',
                        style: AppTextStyles.robotoBold(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
          // Next button
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _selectedPaymentMethod != null
                    ? () {
                        // TODO: Handle next action
                        Navigator.of(context).pop();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C2C2C),
                  disabledBackgroundColor: const Color(0xFF2C2C2C).withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Next',
                  style: AppTextStyles.robotoBold(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentOptionCard extends StatelessWidget {
  final String logo;
  final Color logoColor;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isGooglePay;
  final bool isApplePay;

  const _PaymentOptionCard({
    required this.logo,
    required this.logoColor,
    required this.isSelected,
    required this.onTap,
    this.isGooglePay = false,
    this.isApplePay = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              // Logo
              if (isGooglePay)
                // Google Pay colorful G logo (24x24)
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CustomPaint(
                    painter: _GooglePayLogoPainter(),
                  ),
                )
              else if (isApplePay)
                // Apple Pay logo (black Apple logo, 24x24)
                const Icon(
                  Icons.apple,
                  color: Colors.black,
                  size: 24,
                )
              else
                // PayPal logo (two overlapping P's)
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CustomPaint(
                    painter: _PayPalLogoPainter(),
                  ),
                ),
              const SizedBox(width: 16),
              // Logo text
              Text(
                logo,
                style: AppTextStyles.robotoBold(
                  fontSize: 18,
                  color: const Color(0xFF333333),
                ),
              ),
              const Spacer(),
              // Radio button (gold #FFC107)
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFFFC107),
                    width: 2,
                  ),
                  color: isSelected ? const Color(0xFFFFC107) : Colors.transparent,
                ),
                child: isSelected
                    ? const Center(
                        child: Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom painter for square bracket with vertical line icon
class _SquareBracketIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF333333)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Left bracket
    canvas.drawLine(
      const Offset(4, 2),
      Offset(4, size.height - 2),
      paint,
    );
    canvas.drawLine(
      const Offset(4, 2),
      const Offset(8, 2),
      paint,
    );
    canvas.drawLine(
      Offset(4, size.height - 2),
      Offset(8, size.height - 2),
      paint,
    );

    // Right bracket
    canvas.drawLine(
      Offset(size.width - 4, 2),
      Offset(size.width - 4, size.height - 2),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - 8, 2),
      Offset(size.width - 4, 2),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - 8, size.height - 2),
      Offset(size.width - 4, size.height - 2),
      paint,
    );

    // Vertical line in the middle
    canvas.drawLine(
      Offset(size.width / 2, 4),
      Offset(size.width / 2, size.height - 4),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom painter for PayPal logo (two overlapping P's)
class _PayPalLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // First P (lighter blue #009CDE)
    final paint1 = Paint()
      ..color = const Color(0xFF009CDE)
      ..style = PaintingStyle.fill;

    // Draw first P - vertical bar
    canvas.drawRect(Rect.fromLTWH(2, 2, 3, 10), paint1);
    // Top horizontal bar
    canvas.drawRect(Rect.fromLTWH(5, 2, 6, 3), paint1);
    // Middle horizontal bar
    canvas.drawRect(Rect.fromLTWH(5, 5, 4, 2), paint1);

    // Second P (darker blue #003087) - overlapping
    final paint2 = Paint()
      ..color = const Color(0xFF003087)
      ..style = PaintingStyle.fill;

    // Draw second P - vertical bar (offset)
    canvas.drawRect(Rect.fromLTWH(4, 4, 3, 10), paint2);
    // Top horizontal bar
    canvas.drawRect(Rect.fromLTWH(7, 4, 6, 3), paint2);
    // Middle horizontal bar
    canvas.drawRect(Rect.fromLTWH(7, 7, 4, 2), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom painter for Google Pay colorful G logo
class _GooglePayLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Red segment (top right quadrant)
    final redPaint = Paint()..color = const Color(0xFFEA4335);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.57, // -90 degrees
      -1.57, // -90 degrees
      true,
      redPaint,
    );

    // Yellow segment (bottom right quadrant)
    final yellowPaint = Paint()..color = const Color(0xFFFBBC05);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0, // 0 degrees
      -1.57, // -90 degrees
      true,
      yellowPaint,
    );

    // Green segment (bottom left quadrant)
    final greenPaint = Paint()..color = const Color(0xFF34A853);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      1.57, // 90 degrees
      -1.57, // -90 degrees
      true,
      greenPaint,
    );

    // Blue segment (top left quadrant)
    final bluePaint = Paint()..color = const Color(0xFF4285F4);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14, // 180 degrees
      -1.57, // -90 degrees
      true,
      bluePaint,
    );

    // White G in the center
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'G',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

