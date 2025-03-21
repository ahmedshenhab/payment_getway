import 'package:json_annotation/json_annotation.dart';

import 'amount_details.dart';
import 'automatic_payment_methods.dart';
import 'metadata.dart';
import 'payment_method_options.dart';

part 'checkout_response_model.g.dart';

@JsonSerializable()
class CheckoutResponseModel {
  String? id;
  String? object;
  int? amount;
  @JsonKey(name: 'amount_capturable')
  int? amountCapturable;
  @JsonKey(name: 'amount_details')
  AmountDetails? amountDetails;
  @JsonKey(name: 'amount_received')
  int? amountReceived;
  dynamic application;
  @JsonKey(name: 'application_fee_amount')
  dynamic applicationFeeAmount;
  @JsonKey(name: 'automatic_payment_methods')
  AutomaticPaymentMethods? automaticPaymentMethods;
  @JsonKey(name: 'canceled_at')
  dynamic canceledAt;
  @JsonKey(name: 'cancellation_reason')
  dynamic cancellationReason;
  @JsonKey(name: 'capture_method')
  String? captureMethod;
  @JsonKey(name: 'client_secret')
  String? clientSecret;
  @JsonKey(name: 'confirmation_method')
  String? confirmationMethod;
  int? created;
  String? currency;
  dynamic customer;
  dynamic description;
  dynamic invoice;
  @JsonKey(name: 'last_payment_error')
  dynamic lastPaymentError;
  @JsonKey(name: 'latest_charge')
  dynamic latestCharge;
  bool? livemode;
  Metadata? metadata;
  @JsonKey(name: 'next_action')
  dynamic nextAction;
  @JsonKey(name: 'on_behalf_of')
  dynamic onBehalfOf;
  @JsonKey(name: 'payment_method')
  dynamic paymentMethod;
  @JsonKey(name: 'payment_method_options')
  PaymentMethodOptions? paymentMethodOptions;
  @JsonKey(name: 'payment_method_types')
  List<String>? paymentMethodTypes;
  dynamic processing;
  @JsonKey(name: 'receipt_email')
  dynamic receiptEmail;
  dynamic review;
  @JsonKey(name: 'setup_future_usage')
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic source;
  @JsonKey(name: 'statement_descriptor')
  dynamic statementDescriptor;
  @JsonKey(name: 'statement_descriptor_suffix')
  dynamic statementDescriptorSuffix;
  String? status;
  @JsonKey(name: 'transfer_data')
  dynamic transferData;
  @JsonKey(name: 'transfer_group')
  dynamic transferGroup;

  CheckoutResponseModel({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountDetails,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.latestCharge,
    this.livemode,
    this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  factory CheckoutResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CheckoutResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CheckoutResponseModelToJson(this);

  CheckoutResponseModel copyWith({
    String? id,
    String? object,
    int? amount,
    int? amountCapturable,
    AmountDetails? amountDetails,
    int? amountReceived,
    dynamic application,
    dynamic applicationFeeAmount,
    AutomaticPaymentMethods? automaticPaymentMethods,
    dynamic canceledAt,
    dynamic cancellationReason,
    String? captureMethod,
    String? clientSecret,
    String? confirmationMethod,
    int? created,
    String? currency,
    dynamic customer,
    dynamic description,
    dynamic invoice,
    dynamic lastPaymentError,
    dynamic latestCharge,
    bool? livemode,
    Metadata? metadata,
    dynamic nextAction,
    dynamic onBehalfOf,
    dynamic paymentMethod,
    PaymentMethodOptions? paymentMethodOptions,
    List<String>? paymentMethodTypes,
    dynamic processing,
    dynamic receiptEmail,
    dynamic review,
    dynamic setupFutureUsage,
    dynamic shipping,
    dynamic source,
    dynamic statementDescriptor,
    dynamic statementDescriptorSuffix,
    String? status,
    dynamic transferData,
    dynamic transferGroup,
  }) {
    return CheckoutResponseModel(
      id: id ?? this.id,
      object: object ?? this.object,
      amount: amount ?? this.amount,
      amountCapturable: amountCapturable ?? this.amountCapturable,
      amountDetails: amountDetails ?? this.amountDetails,
      amountReceived: amountReceived ?? this.amountReceived,
      application: application ?? this.application,
      applicationFeeAmount: applicationFeeAmount ?? this.applicationFeeAmount,
      automaticPaymentMethods:
          automaticPaymentMethods ?? this.automaticPaymentMethods,
      canceledAt: canceledAt ?? this.canceledAt,
      cancellationReason: cancellationReason ?? this.cancellationReason,
      captureMethod: captureMethod ?? this.captureMethod,
      clientSecret: clientSecret ?? this.clientSecret,
      confirmationMethod: confirmationMethod ?? this.confirmationMethod,
      created: created ?? this.created,
      currency: currency ?? this.currency,
      customer: customer ?? this.customer,
      description: description ?? this.description,
      invoice: invoice ?? this.invoice,
      lastPaymentError: lastPaymentError ?? this.lastPaymentError,
      latestCharge: latestCharge ?? this.latestCharge,
      livemode: livemode ?? this.livemode,
      metadata: metadata ?? this.metadata,
      nextAction: nextAction ?? this.nextAction,
      onBehalfOf: onBehalfOf ?? this.onBehalfOf,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentMethodOptions: paymentMethodOptions ?? this.paymentMethodOptions,
      paymentMethodTypes: paymentMethodTypes ?? this.paymentMethodTypes,
      processing: processing ?? this.processing,
      receiptEmail: receiptEmail ?? this.receiptEmail,
      review: review ?? this.review,
      setupFutureUsage: setupFutureUsage ?? this.setupFutureUsage,
      shipping: shipping ?? this.shipping,
      source: source ?? this.source,
      statementDescriptor: statementDescriptor ?? this.statementDescriptor,
      statementDescriptorSuffix:
          statementDescriptorSuffix ?? this.statementDescriptorSuffix,
      status: status ?? this.status,
      transferData: transferData ?? this.transferData,
      transferGroup: transferGroup ?? this.transferGroup,
    );
  }
}
