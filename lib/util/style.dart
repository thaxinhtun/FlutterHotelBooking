//For SharePreference
import 'package:flutter/material.dart';

const lang = 'Lang';
const String theme = 'theme';
String mDeviceId = 'mDeviceId';
String mDeviceName = 'mDeviceName';
String referID = 'referId';
String tokenKey = 'token_key';
String phoneNo = 'phoneNo';
String mUserId = 'mUserId';
String mFullName = 'mFullName';
String mGenerateRefOrder = 'mGenerateRefOrder';
String subscribeId = 'subscribeId';
String discountId = 'discountId';
String paymentId = 'paymentId';
String paymentName = 'paymentName';
String cbOrderId = 'cborderid';
String requestAccessToken = 'request_access_token';
String loginToken = 'login_token';
String referenceNumber = 'referenceNumber';
String externalTransactionId = 'externalTransactionId';
String isLoginPref = 'IsLogin';
String currentDate = 'currentDate';
const String premiumPlanId = 'cmm_premium_1m';
String clearCache = "IsClearCache";
String seenUserGuide = "seenUserGuide";
String email = "UserEmail";
String userName = "UserName";

//To store the game invite msgID and ConverKey
String gameInviteMsgID = "inviteId";
String gameInviteConverKey = "convKey";

//Screen Height
double spaceBase = 20.0;
double spaceMedium = 20.0; //Space between logo
double spaceLeft = 30;
double spaceRight = 30;
double logoWidth = 100.0;
double logoHeight = 100.0;

//TitleSize
const double titleSize = 24.0;
const double mediumSize = 22.0;
const double labelSize = 14.0;
const double size_16 = 16.0;
const double size_12 = 12.0;

//Classic 1 Light
const backgroundColor = Color(0xFFF7F7F7);
const titlePurpleColor = Color(0xFF6C539B);
const arrowForwardColor = Colors.grey;
const redColor = Colors.red;
const blackColor = Colors.black;
const whiteColor = Colors.white;
const greyColor = Colors.grey;
const greenColor = Colors.green;
const borderLineColor = Color(0xFFEEE1FF);
const checkedColor = Color(0xFF6C539B);
const backgroundDarkPurple = Color.fromARGB(255, 45, 66, 186);
const backgroundLightPurple = Color(0xFFB79FD9);
const boderLightPurple = Color(0xFFF1E5FF);
const deepPurple = Colors.white;
const orangeColor = Color(0xFFFE9601);
const spinGreenColor = Color(0xFF00B88F);
const darkBlueColor = Color(0xFF00376E);
const lightGrey = Color(0xE6E0E0E0);
const deepGrey = Color(0xFFEFEFEF);
const dividerGrey = Color(0xFF6C6C6C);
const cl2BgColor = Color(0xFFF7E3D9);
const darkBgColor = Color(0xFF0F0F0F);
const darkTextColor = Color(0xFF9E9E9E);
const backButtonColor = Colors.white;
const buttonBgcolor = Color(0xFFD6D6D6);
const gameBorderColor = Color(0xFF9E75CD);
const gameBgColor = Color(0xFFFCF2D8);
const gameBorderPink = Color(0xFFF6A39B);
const faqBgColor = Color(0xFFEEECF1);
const spinBgColor = Color(0xFF2C1852);
const spinBorderColor = Color(0xff8d6ebf);
const spinBorderLineColor = Color(0xFFC4AFEA);
const spinTopColor = Color(0xFFC148FF);
const spinBottomColor = Color(0xFF530C7C);
const spinShadowColor = Color(0xFFEAAFE3);
const spinBorderPurple = Color(0xFF734BA2);
const bottomNavTitle = Color(0xFFFFE5CE);
const bankingBottomColor = Color(0xFFAB8BDD);
const bankingTopColor = Color(0xFFDEC0D5);
const pointBottomColor = Color(0xFFD0534B);
const pointTopColor = Color(0xFFEDAA98);
const couponBottomColor = Color(0xFF4DA0BE);
const couponTopColor = Color(0xFFB6CAC9);
const giftCardBottomColor = Color(0xFFE89E3A);
const giftCardTopColor = Color(0xFFF7CA8F);
const premiumTopColor = Color(0xFFFEE5CF);
const premiumButtonColor = Color(0xFFF3A49D);
const gameTabColor = Color(0xFFE5E5E5);
const trophyTopColor = Color(0xFFFEE5CF);
const trophyBottomColor = Color(0xFFAB8BDD);

