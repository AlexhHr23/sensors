import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AccelerometerScreen extends ConsumerWidget {
  const AccelerometerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final $accelerometerGravity = ref.watch(accelerometerGravity);
    final $accelerometerUser = ref.watch(accelerometerUserGravity);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aceleròmetro'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Acceleroter gravity'),
            $accelerometerGravity.when(
              data: (value) => Text(value.toString()), 
              error: (e,s) => Text('$e'), 
              loading: () => CircularProgressIndicator()
            ),
            Text('Acceleroter user Gravityu'),
            $accelerometerUser.when(
              data: (value) => Text(value.toString()), 
              error: (e,s) => Text('$e'), 
              loading: () => CircularProgressIndicator()
            )
          ],
        ),
      )
    );
  }
}