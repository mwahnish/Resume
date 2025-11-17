import 'package:flutter/material.dart';
import 'package:wahnish_resume/content/service.dart';

class ServiceWidget extends StatelessWidget{
  final Service service;

  const ServiceWidget({
    super.key,
    required this.service,
  });

  
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(service.serviceName, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
        Text(service.description, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

}