import 'package:equatable/equatable.dart';

class PayUParameters extends Equatable {
  final String? merchantId;
  final int? extra1;
  final String? accountId;
  final String? description;
  final String? referenceCode;
  final String? tax;
  final String? taxReturnBase;
  final String? currency;
  final int? amount;
  final String? signature;
  final int? test;
  final String? buyerEmail;
  final String? buyerFullName;
  final String? responseUrl;
  final String? confirmationUrl;
  final String? dataBase;

  const PayUParameters({
    this.merchantId,
    this.extra1,
    this.accountId,
    this.description,
    this.referenceCode,
    this.tax,
    this.taxReturnBase,
    this.currency,
    this.amount,
    this.signature,
    this.test,
    this.buyerEmail,
    this.buyerFullName,
    this.responseUrl,
    this.confirmationUrl,
    this.dataBase,
  });

  @override
  List<Object?> get props => [
        merchantId,
        extra1,
        accountId,
        description,
        referenceCode,
        tax,
        taxReturnBase,
        currency,
        amount,
        signature,
        test,
        buyerEmail,
        buyerFullName,
        responseUrl,
        confirmationUrl,
        dataBase,
      ];
}

class PayUParametersModel extends PayUParameters {
  const PayUParametersModel({
    String? merchantId,
    int? extra1,
    String? accountId,
    String? description,
    String? referenceCode,
    String? tax,
    String? taxReturnBase,
    String? currency,
    int? amount,
    String? signature,
    int? test,
    String? buyerEmail,
    String? buyerFullName,
    String? responseUrl,
    String? confirmationUrl,
    String? dataBase,
  }) : super(
          merchantId: merchantId,
          extra1: extra1,
          accountId: accountId,
          description: description,
          referenceCode: referenceCode,
          tax: tax,
          taxReturnBase: taxReturnBase,
          currency: currency,
          amount: amount,
          signature: signature,
          test: test,
          buyerEmail: buyerEmail,
          buyerFullName: buyerFullName,
          responseUrl: responseUrl,
          confirmationUrl: confirmationUrl,
          dataBase: dataBase,
        );

  factory PayUParametersModel.fromJson(Map<String, dynamic> json) => PayUParametersModel(
        merchantId: json["merchantId"],
        extra1: json["extra1"],
        accountId: json["accountId"],
        description: json["description"],
        referenceCode: json["referenceCode"],
        tax: json["tax"],
        taxReturnBase: json["taxReturnBase"],
        currency: json["currency"],
        amount: json["amount"],
        signature: json["signature"],
        test: json["test"],
        buyerEmail: json["buyerEmail"],
        buyerFullName: json["buyerFullName"],
        responseUrl: json["responseUrl"],
        confirmationUrl: json["confirmationUrl"],
        dataBase: json["dataBase"],
      );

  factory PayUParametersModel.example() => PayUParametersModel.fromJson(const {
        "merchantId": "508029",
        "extra1": 53302,
        "accountId": "515321",
        "description": "Pago en Linea PayU",
        "referenceCode": "TestPayU",
        "tax": "0",
        "taxReturnBase": "0",
        "currency": "USD",
        "amount": 3,
        "signature": "ba9ffa71559580175585e45ce70b6c37",
        "test": 1,
        "buyerEmail": "greko11maister@gmail.com",
        "buyerFullName": "Gregory Iscala",
        "responseUrl": "",
        "confirmationUrl": "",
        "dataBase": ""
      });
}
