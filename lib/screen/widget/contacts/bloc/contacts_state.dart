part of 'contacts_cubit.dart';

@immutable
abstract class ContactsState extends Equatable{
  const ContactsState();
  @override
  List<Object> get props => [];
}

class ContactsInitial extends ContactsState {}
class ContactLoading extends ContactsState{}

class ContactsLoaded extends ContactsState{
  final List<Contacts> contact;

  const ContactsLoaded(this.contact);

  @override
  List<Object> get props => [contact];
}

class ContactsError extends ContactsState{
  final String error;
  const ContactsError(this.error);

  @override
  List<Object> get props => [error];
}
