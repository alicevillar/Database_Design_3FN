CREATE DATABASE Leasing_Database;
USE Leasing_Database;

CREATE TABLE Road (
Road_Cod int not null auto_increment, 
Road_Description varchar (500) not null,
primary key (Road_Cod)
);

CREATE TABLE Country (
Country_Cod int not null auto_increment, 
Road_Description varchar (500) not null,
primary key (Country_Cod)
);

CREATE TABLE State (
State_Cod int not null auto_increment, 
State_Description varchar (500) not null,
Country_Cod int not null,
primary key (State_Cod),
foreign key (Country_Cod) references Country (Country_Cod)
);

CREATE TABLE City (
City_Cod int not null auto_increment, 
City_Description varchar (500) not null,
State_Cod int not null, 
primary key (City_Cod),
foreign key (State_Cod) references State (State_Cod)
);

CREATE TABLE Neighborhood (
Neighborhood_Cod int not null auto_increment, 
Road_Description varchar (500) not null,
City_Cod int not null,
primary key (Neighborhood_Cod),
foreign key (City_Cod) references City (City_Cod)
);

CREATE TABLE Contractor (
Age_Cod int auto_increment,
Age_Name varchar (300) not null,
Address varchar (300) not null,
Phone varchar (20) not null,
Email varchar (100) not null,
primary key (Age_Cod)
);
 
CREATE TABLE Issue_Descriptions (
Issue_Cod int auto_increment,
Issue_Description varchar (500),
primary key (Issue_Cod)
); 
 
CREATE TABLE Person (
Person_Cod int not null auto_increment,
Person_Name varchar (300) not null,
Road varchar (300) not null,
Road_Number int not null,
Complement varchar (300) not null,
State varchar (300) not null,
Country varchar (300) not null,
Neighborhood varchar (300) not null,
Phone varchar (20) not null,
Email varchar (100) not null,
primary key (Person_Cod)
);

CREATE TABLE Property (
Property_Cod int not null auto_increment,
Road varchar (300) not null,
Road_Number int not null,
Complement varchar (300) not null,
State varchar (300) not null,
Country varchar (300) not null,
Neighborhood varchar (300) not null,
Property_Type bool,
Property_Size float not null,
Owner_Id int not null,
Pets bool,
primary key (Property_Cod),
foreign key (Owner_Id) references Person (Person_Cod)
);
  
CREATE TABLE Issue (
Issue int not null auto_increment,
Resolved bool,
Issue_date date not null,
Issue_type bool,
Person_Id int,
Property_Id int,
Issue_Cod int,
primary key (Issue),
foreign key (Person_Id) references Person (Person_Cod),
foreign key (Property_Id) references Property (Property_Cod),
foreign key (Issue_Cod) references Issue_Descriptions (Issue_Cod)
);

CREATE TABLE Rental (
Rental_Id int not null auto_increment,
Start_date date,
End_date date,
Deposit decimal (12,2),
Price decimal (12,2),
Pets bool,
Client_Id int not null,
Property_Id int not null,
primary key (Rental_Id),
foreign key (Client_Id) references Person (Person_Cod),
foreign key (Property_Id) references Property (Property_Cod)
);

CREATE TABLE Property_Person (
Property_Id int not null,
Person_Id int not null,
primary key (Property_Id,Person_Id), 
foreign key (Property_Id) references Property (Property_Cod),
foreign key (Person_Id) references Person (Person_Cod)
);

CREATE TABLE Person_Agency (
Person_Id int not null,
Agency_Id int not null,
primary key (Person_Id,Agency_Id), 
foreign key (Person_Id) references Person (Person_Cod),
foreign key (Agency_Id) references Contractor (Age_Cod)
);
 
 #TESTING:

#Inserting values
insert into Person (Person_Name,Road,Road_Number,Complement,State,Country,Neighborhood,Phone,Email) 
values ('Alice','Rua dos JacarandásXXX', '3723','apto 101','Rio de Janeiro','Rio de Janeiro', 'Barra da Tijuca','+5521999999999','alicexxx@xxxxxxx.com.br');

#Selecting all 
SELECT * from Person;

#Deleting values
delete from Person where person_cod = 1  