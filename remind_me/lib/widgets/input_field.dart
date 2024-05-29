import 'package:flutter/material.dart';
import 'package:remind_me/app_themes.dart'; 

class InputField extends StatelessWidget {
  final TextEditingController textValueController;
  final String? valueKey;
  final String label;
  final String? Function(String?)? onValidate; // Corrected type for onValidate
  final VoidCallback? onEditComplete;          // Simplified type for onEditComplete
  final String hint;
  final int? maxLine;
  final FocusNode node;
  final TextInputType? textInputType;
  final String? initialValue;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;

  InputField({
    required this.textValueController,
    this.maxLine,
    this.textInputType,
    this.onSuffixTap,
    this.initialValue,
    this.suffixIcon,
    this.onEditComplete,
    this.onValidate,
    this.valueKey,
    required this.hint,
    required this.label,
    required this.node,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = AppThemes.labelStyle; 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(label, style: labelStyle),
        ),
        TextFormField(
          style: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize), 
          maxLines: maxLine,
          readOnly: onSuffixTap != null, 
          controller: textValueController,
          initialValue: initialValue,
          cursorColor: Colors.green,
          focusNode: node,
          key: ValueKey(valueKey),
          validator: onValidate, // No casting needed with correct type
          textInputAction: TextInputAction.next,
          onEditingComplete: onEditComplete, // No casting needed with correct type
          keyboardType: textInputType,
          decoration: InputDecoration(
            filled: true,
            suffixIcon: onSuffixTap != null && suffixIcon != null
                ? InkWell(
                    onTap: onSuffixTap,
                    child: suffixIcon,
                  )
                : null, 
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
