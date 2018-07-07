
/*As a registered or unregistered user I should be able to:*/
/*1 Search for any company by its name or address or its type (national/international).*/

create proc Search_for_Company
(@companyname varchar(200),@companyaddress varchar(500), @companytype varchar(200))
as 

if @companyname is null and @companyaddress is null and @companytype is null
print ('please enter the name , the address ,or the type of the desired company')
else
begin
select *
from Companies c 
where c.name =@companyname or c.address=@companyaddress or c.type=@companytype 
end
go 


/*2 View a list of all available companies on the system along with all information of the company.*/
create proc View_All_Companies_Info
as 
select * 
from Companies
go


/*3 View the information of a certain company along with the departments in that company.*/
--drop proc View_Companys_Departments
CREATE proc View_Companys_Departments
(@compname varchar(200))
as 
select c.*,d.code,d.Depname
from Companies c
inner join Departments d
on c.email=d.company and c.name=@compname

GO
 


/*4 View the information of a certain department in a certain company along with the jobs that have vacancies in it.*/
--drop proc View_Department_Vacancies
CREATE proc View_Department_Vacancies
(@dname varchar(200), @company varchar(500))
as 
select d.code,d.company,d.Depname,j.title
from Jobs j
inner join Departments d
on d.code=j.department and d.company=j.company
where j.no_of_vacancies > 0 and Depname=@dname and j.company =@company

GO


/*5 Register to the website to be able to apply for any job later on. Any user has to register in the website with a unique username and a password, along with all the needed information.*/
create proc Register
(@username varchar(200) ,@password varchar (200),@email varchar(1000),@birth_date datetime ,@years_of_experience int ,@first_name varchar(200),@middle_name varchar(200),@last_name varchar(200))
as 
if exists(select username,pssword,personal_email from Users  where username=@username and personal_email=@email )
print ('you are already registered')
else 
begin
insert into Users (username ,pssword,personal_email,birth_date,years_of_experience,first_name,middle_name,last_name) 
values (@username,@password,@email,@birth_date,@years_of_experience,@first_name,@middle_name,@last_name)

insert into Job_seekers 
values (@username )
end
go 


/*6 Search for jobs that have vacancies on the system and their short description or title contain a string of keywords entered by the user. All information of the job should be displayed along with the company name and the department it belongs to.*/
create proc Search_for_Vacancy
(@keyword varchar(200))
as
if (@keyword is null)
print ('please enter a keyword to search with')
else
begin
declare @x varchar(200)='%'+ @keyword +'%'
 select *
 from Jobs j
 where j.no_of_vacancies>0 and j.short_discription  like @x or j.title like @x 
 end
 go

/*7 View companies in the order of having the highest average salaries.*/
 CREATE proc CompaniesAvgSal
 as
 select  company , avg(salary) as salary
 from Jobs
 group by company 
 order by avg(salary) desc
 go


																				/* As a Job Seeker I should be able to :*/



/*1 Apply for any job as long as I have the needed years of experience for the job. Make sure that a job seeker can’t apply for a job, if he/she applied for it before and the application is still pending.*/

--drop proc job_seeker_apply
CREATE proc job_seeker_apply
(@username varchar(200),@experience int,@jobtitle varchar(200),@department varchar(200) ,@company varchar(500), @out int output )
as 
if @username not in (select username from Job_Seekers ) 
--print ('invalid Access')
set @out=0
else
begin
if  not exists( select j.title from Jobs j  where j.no_of_vacancies > 0 and j.min_experience <= @experience and @jobtitle=j.title and j.department =@department and j.company=@company )
--print ('Insufficiant years of experience')
set @out=1
else 
begin 
if  @username in (select job_seeker from Job_Seeker_apply_Job x where x.job=@jobtitle and x.department=@department and x.company=@company and x.hr_response='pending') 
--print ('Your previously application for this title is pending')
set @out=2
else
begin 
insert into Job_Seeker_apply_Job(job, department,company,job_seeker) 
values (@jobtitle,@department,@company,@username)
--successful
set @out=3
end
end 
end

GO

/*2 View the interview questions related to the job I am applying for.*/
--drop proc viewinterview
 CREATE proc viewinterview
(@username varchar(200) ,@jobtitle varchar(200),@department varchar(200) ,@company varchar(500) ,@out int output)
as
if not exists(select * from Job_Seeker_apply_Job j where j.job_seeker=@username )
--You haven't applied for any job yet  
set @out=0
else

if not exists(select * from Job_Seeker_apply_Job j where j.job_seeker=@username and j.job=@jobtitle and j.company=@company and j.department=j.department)
--you have'nt applied for this job 
set @out=1
else

select x.question
from Job_has_Question q
inner join Job_Seeker_apply_Job j on q.job=j.job and q.department=j.department and q.company=j.company
inner join Questions x on q.question=x.number
where @department =q.department and @company=q.company and @jobtitle=q.job and j.job_seeker=@username
--successful
set @out=2

go

create proc view_score
@username varchar(200),@job varchar(200), @department varchar(200),@company varchar(200),@score int output

as
select @score=j.score
from Job_Seeker_apply_Job j
where @username=j.job_seeker and @job=j.job and @department=j.department and @company=j.company
GO

CREATE proc view_staffmember_info
@username varchar(50) ,
@company varchar(500) output,@department varchar(200) output,@job varchar(200) output
as
select @company=s.company,@department=s.department,@job=s.job
from Staff_Members s
where s.username = @username

GO
create proc view_national_Comapanies
as 
select*
from Companies c
where c.type='National'
GO
create proc view_international_companies
as
select*
from Companies c
where c.type='International'

GO



/*3 Save the score I got while applying for a certain job.*/
--drop proc savescore
CREATE proc savescore 
(@username varchar(200), @Question varchar(1000),@answer bit ,@jobtitle varchar(200),@department varchar(200),@company varchar(500),@out int output)
as
if @answer is null 
--print ('Please enter your answer to this question !')
set @out=0
else 
begin
if exists(
select *
from Job_has_Question j 
inner join Questions q on q.number=j.question
inner join Job_Seeker_apply_Job x on j.job=x.job and j.department=x.department and j.company=x.company and x.job_seeker=@username
)
begin
declare @modelanswer bit
select @modelanswer=answer
from Questions
where question=@Question

if @answer=@modelanswer
begin
update Job_Seeker_apply_Job 
set score =score+1
where job_seeker=@username and job=@jobtitle and department=@department and company=@company
--score recorded
set @out=1
end
end
end

GO


/*4 View the status of all jobs I applied for before (whether it is finally accepted, rejected or still in the review process), along with the score of the interview questions.*/
--drop proc viewstatus
CREATE proc viewstatus 
 (@username varchar(200), @out int output)
 as
 if @username not in ( select job_seeker from Job_seeker_apply_Job x where x.job_seeker=@username  )
 --print ('Invalid Access')
 set @out=0
 else
 begin 
 select job,department,company,manager_response as 'Status',score
 from Job_Seeker_apply_Job j
 where j.job_seeker=@username
 end
 
 go

 /*5 Choose a job from the jobs I was accepted in, which would make me a staff member in the company and the department that offered this job. Accordingly, my salary and company email are set, and I get 30 annual leaves. In addition, I should also choose one day-off other than Friday. The number of vacancies for the assigned job has to be updated too.*/
