// features/auth/presentation/blocs/auth/auth_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/get_session_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/sign_up_user_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/sign_up_zemari_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/sign_usecase.dart';
import 'package:eotc_melodies/shared/models/user_model.dart';
import 'package:eotc_melodies/shared/models/zemari_profile_model.dart';


import 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUserUseCase signUpUserUseCase;
  final SignUpZemariUseCase signUpZemariUseCase;
  final SignOutUseCase signOutUseCase;
  final GetSessionUseCase getSessionUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final ChangePasswordUseCase changePasswordUseCase;

  AuthCubit({
    required this.signInUseCase,
    required this.signUpUserUseCase,
    required this.signUpZemariUseCase,
    required this.signOutUseCase,
    required this.getSessionUseCase,
    required this.refreshTokenUseCase,
    required this.forgetPasswordUseCase,
    required this.resetPasswordUseCase,
    required this.changePasswordUseCase,
  }) : super(AuthInitial());

  // Sign In
  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final result = await signInUseCase.execute(email: email, password: password);
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Sign Up User
  Future<void> signUpUser({required UserModel user, required String password}) async {
    emit(AuthLoading());
    try {
      final result = await signUpUserUseCase.execute(user: user, password: password, name: '', email: '', params: {});
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Sign Up Zemari
  Future<void> signUpZemari({
    required UserModel user,
    required String password,
    required ZemariProfileModel zemariProfile,
  }) async {
    emit(AuthLoading());
    try {
      final result = await signUpZemariUseCase.execute(
        user: user,
        password: password,
        zemariProfile: zemariProfile, name: '', email: '', params: {},
      );
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Sign Out
  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await signOutUseCase.execute();
      emit(const AuthSuccess('Signed out successfully'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Get Session
  Future<void> getSession() async {
    emit(AuthLoading());
    try {
      final result = await getSessionUseCase.execute();
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Refresh Token
  Future<void> refreshToken({required String refreshToken}) async {
    emit(AuthLoading());
    try {
      await refreshTokenUseCase.execute(refreshToken);
      emit(const AuthSuccess('Token refreshed successfully'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Forget Password
  Future<void> forgetPassword(String email) async {
    emit(AuthLoading());
    try {
      await forgetPasswordUseCase.execute(email);
      emit(const AuthSuccess('Password recovery email sent'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Reset Password
  Future<void> resetPassword({required String token, required String newPassword}) async {
    emit(AuthLoading());
    try {
      await resetPasswordUseCase.execute(token: token, newPassword: newPassword);
      emit(const AuthSuccess('Password reset successfully'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Change Password
  Future<void> changePassword({required String oldPassword, required String newPassword}) async {
    emit(AuthLoading());
    try {
      await changePasswordUseCase.execute(oldPassword: oldPassword, newPassword: newPassword);
      emit(const AuthSuccess('Password changed successfully'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
