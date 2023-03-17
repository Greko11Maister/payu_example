 import 'dart:async';
 import 'dart:developer';
 import 'dart:io';
 import 'package:collection/collection.dart';
 import 'package:flutter/material.dart';
 import 'package:get/get.dart';
 import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:payu_example/entities/payu_parameters.dart';
 import 'package:webview_flutter/webview_flutter.dart';

 class GatewayPayUWebViewPage extends StatefulWidget {

   final PayUParameters? infoPago;
   const GatewayPayUWebViewPage({
     Key? key,
     required this.infoPago,
   }) : super(key: key);
   @override
   State<GatewayPayUWebViewPage> createState() => _GatewayPayUWebViewPageState();
 }

 class _GatewayPayUWebViewPageState extends State<GatewayPayUWebViewPage> {

   final urlGatewayPayu =  "https://checkout.payulatam.com/ppp-web-gateway-payu";
   final Completer<WebViewController> _controller =
       Completer<WebViewController>();
   final NavigationHistoryObserver _historyObserver =
       NavigationHistoryObserver();
   final ValueNotifier<bool> _pageLoading = ValueNotifier(true);
   @override
   void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
    //  _onDoPostRequest(await _controller.future, context);
   }

   @override
   Widget build(BuildContext context) {
     return ValueListenableBuilder(
         valueListenable: _pageLoading,
         builder: (BuildContext context, bool pageLoading, Widget? child) {
           return WillPopScope(
             onWillPop: () async {
               /*CustomExitOverlays.of(context).webView(
                   webViewController: _controller,
                   onClose: () => _onNavigation())*/
               return true;
             },
             child: SafeArea(
                 child: Stack(
               children: [
                 _buildWebView(context),
               ],
             )),
           );
         });
   }

   Widget _buildWebView(BuildContext context) {
     return WebView(
       javascriptMode: JavascriptMode.unrestricted,
       onWebViewCreated: (WebViewController webViewController) {
         _controller.complete(webViewController);
         webViewController.loadHtmlString(_loadHTML());
       },
       onProgress: (int progress) {
         log("WebView is loading (progress : $progress%)", name: "WebView");
       },
       javascriptChannels: <JavascriptChannel>{
         _toasterJavascriptChannel(context),
       },
       navigationDelegate: _onNavigationDelegate,
       onPageStarted: (String url) {
         _pageLoading.value = true;
         log("Page started loading: $url", name: "WebView");
       },
       onPageFinished: (String url) {
         _pageLoading.value = false;
         log("Page finished loading: $url", name: "WebView");
       },
       gestureNavigationEnabled: true,
     );
   }

   JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
     return JavascriptChannel(
         name: 'Toaster',
         onMessageReceived: (JavascriptMessage message) {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text(message.message)),
           );
         });
   }

   String _loadHTML() {
     return """
       <!DOCTYPE html>
       <html lang="en">
       <head>
         <meta charset="UTF-8">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <title>Document</title>
       </head>
       <body onload="document.form.submit();">
         <form name="form" id='formPago' method='POST' action='${urlGatewayPayu}'>
           <input name='merchantId'    type='hidden'  value='${widget.infoPago?.merchantId}'   >
           <input name='accountId'     type='hidden'  value='${widget.infoPago?.accountId}'   >
           <input name='extra1'     type='hidden'  value='${widget.infoPago?.extra1}'   >
           <input name='extra2'     type='hidden'  value='${widget.infoPago?.dataBase}'   >
           <input name='description'   type='hidden'  value='${widget.infoPago?.description}'   >
           <input name='referenceCode' type='hidden'  value='${widget.infoPago?.referenceCode}'   >
           <input name='amount'        type='hidden'  value='${widget.infoPago?.amount}'   >
           <input name='tax'           type='hidden'  value='${widget.infoPago?.tax}'   >
           <input name='taxReturnBase' type='hidden'  value='${widget.infoPago?.taxReturnBase}'   >
           <input name='currency'      type='hidden'  value='${widget.infoPago?.currency}'   >
           <input name='signature'     type='hidden'  value='${widget.infoPago?.signature}'   >
           <input name='test'          type='hidden'  value='${widget.infoPago?.test}'   >
           <input name='buyerEmail'    type='hidden'  value='${widget.infoPago?.buyerEmail}'   >
           <input name='buyerFullName'    type='hidden'  value='${widget.infoPago?.buyerFullName}'   >
           <input name='responseUrl'    type='hidden'  value='${widget.infoPago?.responseUrl}'   >
           <input name='confirmationUrl'    type='hidden'  value='${widget.infoPago?.confirmationUrl}'   >
         </form>
       </body>
       </html>
       """;
   }

   Future<NavigationDecision> _onNavigationDelegate(
       NavigationRequest request) async {
     final responseUrl = widget.infoPago?.responseUrl;
     if (responseUrl != null && request.url.startsWith(responseUrl)) {
       log("blocking navigation to $request}", name: "WebView");
       await _onNavigation();
       return NavigationDecision.prevent;
     }
     log("allowing navigation to $request", name: "WebView");
     return NavigationDecision.navigate;
   }

   Future<void> _onNavigation() async {
     //Todo: Implementar la navegación
   }
 }