--drop proc ChooseJob
CREATE proc ChooseJob
 @username varchar(200),@chosenjob varchar(200),@department varchar(200),@company varchar(200),@dayoff varchar(200),@out int output
 as
 if @dayoff ='Friday'
 set @out=0
 --print('Please choose a day off other than Friday')
 else
 begin
 if not exists (select * from Job_Seeker_apply_Job where job_seeker=@username and job=@chosenjob and department=@department and company=@company)
 --print('Inavlid username ')
 set @out=1
 else 
 begin
 if  exists (select * from Job_Seeker_apply_Job where job_seeker=@username and job=@chosenjob and department=@department and company=@company and manager_response='Rejected')
 --print('Sorry! you weren''t accepted in this job')
 set @out =2
 else 
 begin 
 if  exists (select * from Job_Seeker_apply_Job where job_seeker=@username and job=@chosenjob and department=@department and company=@company and manager_response='pending')
 set @out=3
 --print('Sorry! your application is still pending')
 else 
 begin
 declare @compmail varchar(500) = @username + substring(@company,6,len(@company)) 
 declare @salary int
 select @salary=salary from Jobs where title=@chosenjob
 insert into Staff_Members 
 values (@username,30,@compmail,@dayoff,@salary,@chosenjob,@department,@company)
 if @chosenjob like '%HR%'
 begin
 insert into HR_Employee
 values(@username)
 end
 else
 begin
 if @chosenjob like '%Manager%' 
 begin
 declare @type varchar(200) =substring(@department,1,len(@department)-2)
 insert into Managers 
 values 
(@username,@type)
 end
 else
 begin
 insert into Regular_Employees 
 values (@username)
 end
 end
 end
 --successful
 set @out=4
 end 
 end
 end
 GO


 /*6 Delete any job application I applied for as long as it is still in the review process.*/
--drop proc DeleteApp
CREATE proc DeleteApp
 (@username varchar(200), @jobtitle varchar(200),@department varchar(200),@company varchar(500), @out int output)
 as
  if not exists(select * from Job_Seeker_apply_Job  where job_seeker=@username and job=@jobtitle and department=@department and company=@company  )
  --print ('The application you are trying to delete doesn''t exist ')
  set @out=0
  else
  begin
  if exists(select * from Job_Seeker_apply_Job where job_seeker=@username and job=@jobtitle and department=@department and company=@company and manager_response='Approved' )
  --print ('The application you are trying to delete was accepted')
  set @out=1
  else
  begin
   if  exists(select * from Job_Seeker_apply_Job j where j.job_seeker=@username and j.job=@jobtitle and j.department=@department and j.company=@company and manager_response='Rejected' )
  --print ('The application you are trying to delete was rejected')
  set @out=2
  else
  begin
  
   delete 
   from Job_Seeker_apply_Job 
   where job_seeker=@username and job=@jobtitle and department=@department and company=@company and manager_response='pending'
   --print ('Application Successfully deleted')
   set @out=3
end
end
end

GO


													--“As a regular employee, I should be able to ...”--

--3 After finalizing a task, I can change the status of this task to ‘Fixed’ as long as it did not pass the deadline--done
--drop proc Finalizing_Task
CREATE proc Finalizing_Task
@username varchar(200),
@task_name varchar(200),@project_name varchar(200) ,@company varchar(500) ,@out int output
as
if not exists(select * from Regular_Employees where username=@username)
--Invalid access
set @out=0
else 
begin
if not exists(select * from Tasks
where task_name=@task_name and project_name=@project_name and company=@company and regular_employee=@username)
set @out=1
else 
begin
if not exists(select * from Tasks
where task_name=@task_name and project_name=@project_name and company=@company and regular_employee=@username
and  CURRENT_TIMESTAMP <= deadline )
--Passed deadline
set @out=2
else
begin
set @out=3
update Tasks
set task_status='Fixed'
where task_name=@task_name and project_name=@project_name and company=@company
--success

end
end
end

GO


/*4 Work on the task again (a task that was assigned to me before). I can change the status of this
task from ‘Fixed’ to ‘Assigned’ as long as the deadline did not pass and it was not reviewed by the
manager yet*/--done
--drop proc Update_Task
CREATE proc Update_Task
@regular_employee varchar(200),@task_name varchar(200),@project_name varchar(200) ,@company varchar(500),@out int output
as
if not exists(select * from Regular_Employees where username=@regular_employee)
--Invalid access
set @out=0
else
begin
if not exists(select * from Tasks
where task_name=@task_name and project_name=@project_name and company=@company and regular_employee=@regular_employee )
--Not assigned to this task
set @out=1
else
begin
if not exists(select * from Tasks
where task_name=@task_name and project_name=@project_name and company=@company and regular_employee=@regular_employee 
and task_status='Fixed')
--Task's status isn't fixed
set @out=2
else
begin
if not exists(select * from Tasks
where task_name=@task_name and project_name=@project_name and company=@company and regular_employee=@regular_employee 
and task_status='Fixed' and current_timestamp <deadline) 
--deadline passed
set @out=3
else
begin
update Tasks
set task_status='Assigned'
where current_timestamp <deadline and @task_name=task_name and @project_name=project_name and @company=company
--successful
set @out=4
end
end
end
end

GO


															/*“As a manager, I should be able to ...”*/

/*1 View new requests from staff members working in my department. Note that only managers with type = ‘HR’ are allowed to review requests applied for by HR employees, and this manager’s review is considered the final decision taken for this request, i.e. it does not pass by an HR employee afterwards*/
create proc Manager_View_Requests
@username VARCHAR(200),
@department Varchar(200),
@company Varchar(500)
as
if exists(select * from Managers where username=@username) and exists( select * from Staff_Members s where s.username=@username 
and s.department=@department and s.company=@company)
begin
select *
from Requests r inner join Staff_Members s on r.applicant=s.username
where s.department=@department and s.company=@company
end
go

/*2 Accept or reject requests from staff members working in my department before being reviewed by
the HR employee. In case of disapproval, I should provide a reason to be saved.*/

--done
create proc Manger_Accept_Request
@username varchar(200),
@request_start_date DATE ,
@applicant VARCHAR(200),
@department Varchar(200),
@company Varchar(500)
as
if exists(select * from Managers where username=@username) and exists( select * from Staff_Members where username=@username 
and department=@department and company=@company) and exists(select * from Staff_Members where username=@applicant and
department=@department and company=@company)
update Requests
set manager=@username , manager_response='Approved'
where request_start_date=@request_start_date and applicant=@applicant
go

--done
create proc Manager_Reject_Request
@username varchar(200),
@request_start_date DATE ,
@applicant VARCHAR(200),
@department Varchar(200),
@company Varchar(500),
@manager_reason VARCHAR(200)
as
if not exists(select * from Managers where username=@username)
print('Invalid Access')
else 
begin

if not exists( select * from Staff_Members where username=@username and department=@department and company=@company) 
print('Invalid Access')
else 
begin
if exists(select * from Staff_Members where username=@applicant and department=@department and company=@company)
begin
update Requests
set manager=@username , manager_response='Rejected', manager_reason=@manager_reason
where request_start_date=@request_start_date and applicant=@applicant
print ('Request rejected successfully ')
end 
end
end
go



