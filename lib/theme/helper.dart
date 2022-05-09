import 'dart:convert';


// ignore: import_of_legacy_library_into_null_safe
import 'package:crclib/crclib.dart';
import 'package:flutter_svg/svg.dart';
import 'package:terk_019/theme/api_path.dart';

import 'package:terk_019/theme/constraint.dart';

import 'package:uuid/uuid.dart';

const versionID = "00";
const qrTypeID = "01";
const merchantAccountID = "29";
const subMerchantApplicationID = "00";
const subMerchantAccountPhoneID = "01";
const subMerchantAccountIdentityID = "02";
const subMerchantAccountEWalletID = "03";
const countryID = "58";
const currencyID = "53";
const amountID = "54";
const checksumID = "63";

const versionLength = "02";
const qrTypeLength = "02";
const merchantAccountLength = "37";
const subMerchantApplicationIDLength = "16";
const subMerchantAccountLength = "13";
const countryLength = "02";
const currencyLength = "03";
const checksumLength = "04";

const versionData = "01";
const qrMultipleTypeData = "11";
const qrOneTimeTypeData = "12";
const applicationIDData = "A000000677010111";
const countryData = "TH";
const bahtCurrencyData = "764";

getSvgIcon(icon) {
  return SvgPicture.asset(iconpath + icon);
}

getImage(image) {
  return imagepath + image;
}

getImageNetwork(url) {
  return url;
}

getHeight(width, [String ratio = "16:9"]) {
  var split = ratio.split(":");
  var wr = double.parse(split[0]);
  var hr = double.parse(split[1]);
  return (width / wr) * hr;
}

enum AccountType { phone, identityNumber, eWallet }

promptpay(String phones, double value) {
  AccountType accountType = phones.length >= 15
      ? (AccountType.eWallet)
      : phones.length >= 13
          ? (AccountType.identityNumber)
          : (AccountType.phone);

  var data = [
    versionID,
    versionLength,
    versionData,
    qrTypeID,
    qrTypeLength,
    qrMultipleTypeData,
    merchantAccountID,
    merchantAccountLength,
    subMerchantApplicationID,
    subMerchantApplicationIDLength,
    applicationIDData,
    _getAccountID(accountType),
    _getAccountLength(accountType, phones),
    _formatAccount(accountType, phones),
    countryID,
    countryLength,
    countryData,
    currencyID,
    currencyLength,
    bahtCurrencyData,
  ];
  // ignore: unnecessary_null_comparison
  if (value != null) {
    data.add(amountID);
    data.add(_formatAmount(value).length.toString().padLeft(2, '0'));
    data.add(_formatAmount(value));
  }

  data.add(checksumID);
  data.add(checksumLength);

  var checksum = _getCrc16XMODEM()
      .convert(utf8.encode(data.join()))
      .toRadixString(16)
      .toUpperCase();
  //print(data.join() + checksum);
  return data.join() + checksum;
}

bool isQRDataValid(String qrData) {
  if (qrData.length < 8) {
    return false;
  }

  final qrDataWithOutChecksum = qrData.substring(0, qrData.length - 4);
  final checksum = qrData.substring(qrData.length - 4, qrData.length);
  final newChecksum = _getCrc16XMODEM()
      .convert(utf8.encode(qrDataWithOutChecksum))
      .toRadixString(16)
      .toUpperCase();

  return newChecksum == checksum;
}

String _getAccountID(AccountType accountType) {
  switch (accountType) {
    case AccountType.eWallet:
      return subMerchantAccountEWalletID;
    case AccountType.identityNumber:
      return subMerchantAccountIdentityID;
    default:
      return subMerchantAccountPhoneID;
  }
}

String _getAccountLength(AccountType accountType, String target) {
  switch (accountType) {
    case AccountType.eWallet:
      return target.length.toString();
    case AccountType.identityNumber:
      return target.length.toString();
    default:
      return ("0066" + target.substring(1, target.length)).length.toString();
  }
}

String _formatAccount(AccountType accountType, String target) {
  switch (accountType) {
    case AccountType.eWallet:
      return target;
    case AccountType.identityNumber:
      return target;
    default:
      return "0066" + target.substring(1, target.length);
  }
}

String _formatAmount(double amount) {
  return amount.toStringAsFixed(2);
}

ParametricCrc _getCrc16XMODEM() {
  // width=16 poly=0x1021 init=0x0000 refin=false refout=false xorout=0x0000 check=0x31c3 residue=0x0000 name="CRC-16/XMODEM"
  return ParametricCrc(16, 0x1021, 0xFFFF, 0x0000,
      inputReflected: false, outputReflected: false);
}

// ignore: non_constant_identifier_names
String gen_promotion_qr(String promotionuid) {
  var uuid = const Uuid();

  // Generate a v1 (time-based) id
  var v1 = uuid.v1(); // -> '6c84fb90-12c4-11e1-840d-7b25c5ee775a'
  return urlpromotiongen + promotionuid + '_' + v1;
}
