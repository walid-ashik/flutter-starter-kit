import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/features/home/bloc/global_bloc.dart';

class HomePage extends StatelessWidget {

  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          if(state is GlobalDataLoaded) {
            return Center(child: Text(state.global.deaths.toString()));
          }

          if(state is GlobalError) {
            return Center(child: InkWell(
              onTap: () {
                context.read<GlobalBloc>().add(GetGlobalData());
              },
              child: Text('Retry'),));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