/*3 View applications for a specific job in my department that were approved by an HR employee. For
each application, I should be able to check information about the job seeker, job, and the score
he/she got while applying.*/--done
create proc Manager_Veiw_Job
@username varchar(200),
@title varchar(200),
@department varchar(200),
@company varchar(500)
as 
if not exists( select * from Managers where username=@username)
print ('Invalid access')
else 
begin
if not exists( select * from Staff_Members where username=@username and department=@department and company=@company)
print ('Invalid access')
else 
begin
if exists(select * from Jobs where title=@title and department=@department and company=@company)
begin
select j.*,u.*,a.score
from Jobs j, Users u,Job_Seeker_apply_Job a
where j.title=a.job and j.title=@title and j.department=a.department and j.department=@department and j.company=a.company and
j.company=@company and u.username=a.job_seeker and a.hr_response='Approved'
end
else 
print ('There is not accepted applications for this specific job title')
end
end
go

/*4 Accept or reject job applications to jobs related to my department after being approved by an HR
employee.*/
--done
--drop proc Manager_approve_Job
create proc Manager_approve_Job
@username varchar(200),
@title varchar(200),
@department varchar(200),
@company varchar(500),
@job_seeker varchar(200)
as
if not exists( select * from Managers where username=@username) 
print('Invalid Access')
else 
begin
if not exists( select * from Staff_Members where username=@username and department=@department and company=@company)
print('Invalid Access')
else 
begin
if not exists(select * from Jobs where title=@title and department=@department and company=@company)
print('Wrong job title or department code or company email')
else 
begin
if exists(select * from Job_Seeker_apply_Job where job=@title and job_seeker=@job_seeker and hr_response='Approved')
update Job_Seeker_apply_Job
set manager_response='Approved'
where job=@title and job_seeker=@job_seeker
print ('Application approved successfully')
end 
end
end
go
--done
CREATE proc Manager_reject_job
@username varchar(200),
@title varchar(200),
@department varchar(200),
@company varchar(500),
@job_seeker varchar(200)
as
if not exists( select * from Managers where username=@username)
print('Invalid Access')
else 
begin
if not exists( select * from Staff_Members where username=@username and department=@department and company=@company)
print('Invalid Access')
else 
begin
if not exists(select * from Jobs where title=@title and department=@department and company=@company)
print('Wrong job title or department code or company email')
else 
begin
if exists(select * from Job_Seeker_apply_Job where job=@title and job_seeker=@job_seeker and hr_response='Approved')
update Job_Seeker_apply_Job
set manager_response='Rejected'
where job=@title and job_seeker=@job_seeker
print ('Application rejected successfully')
end 
end
end
go


--5 Create a new project in my department with all of its information--done
CREATE proc Create_New_Project
@project_name varchar(200),
@company varchar(500),
@department varchar(200),
@start__date datetime,
@end_date  datetime,
@manager varchar(200),
@result int output
as
if exists(select * from Projects where project_name=@project_name and company=@company)
begin
set @result=1
end
else
begin
if not exists( select * from Managers where username=@manager) 
begin
print('Invalid Access')
set @result=0
end
else 
begin
if  exists( select * from Staff_Members where username=@manager and department=@department and company=@company)
begin
begin
insert into Projects values(@project_name,@company,@start__date,@end_date,@manager)
print('Project created successfully')
set @result=2
end
end
end
end
go

/*6 Assign regular employees to work on any project in my department. Regular employees should be
working in the same department. Make sure that the regular employee is not working on more than
two projects at the same time.*/--done
--drop proc Manager__assign_regular_employee_project
CREATE proc Manager__assign_regular_employee_project
@project_name varchar(200) ,
@company varchar(500),
@department varchar(200),
@regular_employee varchar(200),
@manager varchar(200),
@status int output
as
if exists (select * from Manager_assign_Regular_Employee_Project where project_name=@project_name and regular_employee=@regular_employee)
begin
set @status=5
end
else
begin
if not exists( select * from Managers where username=@manager)
begin
print('Invalid Access')
set @status=0
end
else 
begin
if not exists( select * from Staff_Members where username=@manager and department=@department and company=@company) 
begin
print('Invalid Access')
set @status=1 
end
else 
begin
if not exists(select * from Staff_Members where username=@regular_employee and department=@department and company=@company) 
begin
print('There is no employee having this username')
set @status=2 
end
else 
begin
if  ((select count(*) from Manager_assign_Regular_Employee_Project where regular_employee=@regular_employee) >=2)
begin
print('This employee is already assigned to two other projects')
set @status=3 
end
else 
begin
if  exists(select *From Projects p inner join Staff_Members s on p.manager=s.username where p.project_name=@project_name and s.company=@company and s.department=@department)
begin
insert into Manager_assign_Regular_Employee_Project values(@project_name,@company,@regular_employee,@manager)
print('Employee assigned successfully to the project')
set @status=4 
end
end
end
end
end
end
go

/*7 Remove regular employees assigned to a project as long as they don’t have tasks assigned to him/her
in this project.*/--done
--drop proc Manager_Remove_Regular_employee_from_Project
CREATE proc Manager__Remove_Regular_employee_from_Project
@project_name varchar(200) ,
@company varchar(500),
@department varchar(200),
@regular_employee varchar(200),
@manager varchar(200),
@status int output 
as
if not exists( select * from Managers where username=@manager)
begin
print('Invalid Access')
set @status=0
end
else 
begin
if not exists( select * from Staff_Members where username=@manager and department=@department and company=@company) 
begin
print('Invalid Access')
set @status=1
end
else 
begin
if  not exists(select * from Manager_assign_Regular_Employee_Project where project_name=@project_name and company=@company and regular_employee=@regular_employee )
begin
print('This employee is not assigned to this project')
set @status=2
end
else 
begin
if exists(select *from Tasks where project_name=@project_name and company=@company and regular_employee=regular_employee)
begin
set @status=3
end
else
begin
if exists(select *From Projects p inner join Staff_Members s on p.manager=s.username where p.project_name=@project_name and s.company=@company and s.department=@department)
begin
delete from Manager_assign_Regular_Employee_Project
where project_name=@project_name and company=@company and regular_employee=@regular_employee
print('This employee is not assigned to this project anymore')
set @status=4
end
end
end
end
end
go


/*8 Define a task in a project in my department which will have status ‘Open’.*/--done
--drop proc Manager_create_task
CREATE proc Manager_create_task
@task_name varchar(200) ,
@project_name varchar(200),
@company varchar(500),
@department varchar(200),
@deadline datetime,
@task_description varchar(200),
--@regular_employee varchar(200),
@manager varchar(200),
@result int output
as
if exists(select * from Tasks where task_name=@task_name and project_name=@project_name and company=@company)
begin
set @result=2
end
else
begin
if not exists( select * from Managers where username=@manager) 
begin
print('Invalid Access')
set @result=0
end
else 
begin
if not exists( select * from Staff_Members where username=@manager and department=@department and company=@company)
begin
print('Invalid Access')
set @result=0
end
else 
begin
if not exists(select * from Projects where project_name=@project_name and company=@company)
begin
print('The project you are trying to add tasks to does not exist')
set @result=1
end
else 
begin
if  exists(select *From Projects p inner join Staff_Members s on p.manager=s.username where p.project_name=@project_name and s.company=@company and s.department=@department)
begin
insert into Tasks values(@task_name,@project_name,@company,@deadline,'Open',@task_description,null,@manager)
print ('Task created successfully')
set @result=3
end
end
end
end
end
go

