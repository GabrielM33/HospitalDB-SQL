create table Patient(

Patient_ID INT NOT NULL,
Patient_Name VARCHAR (100),
Patient_Age INT,
Patient_Address VARCHAR (100),
Patient_Gender VARCHAR(100),
Disease VARCHAR(100)

);

alter table Patient
Add doctor_ID INT NOT NULL

alter table Patient
drop column Patient_Gender

alter table Patient
Add constraint Patient_PK
Primary Key(Patient_ID);

create table Doctor(

Doctor_ID INT NOT NULL,
Doctor_Name VARCHAR(100),
Doctro_Age VARCHAR(100),
Doctor_Gender VARCHAR(100),
Doctor_Address VARCHAR(100),

Constraint Doctor_PK Primary Key(Doctor_ID)
);

Create table Room(

Room_number VARCHAR(50) NOT NULL,
Room_type VARCHAR(100),
Room_Status VARCHAR(100),

Constraint Room_PK Primary Key (Room_number)
);

alter table Patient
Add constraint Patient_Doc_FK
Foreign Key (Doctor_ID) references Doctor (Doctor_ID)

create table Check_IN_OUT(

Patient_ID INT NOT NULL,
Room_number VARCHAR(50),
join_date datetime,
Leave_date datetime,

constraint Patient_IN_FK
Foreign Key (Patient_ID) references Patient(Patient_ID),

constraint Room_IN_FK_FK
Foreign Key(Room_number) references Room(Room_number)
);

insert into Doctor
values 
(1, 'Ricardo', 47, 'male', 'Curitiba'),
(2, 'Bernardo', 53, 'male', 'Curitiba'),
(3, 'Marcelo', 41, 'male', 'Florianopolis'),
(4, 'Antonio', 43, 'male', 'Blumenau'),
(5, 'Marcela', 38, 'female', 'Criciuma'),
(6, 'Guilherme', 39, 'male', 'Curitiba');

insert into Patient
values
(1, 'Matheus', 17, 'Pato Branco', 'Escoliose', 3),
(2, 'Bernardo', 13, 'Curitiba', 'Escoliose', 1),
(3, 'Joao', 51, 'Joinville', 'Hernia de Disco', 4),
(4, 'Marcos', 45, 'Curitiba', 'Artrodese Lombar', 5),
(5, 'Maria', 63, 'Ponta Grossa', 'Espondilolistese', 5);

insert into Room
values
(1, 'Sala 7', 'vazio'),
(2, 'Sala 2', 'vazio'),
(3, 'Sala 5', 'reservado'),
(4, 'Sala 2', 'vazio'),
(5, 'Sala 2', 'reservado');

insert into Check_IN_OUT
values
(1, 2, '2023 - 8 - 2', ''),
(2, 1, '2023 - 8 - 2', '2023 - 8 - 2'),
(3, 4, '2023 - 8 - 2', ''),
(4, 5, '2023 - 8 - 2', '2023 - 8 - 2'),
(5, 3, '2023 - 8 - 2', '');

update Check_IN_OUT
set Leave_date = NULL
where Patient_ID = 1 or Patient_ID = 3;

delete from Doctor
where Doctor_ID = 6;

select * from Doctor

select * from Doctor
where Doctor_Name = 'Antonio'

select Doctor_Name from Doctor

select from Doctor 
where Doctor_Gender = 'male'

select Patient_Name, Disease, Doctor_Name
from Patient, Doctor
where Patient.Patient_ID = Doctor.Doctor_ID

select Patient.Patient_Name, Patient.Disease, Room.Room_Status, Check_IN_OUT.join_date, Check_IN_OUT.Leave_date
from Patient, Check_IN_OUT, Room
where Patient.Patient_ID = Check_IN_OUT.Patient_ID and Check_IN_OUT.Room_number = Room.Room_number and Check_IN_OUT.Leave_date != ''

select Patient.Patient_Name, Patient.Patient_ID, Doctor.Doctor_Name, Patient.Disease, Doctor.Doctor_Name, Patient.Disease, Doctor.Doctor_Age
from Patient, Doctor
where Patient.Doctor_ID = Doctor.Doctor_ID and Doctor.Doctor_Age > 40

select Patient.Patient_ID, Patient.Patient_Name, Patient.Disease, Check_IN_OUT.join_date, Check_IN_OUT.Leave_date, Room.Room_number, Room.Room_Status
from Patient, Room,	Check_IN_OUT
where Patient.Patient_ID = Check_IN_OUT.Patient_ID and Check_IN_OUT.Room_number = Room.Room_number
order by Patient.Patient_ID asc
