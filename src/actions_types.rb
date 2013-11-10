#
# Autogenerated by Thrift Compiler (0.9.1)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

class Doctor
  include ::Thrift::Struct, ::Thrift::Struct_Union
  CLAVE = 1
  NOMBRE = 2
  DIRECCION = 3
  ESPECIALIDAD = 4
  TELEFONO = 5
  FOTO = 6

  FIELDS = {
    CLAVE => {:type => ::Thrift::Types::STRING, :name => 'clave'},
    NOMBRE => {:type => ::Thrift::Types::STRING, :name => 'nombre'},
    DIRECCION => {:type => ::Thrift::Types::STRING, :name => 'direccion'},
    ESPECIALIDAD => {:type => ::Thrift::Types::STRING, :name => 'especialidad'},
    TELEFONO => {:type => ::Thrift::Types::STRING, :name => 'telefono'},
    FOTO => {:type => ::Thrift::Types::STRING, :name => 'foto'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class AnalisisClinico
  include ::Thrift::Struct, ::Thrift::Struct_Union
  CLAVE = 1
  TIPO = 2
  DESCRIPCION = 3

  FIELDS = {
    CLAVE => {:type => ::Thrift::Types::STRING, :name => 'clave'},
    TIPO => {:type => ::Thrift::Types::STRING, :name => 'tipo'},
    DESCRIPCION => {:type => ::Thrift::Types::STRING, :name => 'descripcion'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Atiende
  include ::Thrift::Struct, ::Thrift::Struct_Union
  CLAVEDOCTOR = 1
  CLAVEPACIENTE = 2
  FECHA = 3
  TRATAMIENTO = 4
  DIAGNOSTICO = 5
  FOTODOCTOR = 6
  FOTOPACIENTE = 7

  FIELDS = {
    CLAVEDOCTOR => {:type => ::Thrift::Types::STRING, :name => 'claveDoctor'},
    CLAVEPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'clavePaciente'},
    FECHA => {:type => ::Thrift::Types::STRING, :name => 'fecha'},
    TRATAMIENTO => {:type => ::Thrift::Types::STRING, :name => 'tratamiento'},
    DIAGNOSTICO => {:type => ::Thrift::Types::STRING, :name => 'diagnostico'},
    FOTODOCTOR => {:type => ::Thrift::Types::STRING, :name => 'fotoDoctor'},
    FOTOPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'fotoPaciente'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Paciente
  include ::Thrift::Struct, ::Thrift::Struct_Union
  CLAVE = 1
  NOMBRE = 2
  DIRECCION = 3
  TELEFONO = 4
  FOTO = 5

  FIELDS = {
    CLAVE => {:type => ::Thrift::Types::STRING, :name => 'clave'},
    NOMBRE => {:type => ::Thrift::Types::STRING, :name => 'nombre'},
    DIRECCION => {:type => ::Thrift::Types::STRING, :name => 'direccion'},
    TELEFONO => {:type => ::Thrift::Types::STRING, :name => 'telefono'},
    FOTO => {:type => ::Thrift::Types::STRING, :name => 'foto'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class SeRealiza
  include ::Thrift::Struct, ::Thrift::Struct_Union
  CLAVEANALISIS = 1
  CLAVEPACIENTE = 2
  FECHAAPLIC = 3
  FECHAENTREGA = 4
  FOTOPACIENTE = 5

  FIELDS = {
    CLAVEANALISIS => {:type => ::Thrift::Types::STRING, :name => 'claveAnalisis'},
    CLAVEPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'clavePaciente'},
    FECHAAPLIC => {:type => ::Thrift::Types::STRING, :name => 'fechaAplic'},
    FECHAENTREGA => {:type => ::Thrift::Types::STRING, :name => 'fechaEntrega'},
    FOTOPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'fotoPaciente'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class ReporteAnalisisPaciente
  include ::Thrift::Struct, ::Thrift::Struct_Union
  CLAVEPACIENTE = 1
  CLAVEANALISIS = 2
  FECHAAPLIC = 3
  NOMBREPACIENTE = 4
  FECHAENTREGA = 5
  TIPO = 6
  DESCRIPCION = 7
  FOTOPACIENTE = 8

  FIELDS = {
    CLAVEPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'clavePaciente'},
    CLAVEANALISIS => {:type => ::Thrift::Types::STRING, :name => 'claveAnalisis'},
    FECHAAPLIC => {:type => ::Thrift::Types::STRING, :name => 'fechaAplic'},
    NOMBREPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'nombrePaciente'},
    FECHAENTREGA => {:type => ::Thrift::Types::STRING, :name => 'fechaentrega'},
    TIPO => {:type => ::Thrift::Types::STRING, :name => 'tipo'},
    DESCRIPCION => {:type => ::Thrift::Types::STRING, :name => 'descripcion'},
    FOTOPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'fotoPaciente'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class ReporteDoctoresPaciente
  include ::Thrift::Struct, ::Thrift::Struct_Union
  CLAVEPACIENTE = 1
  CLAVEDOCTOR = 2
  NOMBREPACIENTE = 3
  NOMBREDOCTOR = 4
  TRATAMIENTO = 5
  DIAGNOSTICO = 6
  FECHA = 7
  FOTODOCTOR = 8
  FOTOPACIENTE = 9

  FIELDS = {
    CLAVEPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'clavePaciente'},
    CLAVEDOCTOR => {:type => ::Thrift::Types::STRING, :name => 'claveDoctor'},
    NOMBREPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'nombrePaciente'},
    NOMBREDOCTOR => {:type => ::Thrift::Types::STRING, :name => 'nombreDoctor'},
    TRATAMIENTO => {:type => ::Thrift::Types::STRING, :name => 'tratamiento'},
    DIAGNOSTICO => {:type => ::Thrift::Types::STRING, :name => 'diagnostico'},
    FECHA => {:type => ::Thrift::Types::STRING, :name => 'fecha'},
    FOTODOCTOR => {:type => ::Thrift::Types::STRING, :name => 'fotoDoctor'},
    FOTOPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'fotoPaciente'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class ReportePacientesAnalisis
  include ::Thrift::Struct, ::Thrift::Struct_Union
  CLAVEPACIENTE = 1
  CLAVEANALISIS = 2
  FECHAAPLICA = 3
  NOMBREPACIENTE = 4
  FECHAENTREGA = 5
  TIPO = 6
  DESCRIPCION = 7
  FOTOPACIENTE = 8

  FIELDS = {
    CLAVEPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'clavePaciente'},
    CLAVEANALISIS => {:type => ::Thrift::Types::STRING, :name => 'claveAnalisis'},
    FECHAAPLICA => {:type => ::Thrift::Types::STRING, :name => 'fechaAplica'},
    NOMBREPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'nombrePaciente'},
    FECHAENTREGA => {:type => ::Thrift::Types::STRING, :name => 'fechaentrega'},
    TIPO => {:type => ::Thrift::Types::STRING, :name => 'tipo'},
    DESCRIPCION => {:type => ::Thrift::Types::STRING, :name => 'descripcion'},
    FOTOPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'fotoPaciente'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class ReportePacientesDoctor
  include ::Thrift::Struct, ::Thrift::Struct_Union
  CLAVEPACIENTE = 1
  CLAVEDOCTOR = 2
  NOMBREPACIENTE = 3
  NOMBREDOCTOR = 4
  TRATAMIENTO = 5
  DIAGNOSTICO = 6
  FECHA = 7
  FOTODOCTOR = 8
  FOTOPACIENTE = 9

  FIELDS = {
    CLAVEPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'clavePaciente'},
    CLAVEDOCTOR => {:type => ::Thrift::Types::STRING, :name => 'claveDoctor'},
    NOMBREPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'nombrePaciente'},
    NOMBREDOCTOR => {:type => ::Thrift::Types::STRING, :name => 'nombreDoctor'},
    TRATAMIENTO => {:type => ::Thrift::Types::STRING, :name => 'tratamiento'},
    DIAGNOSTICO => {:type => ::Thrift::Types::STRING, :name => 'diagnostico'},
    FECHA => {:type => ::Thrift::Types::STRING, :name => 'fecha'},
    FOTODOCTOR => {:type => ::Thrift::Types::STRING, :name => 'fotoDoctor'},
    FOTOPACIENTE => {:type => ::Thrift::Types::STRING, :name => 'fotoPaciente'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

