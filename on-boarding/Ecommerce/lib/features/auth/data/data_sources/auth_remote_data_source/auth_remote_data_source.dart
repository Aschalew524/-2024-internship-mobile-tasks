import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/entity/User.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
    Future<Either<Failure, bool>> signUp(User user);

  Future<Either<Failure, String>> signIn(User user);

 /*  Future<Either<Failure, bool>> userLogOut();
  Future<Either<Failure, String?>> getToken(); */
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
 // final HttpClient client=HttpClient();
  
  @override
  Future<Either<Failure, String>> signIn(User user) async {
    // TODO: implement signIn
    try{
      final result= await http.post(Uri.parse(Urls.signIn()),
      body:
            {
              'email':user.email,
              'password':user.password,


            });
       if(result.statusCode == 201){
        final responseBOdy = json.decode(result.body);
              final String token = responseBOdy['data']['access_token'];
              return Right(token);

       }    else{
        return const  Left(ServerFailure('error '));
       }


    }catch(e){
      return  Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, bool>> signUp(User user) async{
     try{
      final result= await http.post(Uri.parse(Urls.signUp()),
      body:
            {
              'name':user.name,
              'email':user.email,
              'password':user.password,


            });
       if(result.statusCode == 201){
              return const Right(true);

       }    else{
        return const  Left(ServerFailure('error '));
       }


    }catch(e){
      return  Left(ServerFailure(e.toString()));
    }
 
  }
  
}
