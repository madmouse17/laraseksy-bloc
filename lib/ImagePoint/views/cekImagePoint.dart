import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laraseksy_bloc/ImagePoint/bloc/cekimagepoint_bloc.dart';

class CekImagePoint extends StatefulWidget {
  const CekImagePoint({super.key});

  @override
  State<CekImagePoint> createState() => _CekImagePointState();
}

class _CekImagePointState extends State<CekImagePoint> {
  BuildContext? _context;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _context!.read<CekimagepointBloc>().add(
            CekimagepointEvent(),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: Container(
        child: Text('cekimagepoint'),
      ),
    );
  }
}
