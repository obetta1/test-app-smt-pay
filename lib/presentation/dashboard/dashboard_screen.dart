import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_pay_app/core/app_export.dart';
import 'package:smart_pay_app/domain/usecase/get_secret_usecase.dart';
import 'package:smart_pay_app/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:smart_pay_app/presentation/onboarding_one_screen/onboarding_one_screen.dart';

import '../../domain/repository/repository.dart';
import '../../core/widgets/custom_marqee_text.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<DashBoardBloc>(
        create: (context) => DashBoardBloc(
            InitDashboardState(), GetDashboardSecretUseCase(Repository()))
          ..add(DashboardInitialEvent()),
        child: const DashboardScreen());
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late ScrollController _scrollController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
// Initialize ScrollController
    _scrollController = ScrollController();

    // Start scrolling animation

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller);

    _startAnimations();
    _startScrolling();
  }

  void _startAnimations() {
    // Fade out animation
    _controller.forward();

    // Slide animation
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    // Start animations when the screen is loaded
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray600,
        body: Stack(
          children: [
            Container(
              height: 400,
              color: appTheme.teal400,
            ),
            _buildAppBar(context),
            FadeTransition(opacity: _fadeAnimation, child: CustomContainer()),
            Padding(
              padding: const EdgeInsets.only(top: 340.0),
              child: Container(
                  height: 300,
                  padding: EdgeInsets.fromLTRB(14.h, 13.v, 13.h, 14.v),
                  decoration: BoxDecoration(
                    color: appTheme.blueGray300,
                    borderRadius: BorderRadius.circular(16.h),
                  ),
                  child: BlocBuilder<DashBoardBloc, DashboardState>(
                    builder: (context, state) {
                      if (state is DashboardLoadingState) {
                        return CircularProgressIndicator();
                      } else if (state is DashboardLoadedState) {
                        // Fade-out animation

                        return LayoutBuilder(builder: (context, constraints) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${state.secret?.secret}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                height: 20.h,
                                width: double.maxFinite,
                                child: CustomMarqeeText(
                                    text: "${state.secret?.secret}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                        color: appTheme.whiteA700)),
                              ),
                            ],
                          );
                        });
                      } else if (state is DashboardErrorState) {
                        return Text(
                            "error fetching dashboard  secret${state.errorMessage}");
                      } else {
                        return const Text("unknown state");
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 90,
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, right: 311.h),
            onTap: () {
              NavigatorService.goBack();
            }));
  }

  ///scrolling text animation
  void _startScrolling() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (_scrollController.hasClients) {
        // Check if text has reached the end
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.offset) {
          // Scroll back to start
          _scrollController.jumpTo(0);
        } else {
          // Scroll by a small increment
          _scrollController.animateTo(_scrollController.offset + 1,
              duration: Duration(milliseconds: 10), curve: Curves.linear);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }
}
