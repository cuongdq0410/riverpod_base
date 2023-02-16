import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextField extends StatefulWidget {
  final EdgeInsets? margin;
  final String? label;
  final TextStyle? labelTextStyle;
  final TextEditingController? controller;
  final Widget? suffixWidget;
  final EdgeInsets? scrollPadding;
  final String? hintText;
  final FocusNode? focusNode;
  final int? maxLines;
  final ValueChanged? onChange;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onFieldSubmitted;
  final double? labelVerticalPadding;
  final bool readyOnly;
  final bool? showCursor;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? enabledBorder;
  final bool isObscure;
  final String? suffixSvgPath;
  final VoidCallback? onTapSuffixSvgPath;
  final String? obscuringCharacter;
  final double? textFieldHeight;
  final bool isVisibleSuffixIcon;

  const CommonTextField({
    Key? key,
    this.margin,
    this.label,
    this.controller,
    this.labelTextStyle,
    this.suffixWidget,
    this.scrollPadding,
    this.hintText,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.onChange,
    this.keyboardType,
    this.onFieldSubmitted,
    this.labelVerticalPadding,
    this.readyOnly = false,
    this.showCursor,
    this.onTap,
    this.onEditingComplete,
    this.maxLength,
    this.textInputAction,
    this.inputFormatters,
    this.enabledBorder,
    this.isObscure = false,
    this.suffixSvgPath,
    this.onTapSuffixSvgPath,
    this.obscuringCharacter,
    this.textFieldHeight,
    this.isVisibleSuffixIcon = true,
  }) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late bool _isObscure;
  late FocusNode _focusNode;
  bool _isFocus = false;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      bool isPreviousValue = _isFocus;
      if (_focusNode.hasFocus || _focusNode.hasPrimaryFocus) {
        _isFocus = true;
      } else {
        _isFocus = false;
      }
      if (_isFocus != isPreviousValue && mounted) {
        setState(() {});
      }
    });
    _isObscure = widget.isObscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      margin: widget.margin,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorName.greyFAFAFA,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: _isFocus ? ColorName.blue0093D5 : Colors.transparent,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    _focusNode.requestFocus();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Text(
                      widget.label ?? '',
                      style: widget.labelTextStyle ??
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ColorName.black252525,
                              ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    focusNode: _focusNode,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorName.black252525,
                        ),
                    maxLines: widget.maxLines ?? 1,
                    onChanged: widget.onChange,
                    textAlign: widget.textAlign,
                    keyboardType: widget.keyboardType,
                    readOnly: widget.readyOnly,
                    showCursor: widget.showCursor,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    onEditingComplete: widget.onEditingComplete,
                    maxLength: widget.maxLength,
                    textInputAction: widget.textInputAction,
                    onTap: widget.onTap,
                    inputFormatters: widget.inputFormatters,
                    obscureText: _isObscure,
                    obscuringCharacter: widget.obscuringCharacter ?? '*',
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      suffixIcon:
                          widget.isVisibleSuffixIcon ? const SizedBox() : null,
                      counterText: "",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.isObscure,
            child: IconButton(
              icon: Assets.images.icEye.svg(),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
