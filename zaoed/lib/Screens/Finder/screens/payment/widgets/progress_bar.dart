// ignore_for_file: must_be_immutable

import 'package:zaoed/constants/imports.dart';

class ProgressBar extends StatefulWidget {
  ProgressBar({
    super.key,
    required this.activeStep,
    required this.progress,
  });
  late int activeStep;
  final double progress;
  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      enableStepTapping: false,
      activeStep: widget.activeStep,
      lineStyle: LineStyle(
        lineLength: 130,
        lineType: LineType.normal,
        defaultLineColor: AppColors().gray1,
        finishedLineColor: AppColors().green,
      ),
      showStepBorder: false,
      activeStepBackgroundColor: AppColors().green,
      finishedStepBackgroundColor: AppColors().green,
      internalPadding: 0,
      showLoadingAnimation: false,
      stepRadius: 12,
      borderThickness: 0,
      steps: [
        EasyStep(
          customTitle: Text(
            'التفاصيل',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors().white, fontSize: 16),
          ),
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor:
                widget.activeStep >= 0 ? AppColors().green : AppColors().white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: widget.activeStep >= 0
                  ? AppColors().green
                  : AppColors().white,
              child: widget.activeStep >= 0
                  ? Icon(
                      Icons.check,
                      color: AppColors().gray9,
                      size: 16,
                    )
                  : Container(),
            ),
          ),
        ),
        EasyStep(
          customTitle: Text(
            'الدفع',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors().white, fontSize: 16),
          ),
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor:
                widget.activeStep >= 1 ? AppColors().green : AppColors().white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: widget.activeStep >= 1
                  ? AppColors().green
                  : AppColors().gray1,
              child: widget.activeStep >= 1
                  ? Icon(
                      Icons.check,
                      color: AppColors().gray9,
                      size: 16,
                    )
                  : Container(),
            ),
          ),
        ),
        EasyStep(
          customTitle: Text(
            'الفاتورة',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors().white, fontSize: 16),
          ),
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor:
                widget.activeStep >= 2 ? AppColors().green : AppColors().white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: widget.activeStep >= 2
                  ? AppColors().green
                  : AppColors().gray1,
              child: widget.activeStep >= 2
                  ? Icon(
                      Icons.check,
                      color: AppColors().gray9,
                      size: 16,
                    )
                  : Container(),
            ),
          ),
        ),
      ],
      onStepReached: (index) => setState(() => widget.activeStep = index),
    );
  }
}
