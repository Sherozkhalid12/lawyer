import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';

class AddNewCardView extends StatefulWidget {
  const AddNewCardView({super.key});

  @override
  State<AddNewCardView> createState() => _AddNewCardViewState();
}

class _AddNewCardViewState extends State<AddNewCardView> {
  final TextEditingController _cardNameController = TextEditingController(text: 'Andrew Ainsley');
  final TextEditingController _cardNumberController = TextEditingController(text: '2672 4738 7837 7285');
  final TextEditingController _expiryDateController = TextEditingController(text: '09/07/26');
  final TextEditingController _cvvController = TextEditingController(text: '699');

  @override
  void dispose() {
    _cardNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

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
                      'Add New Card',
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
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  // Credit Card Visual
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF1E3A8A),
                          Color(0xFF3B82F6),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top row: Mocard and Amazon logo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mocard',
                                  style: AppTextStyles.robotoBold(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'amazon',
                                      style: AppTextStyles.inter(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF1E3A8A),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            // Card number (masked)
                            Row(
                              children: List.generate(
                                4,
                                (index) => Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      4,
                                      (dotIndex) => Container(
                                        width: 8,
                                        height: 8,
                                        margin: const EdgeInsets.symmetric(horizontal: 2),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            // Bottom row: Card holder and expiry
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Card Holder name',
                                      style: AppTextStyles.inter(
                                        fontSize: 10,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '---- ----',
                                      style: AppTextStyles.inter(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Expiry date',
                                      style: AppTextStyles.inter(
                                        fontSize: 10,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '----/----',
                                      style: AppTextStyles.inter(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Chip circles on the right
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(-10, 0),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Card Name Input
                  _InputField(
                    label: 'Card Name',
                    controller: _cardNameController,
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  // Card Number Input
                  _InputField(
                    label: 'Card Number',
                    controller: _cardNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(19),
                      CardNumberFormatter(),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  // Expiry Date and CVV Row
                  Row(
                    children: [
                      Expanded(
                        child: _InputField(
                          label: 'Expiry Date',
                          controller: _expiryDateController,
                          keyboardType: TextInputType.number,
                          suffixIcon: const Icon(
                            Icons.calendar_today,
                            color: Color(0xFF858585),
                            size: 20,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(5),
                            ExpiryDateFormatter(),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      Expanded(
                        child: _InputField(
                          label: 'CVV',
                          controller: _cvvController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Add button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Handle add card action
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2C2C2C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Add',
                        style: AppTextStyles.robotoBold(
                          fontSize: 18,
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
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const _InputField({
    required this.label,
    required this.controller,
    this.keyboardType,
    this.suffixIcon,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            style: AppTextStyles.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF333333),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              suffixIcon: suffixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: suffixIcon,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

// Custom formatter for card number (adds spaces every 4 digits)
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(text[i]);
    }
    final string = buffer.toString();
    return TextEditingValue(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

// Custom formatter for expiry date (MM/YY format)
class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll('/', '');
    if (text.length >= 2) {
      final formatted = '${text.substring(0, 2)}/${text.substring(2)}';
      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
    return newValue;
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

