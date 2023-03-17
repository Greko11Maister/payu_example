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