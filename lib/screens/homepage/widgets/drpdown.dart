import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// IconTextDropdownRow widget
class IconTextDropdownRow extends StatefulWidget {
  final String svgPath;
  final String text;
  final List<String> dropdownItems;

  const IconTextDropdownRow({
    super.key,
    required this.svgPath,
    required this.text,
    required this.dropdownItems,
  });

  @override
  State<IconTextDropdownRow> createState() => _IconTextDropdownRowState();
}

class _IconTextDropdownRowState extends State<IconTextDropdownRow> {
  bool _isExpanded = false;
  final GlobalKey _containerKey = GlobalKey();

  bool get _hasValidItems =>
      widget.dropdownItems.any((item) => item.trim().isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          key: _containerKey,
          onTap:
              _hasValidItems
                  ? () => setState(() => _isExpanded = !_isExpanded)
                  : null,
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(widget.svgPath, height: 24, width: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.text,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // dropdown arrow
                  if (_hasValidItems)
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.grey.shade600,
                    ),
                ],
              ),
            ),
          ),
        ),
        if (_isExpanded && _hasValidItems)
          Positioned(
            top: 55, // to position below the main container
            left: 0,
            right: 0,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Column(
                  children:
                      widget.dropdownItems
                          .where((item) => item.trim().isNotEmpty)
                          .map((item) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _isExpanded = false;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 23,
                                  vertical: 10,
                                ),
                                child: Text(
                                  item,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            );
                          })
                          .toList(),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
