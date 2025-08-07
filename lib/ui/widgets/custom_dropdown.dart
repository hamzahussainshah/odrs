// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomDropdown extends StatelessWidget {
//   final String labelText;
//   final String? value;
//   final List<String> items;
//   final void Function(String?) onChanged;
//   final String? hintText;
//
//   const CustomDropdown({
//     Key? key,
//     required this.labelText,
//     required this.value,
//     required this.items,
//     required this.onChanged,
//     this.hintText,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         labelText: labelText,
//         hintText: hintText,
//         labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
//           color: Theme.of(context).colorScheme.onSurfaceVariant,
//         ),
//         hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
//           color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.6),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(
//             color: Theme.of(context).colorScheme.outline,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(
//             color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(
//             color: Theme.of(context).colorScheme.primary,
//             width: 2,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(
//             color: Theme.of(context).colorScheme.error,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide(
//             color: Theme.of(context).colorScheme.error,
//             width: 2,
//           ),
//         ),
//         filled: true,
//         fillColor: isDarkMode
//             ? Theme.of(context).colorScheme.surfaceContainerHighest
//             : Theme.of(context).colorScheme.surface,
//         contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//       ),
//       value: value,
//       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//         color: Theme.of(context).colorScheme.onSurface,
//       ),
//       dropdownColor: Theme.of(context).colorScheme.surface,
//       items: items.map((String item) {
//         return DropdownMenuItem<String>(
//           value: item,
//           child: Text(
//             item,
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//               color: Theme.of(context).colorScheme.onSurface,
//             ),
//           ),
//         );
//       }).toList(),
//       onChanged: onChanged,
//       icon: Icon(
//         Icons.keyboard_arrow_down,
//         color: Theme.of(context).colorScheme.onSurfaceVariant,
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatefulWidget {
  final String labelText;
  final String? value;
  final List<String> items;
  final void Function(String?) onChanged;
  final String? hintText;

  const CustomDropdown({
    Key? key,
    required this.labelText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final selectedItem = widget.value;

    return InputDecorator(
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: isDarkMode
            ? Theme.of(context).colorScheme.surfaceContainerHighest
            : Theme.of(context).colorScheme.surface,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
      child: PopupMenuButton<String>(
        initialValue: selectedItem,
        onSelected: widget.onChanged,
        onOpened: () => setState(() => _isOpen = true),
        onCanceled: () => setState(() => _isOpen = false),
        itemBuilder: (BuildContext context) {
          return widget.items.map((String item) {
            return PopupMenuItem<String>(
              value: item,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  if (item == selectedItem)
                    Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20.r,
                    ),
                ],
              ),
            );
          }).toList();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedItem ?? widget.hintText ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: selectedItem != null
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withOpacity(0.6),
                ),
              ),
            ),
            Icon(
              _isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: _isOpen
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
        color: isDarkMode
            ? Theme.of(context).colorScheme.surfaceContainerHighest
            : Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        elevation: 4,
      ),
    );
  }
}