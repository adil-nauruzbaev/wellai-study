part of 'bloc.dart';

abstract class PhysiciansEvent {}

class FetchPhysicians extends PhysiciansEvent {}

class EditPhysicians extends PhysiciansEvent {
  EditPhysicians(
    this.id,
    this.patchPhysDTO,
  );
  final PhysicianPatchDTO patchPhysDTO;
  final int id;
}

class DeletePhysicians extends PhysiciansEvent {
  DeletePhysicians(this.id);
  final int id;
}