/*9 Assign one regular employee (from those already assigned to the project) to work on an already
defined task by me in this project.*/--done
CREATE proc Manger_Assign_Regular_Employee_Task
@task_name varchar(200) ,
@project_name varchar(200),
@company varchar(500),
@regular_employee varchar(200),
@manager varchar(200),
@department varchar(200),
@result int output
as
if exists(select * from Tasks where task_name=@task_name and project_name=@project_name and task_status='Assigned')
begin
set @result=4
end
else
begin
if not exists( select * from Managers where username=@manager) 
begin
print('Invalid Access')
set @result=0
end
else 
begin
if  not exists( select * from Staff_Members where username=@manager and department=@department and company=@company)
begin
print('Invalid Access')
set @result=0
end
else 
begin
if not exists (select * from Manager_assign_Regular_Employee_Project where project_name=@project_name and company=@company and regular_employee=@regular_employee ) 
begin
print('The Emplooy you are trying to assign to this employee is not a part of this project')
set @result=1
end
else 
begin
if  exists(select * from Tasks where task_name=@task_name and project_name=@project_name and company=@company and manager=@manager)
begin
update Tasks
set regular_employee=@regular_employee , task_status='Assigned'
where task_name=@task_name and project_name=@project_name and company=@company
print ('Employee assigned to task successfully')
set @result=3
end
else
begin
set @result=2
end
end
end
end
end
go


/*10 Change the regular employee working on a task on the condition that its state is ‘Assigned’, i.e. by
assigning it to another regular employee.*/--done
CREATE proc Manager_Change_Regular_Employee_Task
@task_name varchar(200) ,
@project_name varchar(200),
@company varchar(500),
@regular_employee varchar(200),
@manager varchar(200),
@department varchar(200),
@result int output
as
if not exists( select * from Managers where username=@manager)
begin
print('Invalid Access')
set @result=0
end
else 
begin
if  not exists( select * from Staff_Members where username=@manager and department=@department and company=@company)
begin
print('Invalid Access')
set @result=0
end
else 
begin
if not exists(select * from Manager_assign_Regular_Employee_Project where company=@company and project_name=@project_name and regular_employee=@regular_employee)
begin
set @result=1
end
else
begin
if  exists(select * from Tasks where task_name=@task_name and project_name=@project_name and company=@company and task_status='Assigned')
begin
update Tasks
set regular_employee=@regular_employee
where task_name=@task_name and project_name=@project_name and company=@company
print('Assigned Employee successfully changed')
set @result=2
end
else
begin
set @result=3
end
end
end
end
go

/*11 View a list of tasks in a certain project that have a certain status.*/--done
create proc Manager_Veiw_Tasks
@project_name varchar(200),
@company varchar(500),
@manager varchar(200),
@task_status varchar(200),
@department varchar(200)
as
if not exists( select * from Managers where username=@manager)
print('Invalid Access')
else 
begin
if  exists( select * from Staff_Members where username=@manager and department=@department and company=@company)
select *
from Tasks
where project_name=@project_name and company=@company and task_status=@task_status
end
go
/*12 Review a task that I created in a certain project which has a state ‘Fixed’, and either accept or
reject it. If I accept it, then its state would be ‘Closed’, otherwise it will be re-assigned to the same
regular employee with state ‘Assigned’. The task should have now a new deadline.*/
--done
 CREATE proc Review_Accept_Task
@task_name varchar(200) ,
@project_name varchar(200),
@company varchar(500),
@manager varchar(200),
@department varchar(200)
as
if not exists( select * from Managers where username=@manager)
print('Invalid Access')
else 
begin
if  not exists( select * from Staff_Members where username=@manager and department=@department and company=@company)
print('Invalid Access')
else 
begin
if  exists (select * from Tasks where task_name=@task_name and project_name=@project_name and company=@company and manager=@manager)
update Tasks
set task_status='Closed'
where task_name=@task_name and company=@company and project_name=@project_name
print('Task Fixed Successfully')
end
end
go

--done
create proc Review_Reject_Task
@task_name varchar(200) ,
@project_name varchar(200),
@company varchar(500),
@deadline datetime,
@manager varchar(200),
@department varchar(200)
as
if not exists( select * from Managers where username=@manager) 
print('Invalid Access')
else 
begin
if not exists( select * from Staff_Members where username=@manager and department=@department and company=@company)
print('Invalid Access')
else 
begin
if  exists (select * from Tasks where task_name=@task_name and project_name=@project_name and company=@company and manager=@manager)
update Tasks
set task_status='Assigned',deadline=@deadline
where task_name=@task_name and company=@company and project_name=@project_name
print('Task Assigned Successfully')
end
end
go



use iwork

                                        --------------“As a staff member, I should be able to ...”--------------

--1 Check-in once I arrive each day.
GO
--drop proc Staff_Member_Check_in
go
create proc Staff_Member_Check_in
@username Varchar(200) ,
@dayoff int output
as
if(@username is null)
print 'username cannot be null'
else
if  not exists(select s.username
from Staff_Members s
where s.username = @username
and s.day_off = Datename(weekday,getdate()) or Datename(weekday,getdate()) = 'Friday' ) 
begin
insert into Attendances (idate,staff,start_time) values(CAST(getdate() as date),@username,getdate())
set @dayoff = 0;
end
else 
begin
print 'cannot check in on day off !'
set @dayoff = 1;
end


--2 Check-out before I leave each day.
GO
--drop proc Staff_Member_Check_out
create proc Staff_Member_Check_out
@username Varchar(200),
@dayoff int output  
as
if(@username is null)
print 'username cannot be null'
else
begin
if not exists(select s.username
from Staff_Members s
where s.username = @username
and s.day_off = Datename(weekday,getdate()) or Datename(weekday,getdate()) = 'Friday' ) 
begin
set @dayoff =0;
if exists (select *
from Staff_Members s
where s.username = @username )
begin
update Attendances
set end_time = getdate()
where staff = @username and CAST(start_time as date)=CAST(getdate() as date)
end
end
else
set @dayoff=1;
end



--3 View all my attendance records (check-in time, check-out time, duration, missing hours) within a certain period of time.
GO
--drop proc View_my_attendance
create proc View_my_attendance
@username Varchar(50),
@start_period date,
@end_period date,
@missing_hours float output,
@duration float output

as
declare @durationH float;
declare @missing_hoursH float;

with temp as(
select *
from Attendances
where staff = @username )

--UNIX_TIMESTAMP(temp.end_time) - UNIX_TIMESTAMP(temp.start_time)
select @durationH= abs(DATEDIFF(MINUTE, temp.end_time,temp.start_time ))
from temp
set @duration = (@durationH/60);

with tempp as (
select j.working_hours as 'working_hours'
from Jobs j, Staff_Members s
where s.job = j.title 
)

select @missing_hoursH = abs(tempp.working_hours - (@duration))
from tempp;
set @missing_hours = @missing_hoursH

