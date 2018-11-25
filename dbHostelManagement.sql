use dbHostelManagement
go

CREATE TABLE dbHostel (
HostelId int IDENTITY(1,1) PRIMARY KEY,
HostelName varchar(50) not null,
HostelType varchar(7) not null
)
go

insert dbHostel(HostelName,HostelType) values ('Ayesha Hall', 'Girls');

create Table dbEmpoly(
CNIC Bigint primary key not null,
Name varchar(75) not null,
FatherName varchar(75) not null,
PhoneNo Bigint not null,
DOB datetime not null,
Designation varchar(50) not null,
Employ_HostelId int foreign key references dbHostel(HostelId) not null,
CONSTRAINT UN_CNIC UNIQUE (CNIC)
)
go

insert dbEmpoly(CNIC, Name, FatherName, PhoneNo, DOB, Designation, Employ_HostelId) values (3456784328459, 'Faisal', 'Khalid',03387623657,1980-3-4, 'Staff Member', 1);
insert dbEmpoly(CNIC, Name, FatherName, PhoneNo, DOB, Designation, Employ_HostelId) values (3456784321456, 'Azhar', 'Khalid',03345023657,1980-3-3, 'Staff Member', 1);

create Table dbDepartments(
DptId int IDENTITY(1,1) PRIMARY KEY,
DptName varchar(50) not null,
CONSTRAINT UNStudent_Dpt UNIQUE (DptName)
)
go

insert dbDepartments(DptName ) values ('Computer Engineering');
insert dbDepartments(DptName ) values ('Electrical Engineering');

create Table dbStudent (
S_CNIC Bigint primary key not null,
S_RegNO varchar(12) not null,
S_Session varchar(4) not null,
S_Name varchar(75) not null,
S_FatherName varchar(75) not null,
S_Address varchar(75) not null,
S_PhoneNo Bigint not null,
S_DOB date not null,
S_Email varchar(50) not null,
S_DptId int foreign key references dbDepartments(DptId) not null,
S_CurrentDate datetime not null, 
CONSTRAINT UNStudent_CNIC UNIQUE (S_CNIC),
CONSTRAINT UNStudent_RegNO UNIQUE (S_RegNO),
CONSTRAINT UNStudent_Email UNIQUE (S_Email)
)
go

insert dbStudent(S_CNIC,S_RegNO,S_Session,S_Name,S_FatherName,S_Address,S_PhoneNo,S_DOB,S_Email,S_DptId,S_CurrentDate) values(2345678091234, '2016-CE-67', '2016', 'Zahra', 'Afzaal','Lahore', '03325687943','1998-04-02', 'zahra@gmail.com',1, GETDATE());
insert dbStudent(S_CNIC,S_RegNO,S_Session,S_Name,S_FatherName,S_Address,S_PhoneNo,S_DOB,S_Email,S_DptId,S_CurrentDate) values(9865678761232, '2016-CE-57', '2016', 'Maryam', 'Saeed','Lahore', '03256687941','1998-08-01', 'maryam@gmail.com',1, GETDATE());
insert dbStudent(S_CNIC,S_RegNO,S_Session,S_Name,S_FatherName,S_Address,S_PhoneNo,S_DOB,S_Email,S_DptId,S_CurrentDate) values(3942568768212, '2016-CE-53', '2016', 'Alishba', 'Rauf','Lahore', '03458787959','1998-06-07', 'AlishbaRauf@gmail.com',1, GETDATE());

create Table dbRoom(
RoomId int IDENTITY(1,1) primary key not null,
R_HostelID int foreign key references dbo.dbHostel(HostelId),
RoomNO int not null,
RoomCapacity tinyint not null,
Details varchar(900) 
)
go

insert dbRoom(R_HostelID, RoomNO, RoomCapacity) values (1,50,40);

create Table dbAllotment(
AllotmentId int IDENTITY(1,1) primary key not null,
A_RoomId int foreign key references dbRoom(RoomId) not null,
A_StudentId Bigint foreign key references dbStudent(S_CNIC) not null, 
A_Status bit not null,
A_DateIN date not null,
A_DateOut date
)
go

insert dbAllotment(A_RoomId, A_StudentId, A_Status, A_DateIN) values (1,2345678091234,1, '2016-01-07');

create Table dbMenu(
MenuId int IDENTITY(1,1) primary key not null,
MenuName varchar(50) not null,
Menu_HostelId int foreign key references dbHostel(HostelId),
Menu_StartDate date not null,
Menu_EndDate date,
Menu_Comments varchar(200)
)
go
insert dbMenu(MenuName,Menu_HostelId, Menu_StartDate) values ('Biryani',1,'2016-08-02');
insert dbMenu(MenuName,Menu_HostelId, Menu_StartDate) values ('Chicken Karaahi',1,'2016-02-02');
