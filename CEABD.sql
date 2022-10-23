create database CEA;
USE CEA;

DROP TABLE USERS;

CREATE TABLE users (ID bigint AUTO_INCREMENT UNIQUE ,userId varchar(250) NOT NULL, Tipo_Documento Char(1) NOT NULL, Nombres varchar(250)NOT NULL, Apellidos varchar(250)NOT NULL, Direccion varchar(250) NOT NULL, correo_electronico varchar(250) NOT NULL, Telefono Bigint NOT NULL, Celular Bigint NOT NULL, Tipo_Usuario Char(1) NOT NULL, Contrasena varchar(255) NOT NULL, Huella binary NOT NULL, Ultima_Act varchar(250) NOT NULL, created_at datetime, updated_at datetime
                       ,primary key (userId), foreign key (Ultima_Act) references users(userId));

CREATE TABLE Doc_Aprendiz (ID bigint AUTO_INCREMENT, userId varchar(250) NOT NULL, Doc_Soporte varchar(250) NOT NULL, EstadoProcesoAcademico char(1) NOT NULL
                       ,primary key (ID), foreign key (NumDoc_Aprendiz) references Usuario(Documento));                       
 
CREATE TABLE Pago_Aprendiz (ID bigint AUTO_INCREMENT, NumDoc_Aprendiz varchar(250) NOT NULL, Fecha_Pago Date, Pago_Actual Bigint NOT NULL, Pago_Pendiente Bigint NOT NULL, Pago_Total Bigint NOT NULL, Factura_Electronica Varchar(250) NOT NULL
                       ,primary key (ID), foreign key (NumDoc_Aprendiz) references Usuario(Documento));
                       
CREATE TABLE Horario (ID bigint AUTO_INCREMENT, Dia  varchar(250) NOT NULL, Hora date NOT NULL, Materia varchar(250) NOT NULL, Num_Documento varchar(250) NOT NULL, NumDoc_Profesor varchar(250) NOT NULL
                       ,primary key (ID), foreign key (NumDoc_Profesor) references Usuario(Documento), foreign key (Num_Documento) references Usuario(Documento));    

CREATE TABLE Lista_Asistencia (ID bigint AUTO_INCREMENT, ID_Horario bigint NOT NULL, Num_Documento varchar(250) NOT NULL, NumDoc_Profesor varchar(250) NOT NULL, Materia varchar(250) NOT NULL, Fecha_Asis Date NOT NULL, Asistencia char(1) NOT NULL
                       ,primary key (ID), foreign key (ID_Horario) references Horario(ID), foreign key (NumDoc_Profesor) references Usuario(Documento), foreign key (Num_Documento) references Usuario(Documento));    
                       