Color normalWeightColor = HexColor("#3BBC94");
Color overWeightColor = HexColor("#FC9E7E");
Color underWeightColor = HexColor("#89CDEF");
Color obesityColor = HexColor("#E55151");

Color greyTopColor = HexColor('#E2E2E2');
Color greyBottomColor = HexColor('#D6D6D6');

Color topColor = HexColor('#BF8BDB');
Color bottomColor = HexColor('#9178D3');

Color blueTopColor = HexColor('#A0DEED');
Color blueBottomColor = HexColor('#6D96F0');

Color greenTopColor = HexColor('#82EACA');
Color greenBottomColor = HexColor('#37AC49');

Color yellowTopColor = HexColor('#E8EB8E');
Color yellowBottomColor = HexColor('#DB8F4F');

Color redTopColor = HexColor('#EBB98E');
Color redBottomColor = HexColor('#DB4F4F');

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

//API Response
const String resetpasswordscreen = 'resetpasswordscreen';

//Analyze events
const String signUpEvent = 'Sign_Up';
const String logInEvent = 'Log_In';
const String socialSignInEvent = 'Social_Sign_In';
const String inviteFriendEvent = 'Invite_Friend';
const String viewPremiumPlanEvent = 'View_Premium_Plan';
const String useCouponEvent = 'Use_Coupon';
const String useDiscountEvent = 'Use_Discount';
const String chatScreenViewEvent = 'Chat_Screen_View';
const String kPayUserEvent = 'KPay_User';
const String cbPayUserEvent = 'CBPay_User';
const String pointUserEvent = 'Point_User';
const String dailyArticleViewEvent = 'Daily_Article_Unique_View';
const String comicViewEvent = 'Comic_Unique_View';
const String seriesViewEvent = 'Series_Unique_View';
const String profileUpdateEvent = 'Profile_Update';
const String deviceManagerScreenEvent = 'Device_Manager_Screen';
const String pointScreenEvent = 'Point_Screen';
const String kpayPurchasedEvent = 'Kpay_Purchased_Event';
const String cbpayPurchasedEvent = 'Cbpay_Purchased_Event';
const String pointPurchasedEvent = 'Point_Purchased_Event';
const String applePurchasedEvent = 'Apple_Purchased_Event';
const String discountPurchasedEvent = 'Discount_Purchased_Event';
const String allPurchasedEvent = 'All_Purchased_Event';
const String bmiScreenEvent = 'bmi_screen_Event';
const String shareContentEvent = 'share_content_Event';
const String accountDeleteEvent = 'account_delete_Event';
const String couponScreenEvent = 'coupon_screen_Event';
const String viewPointPremiumPlanEvent = 'View_Point_Premium_Plan';
const String couponPurchasedEvent = 'Coupon_Purchased_Event';
const String activeUserEvent = 'Active_User_Event';
const String notiScreenEvent = 'Noti_Screen_Event';
const String spinWheelScreenEvent = 'Spin_Wheel_Screen_Event';
const String faqScreenEvent = 'FAQ_Screen_Event';

const String giftCardScreenEvent = 'GiftCard_Screen_Event';
const String buyGiftCardScreenEvent = 'GiftCard_Subscription_Screen';
const String cbGiftCardPurchasedEvent = 'CBPay_GiftCard_Purchased_Event';
const String kpayGiftCardPurchasedEvent = 'KPay_GiftCard_Purchased_Event';

const String gameLevelScreenEvent = 'Game_Level_Screen_Event';
const String playGameEvent = 'Play_Game_Event';
const String userSendMessageEvent = 'User_Chat_Event';
const String groupSendMessageEvent = 'Group_Chat_Event';

const String bannerAndroid = 'ca-app-pub-3940256099942544/6300978111';
const String bannerIOS = 'ca-app-pub-3940256099942544/2934735716';

