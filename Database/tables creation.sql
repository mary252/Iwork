
--create database iwork
--use database iwork

create table Companies(
email varchar(500) primary key,
name varchar(200),
address varchar(500),
domain varchar(500),
type varchar(200),
vision varchar(200),
specialization varchar(500)
)
create table Company_Phones(
company varchar(500),
foreign key (company) references Companies ON DELETE CASCADE ON UPDATE CASCADE,
phone varchar(200),
primary key(company,phone)
)

create table Departments(
code varchar(200),
company varchar(500),
Depname varchar(200),
foreign key (company )references Companies ON DELETE CASCADE ON UPDATE CASCADE,
primary key(code,company)
)
create table Jobs(
title varchar(200),
department varchar(200),
company varchar(500),
short_discription varchar(200),
detailed_discription varchar(1000),
min_experience varchar(200),
salary decimal(7,2),
deadline date ,
no_of_vacancies int ,
working_hours int,
foreign key (department,company) references Departments ON DELETE CASCADE ON UPDATE CASCADE,
primary key(title,department,company)

)

create table Questions(
number int primary key,
question varchar(1000),
answer bit)





create table Job_has_Question(
job varchar(200),
department varchar(200),
company varchar(500),
question int,
foreign key (job,department,company) references Jobs(title,department,company) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (question) references Questions ON DELETE CASCADE ON UPDATE CASCADE,
)

create table Users (
username varchar(200) primary key,
pssword varchar(200),
personal_email varchar(1000) unique,
birth_date date,
years_of_experience int,
first_name varchar(200),
middle_name varchar(200),
last_name varchar(200),
age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date))
)
create table User_Jobs(
username varchar(200),
job Varchar(200),
PRIMARY KEY(username,job),
FOREIGN KEY(username) references Users ON DELETE CASCADE ON UPDATE CASCADE,
)


create table Job_Seekers (
username Varchar(200),
PRIMARY KEY(username),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE,
)