select  a.staff, a.idate, a.start_time,a.end_time,@duration as'duration',@missing_hours as'missing hours in hrs'
from Attendances a
where (idate between @start_period and @end_period) and a.staff= @username




--4 Apply for requests of both types: leave requests or business trip requests, by supplying all the
--needed information for the request. As a staff member, I can not apply for a leave if I exceeded the
--number of annual leaves allowed. If I am a manager applying for a request, the request does not
--need to be approved, but it only needs to be kept track of. Also, I can not apply for a request when
--it’s applied period overlaps with another request.

--Leave_Request
GO
--drop proc Apply_For_Leave_Request
create proc Apply_For_Leave_Request
@username varchar(50),
@request_start_date datetime,
@request_end_date datetime,
@request_type varchar(50),
@message int output
as
if not exists (
select*
from Requests r
where r.applicant = @username and (@request_start_date between r.request_start_date and r.request_end_date) or (@request_end_date between r.request_start_date and r.request_end_date)
)
begin
set @message = 0;
if exists (select m.username
				from Managers m
				where m.username = @username) -- to check if i am a manager
begin
if exists (select r.applicant,r.request_date,r.request_start_date,r.request_end_date,r.hr_response,r.manager_response 
from Staff_Members s , Requests r
where s.username = @username and (s.annual_leaves > 0) )
begin
insert into Requests (request_start_date,applicant,request_end_date,request_date) values (@request_start_date,@username,@request_end_date,getdate())
insert into Leave_Requests (leave_request_start_date,applicant,leave_request_type) values (@request_start_date,@username,@request_type)
end
else
set @message = 2;
end


else
begin --not a manager
if exists (select*
from Staff_Members 
where username = @username and (annual_leaves > 0) )
begin
insert into Requests (request_start_date,applicant,request_end_date,request_date) values (@request_start_date,@username,@request_end_date,getdate())
insert into Leave_Requests (leave_request_start_date,applicant,leave_request_type) values (@request_start_date,@username,@request_type)
end
else
set @message = 2;
end

end

else
begin
print'can not apply for a request when it’s applied period overlaps with another request.'
set @message =1;
end



--Business_Trip_Request
Go
--drop proc Apply_For_Business_Trip_Requests
create proc Apply_For_Business_Trip_Requests
@username varchar(50),
@request_start_date datetime,
@request_end_date datetime,
@destination VARCHAR(200),
@purpose VARCHAR(200),
@message1 int output
as
if not exists (
select*
from Requests r
where r.applicant = @username and (@request_start_date between r.request_start_date and r.request_end_date) or (@request_end_date between r.request_start_date and r.request_end_date)
)
begin
set @message1 = 0;
if exists (select m.username
				from Managers m
				where m.username = @username) -- to check if i am a manager
begin
select *
from Staff_Members s
where s.username=@username 
insert into Requests (request_start_date,applicant,request_end_date,request_date) values (@request_start_date,@username,@request_end_date,getdate())
insert into Business_Trip_Requests (business_trip_request_sart_date,applicant,destination, purpose ) values(@request_start_date,@username,@destination,@purpose)
end

else
begin
select *
from Staff_Members s
where s.username=@username 
insert into Requests (request_start_date,applicant,request_end_date,request_date) values (@request_start_date,@username,@request_end_date,getdate())
insert into Business_Trip_Requests (business_trip_request_sart_date,applicant,destination, purpose ) values(@request_start_date,@username,@destination,@purpose)
 end
 end
 else
 begin
print'can not apply for a request when it’s applied period overlaps with another request.'
set @message1 = 1;
end



 --5 View the status of all requests I applied for before (HR employee and manager responses).
 GO
 --drop proc View_status_of_requests
  create proc View_status_of_requests
 @username varchar(50)
 as
 if not exists ( select*
			from Requests
			where applicant = @username)
print 'there are not request made yet !'
else
select r. request_start_date, r.request_date, r.hr_response, r.manager_response
from Requests r
where r.applicant = @username --and (r.request_date < getdate())



 

 
--6 Delete any request I applied for as long as it is still in the review process.
 GO
 --drop proc Delete_request
 create proc Delete_request
 @username varchar(50),
 @deleted_request_start_date date,
 @delete int output
 as
 if exists (select*
			from Requests r
			where r.applicant = @username and (r.hr_response = 'pending' or r.manager_response = 'pending' ) and @deleted_request_start_date = request_start_date )
begin
set @delete = 0;
delete from Requests 
where applicant = @username and (hr_response = 'pending' or manager_response = 'pending') and @deleted_request_start_date = request_start_date
end
else 
begin
print 'cannot delete an approved request'
set @delete = 1;
end


--7 Send emails to staff members in my company.
GO
--drop proc send_mails
create proc send_mails
@username varchar(50),
@recipient Varchar(50),
@isubject varchar(50),
@body varchar(500),
@serial_number INT,
@no int output
as
if exists (select*
from Staff_Members s1, Staff_Members s2
where s1.username = @username and s2.username = @recipient and s1.company = s2.company)
begin
set @no =0;
select s.username as'sender',rec.username as'reciever',@serial_number as'email_serialNumb',@isubject as'subject',@body as'body'
from  Staff_Members s, Staff_Members rec
where s.username = @username and (rec.username = @recipient) and (s.company = rec.company)
insert into Emails (serial_number,isubject,date,body) values(@serial_number,@isubject,getdate(),@body)
insert into Staff_send_Email_Staff(email_number,recipient,sender) values(@serial_number,@recipient,@username)
 end
 else
 set @no = 1;
 


 --8 View emails sent to me by other staff members of my company.
 Go
 --drop proc See_Recieved_emails
 create proc See_Recieved_emails
 @username varchar(50)
 as
 select e.serial_number,u.sender,e.date, e.isubject,e.body
 from Emails e, Staff_send_Email_Staff u
 where u.recipient = @username and e.serial_number = u.email_number



 --9 Reply to an email sent to me, while the reply would be saved in the database as a new email record.
 Go
 --drop proc Reply_email
 create proc Reply_email
 @username varchar(50),
 @recieved_from varchar(50),
 @reply varchar(500),
 @subject varchar(50),
 @serial_of_email_to_reply_to int,
 @serial_number int,
 @sent int output
 as
 if not exists (
 select*
 from Staff_send_Email_Staff temp, Emails e
 where temp.recipient = @username and temp.sender = @recieved_from and e.serial_number = temp.email_number and @serial_of_email_to_reply_to = e.serial_number)
 print'invalid inputs, please check them again'
 else
 begin
 select  @serial_number as'new email num',@serial_of_email_to_reply_to as'old email replied on',temp.sender as'sender',temp.recipient as 'recipient',getdate() as 'date',@subject as'subject',@reply as'body of the reply'
 from Staff_send_Email_Staff temp, Emails e
 where temp.recipient = @username and temp.sender = @recieved_from and e.serial_number = temp.email_number and @serial_of_email_to_reply_to = e.serial_number
 insert into Emails (serial_number,isubject,date,body) values( @serial_number,@subject,getdate(),@reply)
 insert into Staff_send_Email_Staff(email_number,recipient,sender) values( @serial_number,@recieved_from,@username) 
 set @sent =1;
 end





