import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_e_commerce_app/core/app_route/app_route.dart';
import 'package:simple_e_commerce_app/core/app_route/route_name.dart';
import 'package:simple_e_commerce_app/feature/home/data/repositories/home_repository_impl.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories3_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/usecases/get_home_data_usecase.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/bloc/favorite_bloc.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/bloc/favorite_event.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/bloc/home_event.dart';
import 'package:simple_e_commerce_app/firebase_options.dart';
import 'feature/auth/data/datasource/auth_remote_data_source.dart';
import 'feature/auth/data/repositories/auth_repository_impl.dart';
import 'feature/auth/domain/repositories/auth_repository.dart';
import 'feature/auth/domain/usecase/reset_password_usecase.dart';
import 'feature/auth/domain/usecase/sign_in_usecase.dart';
import 'feature/auth/domain/usecase/sign_up_usecase.dart';
import 'feature/auth/presentation/sign-in/bloc/sign_in_bloc.dart';
import 'feature/auth/presentation/sign-up/bloc/sign_up_bloc.dart';
import 'feature/on_boarding/presentation/bloc/on_boarding_bloc.dart';
import 'feature/splash/presentation/bloc/splash_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(Categories3Adapter());
  await Hive.openBox('favoritesBox');

  final firebaseAuth = FirebaseAuth.instance;
  final authRemoteDataSource = AuthRemoteDataSource(firebaseAuth);
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(authRepository: authRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;

  const MyApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashBloc(FirebaseAuth.instance)),
        BlocProvider(create: (_) => OnBoardingBloc()),
        BlocProvider(
          create:
              (_) => SignInBloc(
                signInUseCase: SignInUseCase(FirebaseAuth.instance),
                resetPasswordUseCase: ResetPasswordUseCase(
                  FirebaseAuth.instance,
                ),
              ),
        ),
        BlocProvider(
          create:
              (_) => SignUpBloc(signUpUseCase: SignUpUseCase(authRepository)),
        ),
        BlocProvider(
          create:
              (_) =>
                  HomeBloc(GetHomeDataUseCase(HomeRepositoryImpl()))
                    ..add(LoadHomeDataEvent()),
        ),
        BlocProvider(create: (_) => FavoriteBloc()..add(LoadFavoritesEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        initialRoute: RouteNames.splashScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}
