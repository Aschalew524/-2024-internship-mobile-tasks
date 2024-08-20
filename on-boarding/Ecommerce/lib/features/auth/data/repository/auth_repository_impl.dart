import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/User.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_sources/auth_local_data_source/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source/auth_remote_data_source.dart';

class UserRepositoryImpl extends UserRepository{
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSourceImpl authLocalDataSourceImpl;

   UserRepositoryImpl({ required this.authRemoteDataSource , required this.authLocalDataSourceImpl});



  @override
   Future<Either<Failure, bool>> signIn(User user) async{
    try{
      final result = await authRemoteDataSource.signIn(user);
      bool succc = false;
      
      result.fold((error){}, 
      (data){
        authLocalDataSourceImpl.saveToken(data);
      succc = true;


      });

      return Right(succc);

      

    }catch(e){
      return const Left(ServerFailure('failed'));
    }
   
    
  }

  @override
  Future<Either<Failure, bool>> signUp(User user) async {
    try{
   final result = await authRemoteDataSource.signUp(user);
      bool succc = false;
      result.fold((error){}, 
      (data){succc = true;});

      return Right(succc);

      

    }catch(e){
      return const Left(ServerFailure('failed'));
    }
   
  }
  
}