--10 View announcements related to my company within the past 20 days.
GO
--drop proc View_Announcements
create proc View_Announcements
@username varchar(50)
as
select a.hr_employee,a.announcement_date,a.title, a.announcement_description
from Announcements a, Staff_Members me, Staff_Members s
where (a.announcement_date between DATEADD(DAY, -20, GETDATE()) and getdate() )and me.username = @username and s.username = a.hr_employee and s.company = me.company






									--------------“As a registered user, I should be able to ...”--------------

-- 1 Login to the website using my username and password which checks that i am an existing user, and 
--whether i am job seeker, HR employee, Regular employee or manager.
GO
--drop proc User_Login
create proc User_Login
@username varchar(50),
@password varchar(50),
@type varchar(50) output
as
if not exists (select*
				from Users u
				where @username = u.username and u.pssword = @password ) -- if im not a user ot password lenght is less than 8
print 'wrong username or invalid password'

else if exists(select*
		from Staff_Members u,Regular_Employees r
		where u.username = r.username and u.username = @username )
set @type = 'Regular Employee'

else if exists(select*
		from Users u,Managers m
		where u.username = m.username and m.username = @username )
set @type = 'Maganer'

else if exists(select*
		from Users u,Hr_Employees h
		where u.username = h.username and h.username = @username )
set @type = 'HR Employee'

else if exists(select*
		from Users u,Job_Seekers j
		where u.username = j.username and j.username = @username )
set @type = 'Job seeker'


--2 View all of my possible information.
GO
create proc view_all_user_info
@username varchar(50)
as
select *
from Users u
where u.username = @username


--3 Edit all of my personal information.
Go
create proc update_all_my_info
@username varchar(50),
@newPassword varchar(50),
@new_personal_email varchar(1000),
@new_birth_date datetime,
@new_years_of_experience int,
@new_first_name varchar(200),
@new_middle_name varchar(200),
@new_last_name varchar(200)
as
update Users 
set pssword = @newPassword, personal_email=@new_personal_email , birth_date = @new_birth_date, years_of_experience = @new_years_of_experience, first_name = @new_first_name,  middle_name= @new_middle_name, last_name=@new_last_name
where username = @username













go


--1 View a list of projects assigned to me along with all of their information.
CREATE PROC Veiw_Projects
@username VARCHAR(200),
@company VARCHAR(500)
AS
IF(exists(select*
FROM Regular_Employees r
WHERE r.username=@username)
)
BEGIN
SELECT p.*
FROM (Projects P INNER JOIN Manager_assign_Regular_Employee_Project A ON (P.project_name=A.project_name AND p.company=A.company))INNER JOIN Regular_Employees r ON (r.username=a.regular_employee)
WHERE A.regular_employee=@username 
END

GO

go
--DROP PROC Veiw_Projects
GO


--2
--2 View a list of tasks in a certain project assigned to me along with all of their information and status.
GO
	--drop proc Veiw_task
	CREATE PROC Veiw_task
@username VARCHAR(200),
@project_name VARCHAR(200)

AS
IF EXISTS(
    SELECT *
	FROM Regular_Employees s
    WHERE s.username=@username 
)
BEGIN
SELECT *
FROM Tasks t
WHERE t.project_name=@project_name AND regular_employee=@username
END

GO


go
CREATE PROCEDURE view_request
	@type int output,
	@applicant varchar(100),
	@start_date date
AS
if exists(select * from Leave_Requests where applicant=@applicant and leave_request_start_date=@start_date)
begin
set @type=1
select * from Requests r inner join Leave_Requests l on r.applicant=l.applicant and r.request_start_date=l.leave_request_start_date
where r.applicant=@applicant and r.request_start_date=@start_date
end
else
if exists(select * from Business_Trip_Requests where applicant=@applicant and business_trip_request_sart_date=@start_date)
begin
set @type=2
select * from Requests r inner join Business_Trip_Requests l on r.applicant=l.applicant and r.request_start_date=l.business_trip_request_sart_date
where r.applicant=@applicant and r.request_start_date=@start_date
end
else
begin 
set @type=0
end
go
create proc manager_see_job
@username varchar(200),
@jobseeker varchar(200),
@title varchar(200),
@department varchar(200),
@company varchar(500)
as 
if not exists( select * from Managers where username=@username)
print ('Invalid access')
else 
begin
if not exists( select * from Staff_Members where username=@username and department=@department and company=@company)
print ('Invalid access')
else 
begin
if exists(select * from Jobs where title=@title and department=@department and company=@company)
begin
select j.*,u.*,a.score
from Jobs j, Users u,Job_Seeker_apply_Job a
where j.title=a.job and j.title=@title and j.department=a.department and j.department=@department and j.company=a.company and
j.company=@company and u.username=a.job_seeker and a.hr_response='Approved' and u.username=@jobseeker
end
else 
print ('There is not accepted applications for this specific job title')
end
end
go
create proc view_staff
@username varchar(50)
as
select *
from Staff_Members u
where u.username = @username
go


 --1
 GO
 create proc HR_Add_Job
@HR_username VARCHAR(200),
@dep_role VARCHAR(200),
@title varchar(200),
@department varchar(200),
@company varchar(500),
@short_discription varchar(200),
@detailed_discription varchar(1000),
@min_experience varchar(200),
@salary decimal(7,2),
@deadline date ,
@no_of_vacancies int ,
@working_hours int,
@Qnumber INT,
@question VARCHAR(200),
@answer BIT,
@count INT OUTPUT
AS
DECLARE @new_title VARCHAR(200)
SET @new_title=@dep_role+' _ '+@title
IF exists(select * from Hr_Employees h WHERE h.username=@HR_username)
BEGIN
IF exists(select * from Staff_Members s where s.department=@department and s.username=@HR_username and  s.company=@company)
BEGIN
IF not EXISTS(select * FROM Jobs j WHERE j.department=@department AND j.company=@company AND j.title=@new_title)
BEGIN
select @count = count(*) from Staff_Members s where s.department=@department and s.username=@HR_username and  s.company=@company
INSERT into Jobs values(
@new_title,
@department,
@company ,
@short_discription,
@detailed_discription ,
@min_experience ,
@salary ,
@deadline,
@no_of_vacancies,
@working_hours )
INSERT into Questions values(@Qnumber,@question,@answer)
INSERT into Job_has_Question values(@new_title,@department,@company,@Qnumber)
END
Set @count=2
END
END
GO
drop PROC HR_Add_Job
EXEC HR_Add_Job 'HR1','Sales','Manager','IT12','email@semiens.com','amazing','dreamer',2,3000,'12/11/1014',2,2,9,'what is your name?',1,0
 --2
