import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/jobs/model/job_by_id_model.dart';
import 'package:joblisting_user/features/jobs/model/job_model.dart';
import 'package:joblisting_user/remote/remote_services.dart';
import 'package:joblisting_user/ui_utils/snackBar.dart';

class JobController extends ChangeNotifier {
  JobModel? jobModel;
  List<Jobs>? jobs;
  bool isLoading = false;
  JobByIDModel? jobByIDModel;
  Job? jobById;

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> callJobAPI({
    required BuildContext context,
  }) async {
    setIsLoading(true); // Notify the UI to show loading state

    try {
      final data = await RemoteServices.callGetApi(
          url: EndPoints.JOBS, context: context);

      if (data == null) {
        showSnackBar(
          context: context,
          message: 'No response from server.',
          isSuccess: false,
        );
        return;
      }

      final jobResponse = JobModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (jobResponse.status == 200 || jobResponse.status == 201) {
          jobModel = jobResponse;
          jobs = jobModel!.jobs;

          // showSnackBar(
          //   context: context,
          //   message: jobResponse.message,
          //   isSuccess: true,
          // );
        } else {
          showSnackBar(
            context: context,
            message: jobResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      showSnackBar(
        context: context,
        message: 'An error occurred: $e',
        isSuccess: false,
      );
    } finally {
      setIsLoading(false); // Notify the UI to hide the loader
    }
  }

  Future<void> callJobByIdAPI(
      {required BuildContext context, required String jobId}) async {
    setIsLoading(true); // Notify the UI to show loading state

    try {
      final data = await RemoteServices.callGetApi(
          url: "${EndPoints.JOBS}/${jobId}", context: context);

      if (data == null) {
        showSnackBar(
          context: context,
          message: 'No response from server.',
          isSuccess: false,
        );
        return;
      }

      final jobByIdResponse = JobByIDModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (jobByIdResponse.status == 200 || jobByIdResponse.status == 201) {
          jobByIDModel = jobByIdResponse;
          jobById = jobByIDModel!.job;

          // showSnackBar(
          //   context: context,
          //   message: jobResponse.message,
          //   isSuccess: true,
          // );
        } else {
          showSnackBar(
            context: context,
            message: jobByIdResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      showSnackBar(
        context: context,
        message: 'An error occurred: $e',
        isSuccess: false,
      );
    } finally {
      setIsLoading(false); // Notify the UI to hide the loader
    }
  }
}