//CB Pay
// const String cbAuthToken =
//     '21b4e40fb4dd2e438bd6034a582da44e7d3afa451b8b702299f59178056c215fc7496074992a7e93d8945c966e55dad6d204ca85bcfaf507cedffc881b2d3ed0';
// const String ecommerceId = 'M010101';
// const String subMerId = '0000000004400001';
// const String orderId = 'AA1111';
// const String amounts = '1999.00';
// const String currency = 'MMK';
// const String transactionType = '1';
// const String orderDetails = 'CB Test Order 001';
// const String notifyUrl = 'http://www.example.com';
const String cbAuthToken =
    '65705cb00aacc1102fe5b4c8031bf8bbbe79313e770e84147aa9572880a89ce2250d4b32989780d2c6f13fc91f59f90cdcad555a75da1392a573e3918423b524';
const String ecommerceId = 'M010101';
const String subMerId = '0000000594200001';
const String currency = 'MMK';
const String transactionType = '1';
const String orderDetails = 'Chitmaymay Subscription';
const String notifyUrl = 'https://app.chitmaymay.com/api/cbpay/callback';

//Aya Pay
const String ayaAuthToken =
    'WUc0WktjN1hXYjVDS0xPZUg4VGVRQjJLVVdRYTp0emtaT1J0X3hRb2FFOWNhVnhMbHRUOWt4SDhh';
const String requestTokenContentType = 'application/x-www-form-urlencoded';

//Kbz Pay
// const String kbzPayUrl = "http://api.kbzpay.com/payment/gateway/uat/precreate";
// const String kbzPayQueryOrderUrl =
//     "http://api.kbzpay.com/payment/gateway/uat/queryorder";
// const String kbzReferUrl = "https://static.kbzpay.com/pgw/uat/pwa/";
// const String method = "kbz.payment.precreate";
// const String kbzNotifyUrl = "https://app.chitmaymay.com/api/notify_url";
// const String signType = "SHA256";
// const String nonceStr = "5K8264ILTKCH16CQ2502SI8ZNMTM67VS";
// const String version = "1.0";
// const String appId = "kp26f13a1c2b874bfeb877a0eb1ed74a";
// const String tradeType = "PWAAPP";
// const String merchCode = "200249";
// const String appKey = "chitmaymay@123";
// const String paySuccess = "PAY_SUCCESS";
// const String waitPay = "WAIT_PAY";

// const String kbzPayUrl = "https://api.kbzpay.com/payment/gateway/precreate";
// const String kbzPayQueryOrderUrl =
//     "https://api.kbzpay.com/payment/gateway/queryorder";
// const String kbzReferUrl = "https://wap.kbzpay.com/pgw/pwa/";
// const String method = "kbz.payment.precreate";
// const String kbzNotifyUrl = "https://app.chitmaymay.com/api/notify_url";
// const String signType = "SHA256";
// const String nonceStr = "5K8264ILTKCH16CQ2502SI8ZNMTM67VS";
// const String version = "1.0";
// const String appId = "kpe43c304d6aea4af0b7f24a4e7b3c56";
// const String tradeType = "PWAAPP";
// const String merchCode = "200147";
// const String appKey = "d4af40b06b3803a7359a2649d5eaef4c";
// const String paySuccess = "PAY_SUCCESS";
// const String waitPay = "WAIT_PAY";

const String kbzPayUrl = "https://api.kbzpay.com/payment/gateway/precreate";
const String kbzPayQueryOrderUrl =
    "https://api.kbzpay.com/payment/gateway/queryorder";
const String kbzReferUrl = "https://wap.kbzpay.com/pgw/pwa/";
const String method = "kbz.payment.precreate";
const String kbzNotifyUrl = "https://app.chitmaymay.com/api/notify_url";
const String signType = "SHA256";
const String nonceStr = "5K8264ILTKCH16CQ2502SI8ZNMTM67VS";
const String version = "1.0";
const String appId = "kpb101ed3d41a443baa75a4ace800d14";
const String tradeType = "PWAAPP";
const String merchCode = "70170402";
const String appKey = "608261d02430898b01d628491b66a2e4";
const String paySuccess = "PAY_SUCCESS";
const String waitPay = "WAIT_PAY";

//socket
const String serverUrl = 'http://chat.chitmaymay.com';
const String tokenValue = 'chitmaymay@2022';
