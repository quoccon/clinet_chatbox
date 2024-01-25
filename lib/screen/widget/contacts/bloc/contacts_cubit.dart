import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import '../../../../models/contacts.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  final Dio dio = Dio();

  ContactsCubit() : super(ContactsInitial());

  Future<void> getContact() async {
    try {
      final response = await dio.get("http://10.0.2.2:1906/api/getallUser");
      print(response.data);
      if (response.statusCode == 200) {
        List<dynamic> dataContact = response.data;
        List<Contacts> contacts = dataContact
            .map((contactJson) => Contacts.fromJson(contactJson))
            .toList();
        emit(ContactsLoaded(contacts));
      } else {
        emit(const ContactsLoaded([]));
      }
    } catch (e) {
      print('Có lỗi khi xử lý yêu cầu $e');
      emit(const ContactsLoaded([]));
    }
  }

  Future<void> findUser(String identifier) async {
    try{
      final response = await dio.get("http://10.0.2.2:1906/api/findUser",
          data: {'identifier': identifier});
      print(response.data);
      if (response.statusCode == 200) {
        List<dynamic> dataContact = response.data;
        List<Contacts> contact = dataContact.map((contactJson) => Contacts.fromJson(contactJson)).toList();
        emit(ContactsLoaded(contact));
      }
    }catch(e){
      print('Đã xay ra lỗi khi tìm kiếm $e');
    }
  }
}
