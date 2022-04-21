import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomColors {
  //colors//
  static const Color white = Color(0xfffffdfd);
  static const Color dark_orange = Color(0xFFee7e33);
  static const Color light_orange = Color(0xFFf9d3a7);
  static const Color green = Color(0xFF376f10);
  static const Color black = Color(0xFF1c1c1c);
  static const Color grey = Color(0xFFbababa);
  static const Color dark_grey = Color(0xFF64676d);
  static const Color light_grey = Color(0xffe5e6e8);

  //font size//
  static const double font_26 = 26;
  static const double font_24 = 24;
  static const double font_28 = 28;
  static const double title_font = 20;
  static const double subtitle_font = 18;
  static const double font_16 = 16;
  static const double detail_font = 14;
  static const double subdetail_font = 13;
  static const double small_font = 12;
  static const double extrasmall_font = 10;

  //divider lines//
  static const Divider login_page_divider_line = Divider(
      color: CustomColors.grey,
      height: 15,
      thickness: 1.5,
      indent: 15,
      endIndent: 15);
  static const Divider stpes_divider = Divider(
      color: CustomColors.black,
      height: 15,
      thickness: 1.5,
      indent: 15,
      endIndent: 15);

  //stylesheet
  static const SizedBox margin_on_top = SizedBox(
    height: 50,
  );
  static const TextStyle ques_ques = TextStyle(
      color: CustomColors.black,
      fontSize: CustomColors.small_font,
      fontFamily: 'poppins_medium');

  static const TextStyle Connection_style = TextStyle(
      color: CustomColors.dark_orange,
      fontSize: CustomColors.font_28,
      fontFamily: 'poppins_semi_bold');

  static const TextStyle EmptyCart_style = TextStyle(
      color: CustomColors.dark_orange,
      fontSize: CustomColors.subtitle_font,
      fontFamily: 'poppins_semi_bold');

  static const TextStyle button_style = TextStyle(
      color: CustomColors.white,
      fontSize: CustomColors.subtitle_font,
      fontFamily: 'poppins_semi_bold');

  static const TextStyle Connection_style2 = TextStyle(
      color: CustomColors.grey,
      fontSize: CustomColors.small_font,
      fontFamily: 'poppins_regular');

  static const TextStyle ques_ans = TextStyle(
      color: CustomColors.dark_grey,
      fontSize: CustomColors.small_font,
      fontFamily: 'poppins_regular');
  static const TextStyle faq_text = TextStyle(
      color: CustomColors.black,
      fontSize: CustomColors.subdetail_font,
      fontFamily: 'poppins_medium');
  static const TextStyle faq_subtext = TextStyle(
      color: CustomColors.black,
      fontSize: CustomColors.subdetail_font,
      fontFamily: 'poppins_regular');
  static const TextStyle viewmap_text = TextStyle(
      color: CustomColors.white,
      fontSize: CustomColors.subdetail_font,
      fontFamily: 'poppins_regular');
  static const TextStyle select_button_style = TextStyle(
      color: CustomColors.white,
      fontSize: CustomColors.detail_font,
      fontFamily: 'poppins_regular');
  static const TextStyle unselect_button_style = TextStyle(
      color: CustomColors.dark_grey,
      fontSize: CustomColors.detail_font,
      fontFamily: 'poppins_regular');
  static const TextStyle cancelbooking_text = TextStyle(
      color: CustomColors.dark_grey,
      fontSize: CustomColors.subdetail_font,
      fontFamily: 'poppins_regular');

  static const TextStyle sliderscreen_button_style = TextStyle(
      fontSize: CustomColors.subtitle_font,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins');
  static const TextStyle sliderscreen_title_style = TextStyle(
      fontSize: CustomColors.title_font,
      fontFamily: 'poppins_semi_bold',
      color: CustomColors.black);

  static const TextStyle sliderscreen_subtitle_style = TextStyle(
    fontSize: CustomColors.detail_font,
    fontFamily: 'poppins_regular',
    color: CustomColors.black,
  );
  static const TextStyle edittext_loginpage_style = TextStyle(
      fontSize: CustomColors.subdetail_font,
      color: CustomColors.grey,
      fontFamily: 'poppins_medium');
  static const TextStyle forgot_password_text = TextStyle(
      fontSize: CustomColors.subdetail_font,
      fontFamily: 'poppins_regular',
      color: CustomColors.dark_grey);
  static const TextStyle order_list_field = TextStyle(
      fontSize: CustomColors.small_font,
      fontFamily: 'poppins_regular',
      color: CustomColors.black);
  static const TextStyle order_list_field_grey = TextStyle(
      fontSize: CustomColors.small_font,
      fontFamily: 'poppins_regular',
      color: CustomColors.grey);
  static const TextStyle already_account_text = TextStyle(
    fontSize: CustomColors.font_16,
    fontFamily: 'poppins_regular',
    color: CustomColors.dark_grey,
  );
  static const TextStyle outofstock_text = TextStyle(
    fontSize: CustomColors.small_font,
    fontFamily: 'poppins_regular',
    color: Colors.red,
  );
  static const TextStyle already_account_login_text = TextStyle(
      fontSize: CustomColors.small_font,
      fontFamily: 'poppins_regular',
      decoration: TextDecoration.underline,
      color: CustomColors.white);
  static const TextStyle otp_detail_text = TextStyle(
      fontSize: CustomColors.detail_font,
      fontFamily: 'poppins_regular',
      color: CustomColors.dark_grey);
  static const TextStyle orange_text = TextStyle(
      fontSize: CustomColors.detail_font,
      fontFamily: 'poppins_regular',
      color: CustomColors.dark_orange);
  static const TextStyle resent_otp_text = TextStyle(
      fontSize: CustomColors.small_font,
      fontFamily: 'poppins_medium',
      decoration: TextDecoration.underline,
      color: CustomColors.black);
  static const TextStyle otp_edittext = TextStyle(
      fontSize: CustomColors.subtitle_font,
      fontFamily: "poppins_regular",
      color: CustomColors.dark_grey);
  static const TextStyle total_payemnt_text = TextStyle(
      fontSize: CustomColors.subtitle_font,
      fontFamily: "poppins_medium",
      color: CustomColors.black);
  static const TextStyle forgot_detail = TextStyle(
      fontSize: 16, fontFamily: 'poppins_medium', color: CustomColors.black);
  static const TextStyle home_location_text = TextStyle(
      fontSize: CustomColors.subdetail_font,
      fontFamily: 'poppins_regular',
      decoration: TextDecoration.underline,
      color: CustomColors.black);
  static const TextStyle home_title_text = TextStyle(
      fontSize: CustomColors.detail_font,
      fontFamily: 'poppins_medium',
      color: CustomColors.black);
  static const TextStyle home_title_text_grey = TextStyle(
      fontSize: CustomColors.detail_font,
      fontFamily: 'poppins_medium',
      color: CustomColors.grey);
  static const TextStyle catch_it_text = TextStyle(
      fontSize: CustomColors.font_26,
      fontFamily: 'poppins_medium',
      color: CustomColors.black);
  static const TextStyle edittext_serch_home = TextStyle(
      fontSize: CustomColors.subdetail_font,
      color: CustomColors.grey,
      fontFamily: 'poppins_regular');
  static const TextStyle view_all_text = TextStyle(
      fontSize: CustomColors.extrasmall_font,
      fontFamily: 'poppins_regular',
      decoration: TextDecoration.underline,
      color: CustomColors.dark_grey);
  static const TextStyle list_title = TextStyle(
      fontSize: CustomColors.subdetail_font,
      fontFamily: 'poppins_medium',
      color: CustomColors.black);
  static const TextStyle green_text = TextStyle(
      fontSize: CustomColors.subdetail_font,
      fontFamily: 'poppins_medium',
      color: CustomColors.green);

  static const TextStyle Success_Text = TextStyle(
      fontSize: CustomColors.title_font,
      fontFamily: 'poppins_semi_bold',
      color: CustomColors.dark_orange);

  static const TextStyle Button_text = TextStyle(
      fontSize: CustomColors.subtitle_font,
      fontFamily: 'poppins_semi_bold',
      color: CustomColors.white);

  static const TextStyle Success_sub_Text = TextStyle(
      fontSize: CustomColors.font_24,
      fontFamily: 'poppins_semi_bold',
      color: CustomColors.white);

  static const TextStyle km_distance_text = TextStyle(
      fontSize: CustomColors.extrasmall_font,
      fontFamily: 'poppins_regular',
      color: CustomColors.grey);

  static const TextStyle cart_km_distance_text = TextStyle(
      fontSize: CustomColors.extrasmall_font,
      fontFamily: 'poppins_regular',
      color: CustomColors.black);
  static const TextStyle add_to_cart_text = TextStyle(
      color: Colors.white,
      fontFamily: 'poppins_regular',
      fontSize: CustomColors.small_font);

  static const TextStyle added_cart_text = TextStyle(
      color: Colors.white,
      fontFamily: 'poppins_regular',
      fontSize: CustomColors.small_font);

  static const TextStyle rating_text = TextStyle(
      color: Colors.white,
      letterSpacing: 0.5,
      fontFamily: 'poppins_regular',
      fontWeight: FontWeight.bold,
      fontSize: CustomColors.small_font);
  static const TextStyle toolbar_title_text = TextStyle(
      fontSize: CustomColors.font_16,
      fontFamily: "poppins_regular",
      color: CustomColors.black);
  static const TextStyle change_text = TextStyle(
      fontSize: CustomColors.small_font,
      fontFamily: 'poppins_regular',
      decoration: TextDecoration.underline,
      color: CustomColors.dark_orange);
  static const TextStyle selling_price_text = TextStyle(
      fontSize: CustomColors.font_16,
      color: CustomColors.black,
      fontFamily: 'poppins_semi_bold');
  static const TextStyle actual_price_text = TextStyle(
      fontSize: CustomColors.detail_font,
      color: CustomColors.black,
      decoration: TextDecoration.lineThrough,
      fontFamily: 'poppins_regular');

  static const TextStyle Success_subtext = TextStyle(
      fontSize: CustomColors.font_16,
      color: CustomColors.black,
      letterSpacing: 1,
      fontFamily: 'poppins_semi_bold');

  static const TextStyle share_code_text = TextStyle(
      fontSize: CustomColors.font_16,
      fontFamily: "poppins_regular",
      color: CustomColors.grey);

  static const howitwork_text = TextStyle(
      fontSize: CustomColors.subtitle_font,
      fontFamily: "poppins_regular",
      color: CustomColors.black);

  static const howitwork_title_text = TextStyle(
      fontSize: CustomColors.subtitle_font,
      fontWeight: FontWeight.bold,
      fontFamily: "poppins_regular",
      color: CustomColors.dark_orange);
}
