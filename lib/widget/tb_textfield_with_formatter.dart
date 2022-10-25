import 'package:bank_sampah/themes/constants.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class TBTextFieldWithFormatter extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData? iconName;
  final int? maxLines;
  final void Function(String) callback;
  const TBTextFieldWithFormatter(
      {Key? key,
      required this.controller,
      this.hintText,
      this.iconName,
      this.maxLines,
      required this.callback})
      : super(key: key);

  @override
  State<TBTextFieldWithFormatter> createState() =>
      _TBTextFieldWithFormatterState();
}

class _TBTextFieldWithFormatterState extends State<TBTextFieldWithFormatter> {
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(
    locale: "ID",
    decimalDigits: 0,
    symbol: "",
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding / 2),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      decoration: BoxDecoration(
          border: Border.all(color: kBorderGray, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          widget.iconName != null
              ? Padding(
                  padding: const EdgeInsets.only(right: kDefaultPadding / 4),
                  child: Icon(
                    widget.iconName!,
                    size: 20,
                    color: Colors.grey[400],
                  ),
                )
              : const SizedBox(),
          Expanded(
            child: TextField(
                controller: widget.controller,
                inputFormatters: [_formatter],
                onChanged: (val) {
                  widget.callback(val);
                },
                style: kBlackText.copyWith(fontSize: 12),
                maxLines: widget.maxLines,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: kLightGrayText.copyWith(fontSize: 12),
                  border: InputBorder.none,
                )),
          ),
        ],
      ),
    );
  }
}