go
--drop proc GET_Job
go
CREATE PROC GET_Job
@username VARCHAR(200),
@department varchar(200),
@company VARCHAR(500)
AS
IF exists(
SELECT*
from Hr_Employees s
WHERE s.username=@username
)
and exists(select * from Staff_Members where username=@username and department=@department and company=@company)
BEGIN
SELECT *
FROM Jobs s
WHERE s.department=@department  AND s.company=@company
END
go
--DROP PROC GET_Job
EXEC GET_Job 'HR1','IT12','email@semiens.com'
--3
go
CREATE PROC Edit_HR_Job
@username VARCHAR(200),
@oldtitle  varchar(200),
@newtitle varchar(200),
@newdep_role VARCHAR(200),
@company varchar(500),
@short_discription varchar(200),
@detailed_discription varchar(1000),
@min_experience varchar(200),
@salary decimal(7,2),
@deadline DATETIME ,
@no_of_vacancies int ,
@working_hours int,
@department varchar(200),
@count int OUTPUT
AS
IF exists(
SELECT*
from Hr_Employees s
WHERE s.username=@username)
BEGIN
If exists(select * from Staff_Members where username=@username and  department=@department
and company=@company)
if exists(
    SELECT* 
    FROM Jobs
    WHERE title=@oldtitle and department=@department and company=@company
)
BEGIN
IF(@short_discription<>'')
BEGIN
SET @count=1
UPDATE Jobs 
SET short_discription=@short_discription
WHERE title=@oldtitle and department=@department and company=@company
END
IF(@short_discription<>'')
BEGIN
SET @count=1
UPDATE Jobs 
SET short_discription=@short_discription
WHERE title=@oldtitle and department=@department and company=@company
END
IF(@detailed_discription <>'')
BEGIN
SET @count=1
UPDATE Jobs 
SET detailed_discription=@detailed_discription
WHERE title=@oldtitle and department=@department and company=@company
END
IF(@min_experience <>'')
BEGIN
SET @count=1
UPDATE Jobs 
SET min_experience=@min_experience
WHERE title=@oldtitle and department=@department and company=@company
END
IF(@salary is not null)
BEGIN
SET @count=1
UPDATE Jobs 
SET salary=@salary
WHERE title=@oldtitle and department=@department and company=@company
END
IF(@deadline is not null)
BEGIN
SET @count=1
UPDATE Jobs 
SET deadline=@deadline
WHERE title=@oldtitle and department=@department and company=@company
END
IF(@no_of_vacancies is not null)
BEGIN
SET @count=1
UPDATE Jobs 
SET no_of_vacancies=@no_of_vacancies
WHERE title=@oldtitle and department=@department and company=@company
END
IF(@working_hours is not null)
BEGIN
SET @count=1
UPDATE Jobs 
SET working_hours=@working_hours
WHERE title=@oldtitle and department=@department and company=@company
END
IF(@oldtitle<>'' AND @newtitle <>'')
BEGIN
SET @count=1
UPDATE Jobs 
SET title=@newdep_role+'-'+@newtitle
WHERE title=@oldtitle and department=@department and company=@company
END
END
END
Go

EXEC Edit_HR_Job 'HR1','Yarab_Yasates','here','here','email@semiens.com','hena1','',3,2345.00,'1997.12.12',3,4,'IT12',0

--4
GO
--drop proc Veiw_Applications
go
CREATE PROC Veiw_Applications
@username varchar(200),
@department varchar(200),
@company varchar(500)
as 
if exists( select * from HR_Employees where username=@username) and exists( select * from Staff_Members where username=@username 
and department=@department and company=@company) and exists(select * from Jobs where   department=@department and company=@company)
select j.*,u.*,a.score
from Jobs j, Users u,Job_Seeker_apply_Job a
where j.title=a.job  and j.department=a.department and j.department=@department and j.company=a.company and
j.company=@company and u.username=a.job_seeker 
GO
--EXEC Veiw_Applications 'HR1','IT12','email@semiens.com'

--5(accept)
GO
CREATE PROC accept_applications
@hr_employee VARCHAR(200),
@job Varchar(200),
@department Varchar(200),
@company Varchar(500),
@job_Seeker Varchar(500),
@count int OUTPUT
AS
IF exists(SELECT * FROM HR_Employees h WHERE h.username=@hr_employee)
BEGIN
IF exists(SELECT * FROM Staff_Members s WHERE s.username=@hr_employee AND s.department=@department)
BEGIN
UPDATE Job_Seeker_apply_Job 
SET hr_response='Accepted'
WHERE job=@job AND department=@department AND company=@company AND job_seeker=@job_Seeker
SET @count=1
END
END
GO
DROP PROC accept_applications
EXEC accept_applications 'HR2','aaa_okay','IT12','email@semiens.com','Basma Afifi',0
----5(reject)
GO
CREATE PROC reject_applications
@hr_employee VARCHAR(200),
@job Varchar(200),
@department Varchar(200),
@company Varchar(500),
@job_Seeker Varchar(500),
@count int OUTPUT
AS
IF exists(SELECT * FROM HR_Employees h WHERE h.username=@hr_employee)
BEGIN
IF exists(SELECT * FROM Staff_Members s WHERE s.username=@hr_employee AND s.department=@department)
BEGIN
UPDATE Job_Seeker_apply_Job 
SET hr_response='Rejected'
WHERE job=@job AND department=@department AND company=@company  AND job_seeker=@job_Seeker
SET @count=0
END
END
GO
drop PROC reject_applications
EXEC reject_applications 'HR2','Administrative Assistant_emmm','IT12','email@semiens.com','Basma Afifi',0

--6
GO
CREATE proc post_announcements
@announcement_date DATE ,
@title VARCHAR(200),
@hr_employee VARCHAR(200),
@announcement_type VARCHAR(200),
@announcement_description VARCHAR(200),
@count INT OUTPUT
AS
IF exists(select * from HR_Employees h WHERE h.username=@hr_employee)
BEGIN
IF NOT EXISTS(SELECT * from Announcements A WHERE A.announcement_date=@announcement_date AND A.hr_employee=@hr_employee AND A.title=@title)
BEGIN
INSERT into Announcements VALUES(@announcement_date,
@title,
@hr_employee,
@announcement_type ,
@announcement_description)
select  @count = count(*) from HR_Employees h WHERE h.username=@hr_employee
END
END
GO
DROP PROC post_announcements
exec  post_announcements '11/12/2018','ann4','HR3','new vacacy','Anouncement details',0

--7(leave Requests)
GO
CREATE PROC view_leave_requests
@username VARCHAR(200),
@department varchar(200),
@company varchar(500)
AS
IF not exists(SELECT* from Hr_Employees  WHERE username=@username)
    BEGIN
    print ('Invalid Access')
    END
else 
    begin
    SELECT r2.*,r.leave_request_type
    FROM Leave_Requests r
    inner join Staff_Members s on r.applicant=s.username inner JOIN Requests r2 ON r.applicant=r2.applicant
    WHERE r2.manager_response='Accepted' and s.department=@department and s.company=@company 
    end
    GO
DROP PROC view_leave_requests
exec view_leave_requests 'HR1','IT12','email@semiens.com'

---7(Business Requests)
GO
CREATE PROC Business_leave_requests
@username VARCHAR(200),
@department varchar(200),
@company varchar(500)
AS
IF not exists(SELECT* from Hr_Employees  WHERE username=@username)
    BEGIN
    print ('Invalid Access')
    END
else 
    begin
    SELECT r2.*,r.destination,r.purpose
    FROM Business_Trip_Requests r
    inner join Staff_Members s on r.applicant=s.username inner JOIN Requests r2 ON r.applicant=r2.applicant
    WHERE r2.manager_response='Accepted' and s.department=@department and s.company=@company 
    end
    GO
