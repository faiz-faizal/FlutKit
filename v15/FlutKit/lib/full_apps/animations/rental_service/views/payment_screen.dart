import 'package:flutkit/full_apps/animations/rental_service/controllers/payment_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_dotted_line.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late ThemeData theme;
  late PaymentController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.rentalServiceTheme;
    controller = PaymentController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
        init: controller,
        tag: 'payment_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  controller.goBack();
                },
                child: Icon(
                  LucideIcons.chevronLeft,
                ),
              ),
              title: MyText.titleMedium(
                "Booking Details",
                fontWeight: 700,
              ),
              elevation: 0,
              centerTitle: true,
            ),
            body: Padding(
              padding: MySpacing.x(20),
              child: Column(
                children: [
                  booking(),
                  MySpacing.height(20),
                  Expanded(child: payments()),
                  MySpacing.height(20),
                  MyButton.block(
                    onPressed: () {
                      controller.goBack();
                    },
                    elevation: 0,
                    padding: MySpacing.y(20),
                    child: MyText.labelLarge(
                      "Confirm",
                      color: theme.colorScheme.onPrimary,
                      fontWeight: 700,
                    ),
                  ),
                  MySpacing.height(20),
                ],
              ),
            ),
          );
        });
  }

  Widget booking() {
    return MyContainer(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyContainer.rounded(
                      paddingAll: 4,
                      color: theme.colorScheme.primaryContainer,
                      child: Icon(
                        Icons.south_west,
                        color: theme.colorScheme.onPrimaryContainer,
                        size: 16,
                      ),
                    ),
                    MySpacing.width(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodySmall(
                          "From:",
                          fontWeight: 600,
                        ),
                        MySpacing.height(2),
                        MyText.bodyMedium(
                          "15 March",
                          fontWeight: 700,
                        ),
                        MySpacing.height(2),
                        MyText.bodySmall(
                          "10am - 12am",
                          xMuted: true,
                        ),
                      ],
                    ),
                  ],
                ),
                MySpacing.height(20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyContainer.rounded(
                      paddingAll: 4,
                      color: theme.colorScheme.primaryContainer,
                      child: Icon(
                        Icons.north_east,
                        color: theme.colorScheme.onPrimaryContainer,
                        size: 16,
                      ),
                    ),
                    MySpacing.width(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodySmall(
                          "To:",
                          fontWeight: 600,
                        ),
                        MySpacing.height(2),
                        MyText.bodyMedium(
                          "20 March",
                          fontWeight: 700,
                        ),
                        MySpacing.height(2),
                        MyText.bodySmall(
                          "10am - 12am",
                          xMuted: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          MyContainer.bordered(
            borderRadiusAll: Constant.containerRadius.xs,
            padding: MySpacing.xy(12, 24),
            border: Border.all(color: theme.colorScheme.primary),
            child: Column(
              children: [
                Icon(
                  LucideIcons.calendar,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                MySpacing.height(8),
                MyText.bodySmall(
                  "Pick Date",
                  color: theme.colorScheme.primary,
                  fontWeight: 600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget payments() {
    return MyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyLarge(
            "Payment Details",
            fontWeight: 700,
          ),
          MySpacing.height(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              payment("assets/brand/master-card.png", "Visa"),
              payment("assets/brand/google.png", "Google"),
              payment("assets/brand/master-card.png", "Master"),
              payment("assets/brand/paypal.png", "Paypal"),
            ],
          ),
          MySpacing.height(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium(
                'Subtotal',
                fontWeight: 600,
              ),
              MyText.bodyMedium(
                '\$135.5',
                fontWeight: 700,
              ),
            ],
          ),
          MySpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium(
                'Tax (GST)',
                fontWeight: 600,
              ),
              MyText.bodyMedium(
                '\$ 10',
                fontWeight: 700,
              ),
            ],
          ),
          MySpacing.height(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium(
                    'Coupon Discount',
                    fontWeight: 600,
                  ),
                  MyText.bodySmall(
                    '-30%',
                    fontWeight: 600,
                    fontSize: 11,
                    xMuted: true,
                  ),
                ],
              ),
              MyText.bodyMedium(
                '- \$ 15',
                fontWeight: 700,
              ),
            ],
          ),
          MySpacing.height(12),
          Row(
            children: [
              Expanded(child: MySpacing.empty()),
              Expanded(
                  child: MyDottedLine(
                height: 2,
              ))
            ],
          ),
          MySpacing.height(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium(
                'Total',
                fontWeight: 600,
              ),
              MyText.bodyMedium(
                '\$ 130.5',
                fontWeight: 700,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget payment(String image, String title) {
    return MyContainer.bordered(
      paddingAll: 12,
      child: Column(
        children: [
          Image(
            height: 24,
            image: AssetImage(image),
          ),
          MySpacing.height(8),
          MyText.bodySmall(title),
        ],
      ),
    );
  }
}
