import 'package:flutter/material.dart';

class FormAppbar extends StatelessWidget {
  const FormAppbar({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: const Color(0xFFE9ECEF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 24,
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            "Almost there!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: width - 120,
            child: const Text(
              "Complete the form below to create your Ready To Travel account",
              style: TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: width - 120,
            child: const Text(
              "*Mandatory",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