DROP PROC Business_leave_requests
exec business_leave_requests 'HR1','IT12','email@semiens.com'
--8
--reject
go
create proc Hr_Reject_request
@hr varchar(200),
@department varchar(200),
@company varchar(500),
@request_start_date DATE ,
@applicant VARCHAR(200),
@count INT OUTPUT
as
if exists(select * from HR_Employees where username=@hr) and exists(select * from Staff_Members where username=@hr and  department=@department
and company=@company) and exists(select * from Staff_Members where username=@applicant and  department=@department
and company=@company) 
SET @count=1
update Requests
set hr_response='Rejected'
where applicant=@applicant and request_start_date=@request_start_date
go
DROP PROC Hr_Reject_request
exec Hr_Reject_request 'HR3','Media12','email@semiens.com','1/5/2017','HR4',0

--Accept
go
create proc Hr_Accept_request
@hr varchar(200),
@department varchar(200),
@company varchar(500),
@request_start_date DATE ,
@applicant VARCHAR(200),
@count INT OUTPUT
as
if exists(select * from HR_Employees where username=@hr) and exists(select * from Staff_Members where username=@hr and  department=@department
and company=@company) and exists(select * from Staff_Members where username=@applicant and  department=@department
and company=@company) and exists(select * from Requests r inner join Staff_Members s on r.applicant=s.username
where request_start_date=@request_start_date and applicant=@applicant and  DATEDIFF(DAY, r.request_end_date, r.request_end_date)<s.annual_leaves)
declare @start_date date
declare @days int
declare @day_off varchar(200)
set @days=0
SET @count=1

select @start_date=request_start_date
from Requests
where request_start_date=@request_start_date and applicant=@applicant

select @day_off=day_off
from Staff_Members
where username=@applicant

while( exists( select *from Staff_Members s inner join Requests r on r.applicant=s.username
where username=@applicant and @start_date<=r.request_end_date) )
begin
if not ( datename(WEEKDAY,@start_date) = @day_off or datename(WEEKDAY,@start_date)  ='Friday') 
set @days=@days +1
SELECT @start_date= dateadd(day,1,@start_date); 
end

update Requests
set hr_response='Accepted'
where applicant=@applicant and request_start_date=@request_start_date

declare @daysof int
select @daysof=annual_leaves
from Staff_Members
where username=@applicant
set @daysof=@daysof-@days

update Staff_Members
set annual_leaves=@daysof
where username=@applicant
go
DROP PROC Hr_Accept_request

exec Hr_Accept_request 'HR3','Media12','email@semiens.com','1/5/2017','HR4',0

--9
GO
create proc veiw_hr_attedance
@HR VARCHAR (200),
@company VARCHAR(200),
@department VARCHAR(200),
@staff VARCHAR(200)
AS
IF exists(select * from Hr_Employees h WHERE h.username=@HR ) AND exists(select * FROM Staff_Members s where s.username=@staff AND s.company=@company AND s.department=@department ) and exists(select * FROM Staff_Members s where s.username=@HR AND s.company=@company AND s.department=@department )
BEGIN

SELECT s.username,s.company ,s.department,a.start_time,s.salary ,a.end_time ,j.working_hours INTO temp 
FROM Staff_Members s INNER JOIN Jobs j on (s.job=j.title  and s.company=j.company AND s.department=j.department and s.salary=j.salary ) inner JOIN Attendances a on s.username=a.staff
WHERE a.staff=@staff

DECLARE @duration FLOAT
SELECT @duration=abs((DATEDIFF(MINUTE, temp.end_time,temp.start_time ))/60)
FROM temp
WHERE username=@staff

DECLARE @missing_hours FLOAT
SELECT @missing_hours=abs(@duration-temp.working_hours)
FROM temp
WHERE username=@staff


IF @missing_hours<0
BEGIN
SET @missing_hours=0
END

DECLARE @start_time DATETIME
SELECT @start_time=temp.start_time
FROM temp
WHERE username=@staff

DECLARE @end_time DATETIME
SELECT @end_time=temp.end_time
FROM temp
WHERE username=@staff

CREATE TABLE view_of_attendace(
    start_time datetime,
    end_time datetime,
    duration FLOAT,
    missing_hours FLOAT
)

INSERT into view_of_attendace VALUES(@start_time,@end_time,@duration,@missing_hours)

select * FROM view_of_attendace
END
GO

exec veiw_hr_attedance 'HR13','IT34','email@facebook.com','HR13','1999-5-1','2018-2-1'

drop PROC veiw_hr_attedance
--10
go
create proc HR_View_WorkingHours
@hr varchar(200),
@department varchar(200),
@company varchar(500),
@username Varchar(50),
@year INT
as
if exists(select * from HR_Employees where username=@hr) and exists(select * from Staff_Members where username=@hr and  department=@department
and company=@company) and exists(select * from Staff_Members where username=@username and  department=@department
and company=@company)

 select a.staff,sum(abs(DATEDIFF(hh, a.end_time,a.start_time ))) as s
 from Attendances a 
 where a.staff=@username AND year(a.idate)=@year
 group by a.staff
 GO 
 DROP PROC HR_View_WorkingHours

 exec HR_View_WorkingHours 'HR1','IT12','email@semiens.com','HR13',2016

--11
GO
create proc View_Top_Achievers
@hr varchar(200),
@department varchar(200),
@company varchar(500),
@month int,
@year int
as
if exists (select * from HR_Employees where username=@hr) and exists(select * from Staff_Members where username=@hr
and department=@department and company=@company)
begin
select top 3 a.staff, sum(abs(DATEDIFF(hh, a.end_time,a.start_time))) as s
from Attendances a inner join Tasks t on t.regular_employee=a.staff 
where month( a.idate)=@month and year(a.idate)=@year and t.task_status='Fixed'
group by a.staff 
order by s desc 
end
go
DROP PROC View_Top_Achievers

exec View_Top_Achievers'HR1','IT12','email@semiens.com',2 ,2016

--drop proc send_mails
GO
create proc send_mails
@username varchar(50),
@recipient Varchar(50),
@isubject varchar(50),
@body varchar(500),
@serial_number INT,
@count INT OUTPUT

as
select s.username as'sender',rec.username as'reciever',@serial_number as'email_serialNumb',@isubject as'subject',@body as'body'
from  Staff_Members s, Staff_Members rec
where s.username = @username and (rec.username = @recipient) and (s.company = rec.company)
SET @count=1
insert into Emails (serial_number,isubject,date,body) values(@serial_number,@isubject,getdate(),@body)
insert into Staff_send_Email_Staff(email_number,recipient,sender) values(@serial_number,@recipient,@username)
 GO

  CREATE proc view_accepted
 (@username varchar(200),@out int output)
 as
 if not exists (select * from Job_Seeker_apply_Job where @username=job_seeker)
 --You have'nt applied for any job yet
 set @out=0
 else
 if not exists(select * from Job_Seeker_apply_Job where @username=job_seeker and manager_response='Approved') 
 --Your applications are still pending
 set @out=1
 else
 if exists(select * from Job_Seeker_apply_Job where @username=job_seeker and manager_response='Approved')
 begin
 select job,department,company,manager_response as 'Status',score
 from Job_Seeker_apply_Job j
 where j.job_seeker=@username
 --Congratulations you were accepted in the following position/s 
 set @out=2
 end

 GO





GO

