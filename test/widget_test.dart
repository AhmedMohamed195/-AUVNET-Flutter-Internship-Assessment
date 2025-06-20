// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_e_commerce_app/feature/auth/data/repositories/auth_repository_impl.dart';

import 'package:simple_e_commerce_app/main.dart';
import 'package:simple_e_commerce_app/feature/auth/data/datasource/auth_remote_data_source.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final firebaseAuth = FirebaseAuth.instance;

    final remoteDataSource = AuthRemoteDataSource(firebaseAuth);

    final authRepository = AuthRepositoryImpl(remoteDataSource);

    await tester.pumpWidget(MyApp(authRepository: authRepository));

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