create table Staff_Members (
username Varchar(200),
annual_leaves INT,
company_email Varchar (500),
day_off Varchar(50),
salary INT,
job Varchar(200),
department Varchar(200),
company Varchar(500),
PRIMARY KEY(username),
FOREIGN KEY(username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (job,department,company) REFERENCES Jobs ON DELETE CASCADE ON UPDATE CASCADE,
)


create table Job_Seeker_apply_Job (
job Varchar(200),
department Varchar(200),
company Varchar(500),
job_seeker Varchar(200),
hr_response Varchar(200) default 'pending' not null,
manager_response Varchar(200) default 'pending' not null,
score INT default 0,
PRIMARY KEY(job,department,company,job_seeker),
FOREIGN KEY (job, department, company) REFERENCES Jobs ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (job_seeker) REFERENCES Job_Seekers ON DELETE CASCADE ON UPDATE CASCADE,
)

create table Attendances (
idate Date,
staff Varchar(200),
start_time datetime,
end_time datetime,
PRIMARY KEY(idate,staff),
FOREIGN KEY(staff) REFERENCES Staff_Members ON DELETE CASCADE ON UPDATE CASCADE,
)

create Table Emails (
serial_number INT, 
isubject Varchar(200), 
date DATE, 
body Varchar(2000),
PRIMARY KEY(serial_number),
)


create table Staff_send_Email_Staff (
email_number INT, 
recipient Varchar(200),
sender Varchar(200),
PRIMARY KEY(email_number,recipient,sender),
FOREIGN KEY(email_number) REFERENCES Emails ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (recipient) REFERENCES Staff_Members ,--remember toadd constraints 
FOREIGN KEY (sender) REFERENCES Staff_Members ,--remember toadd constraints
)



----------------------------------------
create table HR_Employees(
    username VARCHAR(200) PRIMARY KEY ,
	foreign key (username) references Staff_Members ON DELETE CASCADE ON UPDATE CASCADE
)


create table Regular_Employees(
    username VARCHAR(200) PRIMARY KEY ,
	foreign key (username) references Staff_Members ON DELETE CASCADE ON UPDATE CASCADE
)
create table Managers(
    username VARCHAR(200) PRIMARY KEY,
	mtype varchar(200), 
	foreign key (username) references Staff_Members ON DELETE CASCADE ON UPDATE CASCADE
)
--------------------------------------


create table Announcements(
    announcement_date DATE ,
    title VARCHAR(200),
    hr_employee VARCHAR(200),
    announcement_type VARCHAR(200),
    announcement_description VARCHAR(200),
    PRIMARY KEY(announcement_date,title),
    FOREIGN KEY (hr_employee) REFERENCES HR_Employees(username) ON DELETE CASCADE ON UPDATE CASCADE 
)


create table Requests(
    request_start_date DATE ,
    applicant VARCHAR(200),
    request_end_date DATE,
    request_date DATE,
    total_days AS DATEDIFF(day,request_start_date,request_end_date),
    hr_employee VARCHAR(200),
    hr_response VARCHAR(200) default 'pending' ,
    manager VARCHAR(200),
    manager_response VARCHAR(200) default 'pending',
    manager_reason VARCHAR(200)
    PRIMARY KEY(request_start_date,applicant),
    FOREIGN KEY (applicant) REFERENCES Staff_Members ,--remember to add constrains (cycles error)
    FOREIGN KEY (hr_employee) REFERENCES HR_Employees ,
    FOREIGN KEY (manager) REFERENCES Managers ON DELETE CASCADE ON UPDATE CASCADE
)

create table Leave_Requests(
    leave_request_start_date DATE,
    applicant VARCHAR(200),
    leave_request_type VARCHAR(200),
    PRIMARY KEY(leave_request_start_date,applicant),
    FOREIGN KEY (leave_request_start_date,applicant) REFERENCES Requests(request_start_date,applicant) ON DELETE CASCADE ON UPDATE CASCADE
)
create table Business_Trip_Requests(
    business_trip_request_sart_date DATE,
    applicant VARCHAR(200),
    destination VARCHAR(200),
    purpose VARCHAR(200),
    PRIMARY KEY(business_trip_request_sart_date,applicant),
    FOREIGN KEY (business_trip_request_sart_date,applicant) REFERENCES Requests(request_start_date,applicant)ON DELETE CASCADE ON UPDATE CASCADE
)

create table HR_Employee_apply_Replace_Request(
    replacement_start_date DATE,
    applicant VARCHAR(200),
    hr_employee VARCHAR(200),
    replacement VARCHAR(200),
    PRIMARY KEY (replacement_start_date,applicant),
    FOREIGN KEY (replacement_start_date,applicant) REFERENCES Requests(request_start_date,applicant),
    FOREIGN KEY (hr_employee) REFERENCES HR_Employees(username),
    FOREIGN KEY (replacement) REFERENCES HR_Employees(username)
)

create table Regular_Employee_apply_Replace_Request(
start__date date ,
applicant varchar(200) ,
reg_employee varchar(200),
replacement varchar(200),
primary key (start__date,applicant),
foreign key(start__date,applicant) references Requests ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(reg_employee) references Regular_Employees ,-- remember to add constraints (Cycling error)
foreign key(replacement) references Regular_Employees )

create table Manager_Employee_apply_Replace_Request(
start__date date ,
applicant varchar(200) ,
manager varchar(200),
replacement varchar(200),
primary  key(start__date,applicant),
foreign key(start__date,applicant) references Requests  ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(manager) references Managers,
foreign key(replacement) references Managers )

create table Projects(
project_name varchar(200),
company varchar(500),
start__date date,
end_date  date,
manager varchar(200),
primary key (project_name,company),
foreign key(company) references Companies,--remember to add constraints (Cycles error)
foreign key(manager) references Managers  )

create table Manager_assign_Regular_Employee_Project(
project_name varchar(200) ,
company varchar(500),
regular_employee varchar(200),
manager varchar(200),
primary key (project_name,company,regular_employee),
foreign key(project_name,company) references Projects  ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(regular_employee) references Regular_Employees ,-- remember to add constraints (Cycles error)
foreign key(manager) references Managers )

create table Tasks(
task_name varchar(200) ,
project_name varchar(200),
company varchar(500),
deadline date,
task_status varchar(200),
task_description varchar(200),
regular_employee varchar(200),
manager varchar(200),
primary key (task_name,project_name,company),
foreign key(project_name,company) references Projects  ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(regular_employee) references Regular_Employees,-- remember to add constraints (Cycles error)
foreign key(manager) references Managers)

create table Task_Comments(
task_name varchar(200) ,
project_name varchar(200) ,
company varchar(500),
comment varchar(200),
primary key (task_name,project_name,company,comment),
foreign key(task_name,project_name,company) references Tasks  ON DELETE CASCADE ON UPDATE CASCADE,
)--theres a warning for the length of the foreign key 
