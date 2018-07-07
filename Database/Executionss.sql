/*As a registered or unregistered user I should be able to:*/
/*1 Search for any company by its name or address or its type (national/international).*/
exec Search_for_Company 'semiens',null,null --done

/*2 View a list of all available companies on the system along with all information of the company.*/
exec View_All_Companies_Info --done

/*3 View the information of a certain company along with the departments in that company.*/
exec View_Companys_Departments 'semiens'--done

/*4 View the information of a certain department in a certain company along with the jobs that have vacancies in it.*/
exec View_Department_Vacancies 'Financial Affairs Department','email@facebook.com'--done

/*5 Register to the website to be able to apply for any job later on. Any user has to register in the website with a unique username and a password, along with all the needed information.*/
exec Register 'Basma Afifi' ,'Password123','basmama97@gmail.com','3/12/1997',0,'Basma','Mohamed','Afifi'--done

/*6 Search for jobs that have vacancies on the system and their short description or title contain a string of keywords entered by the user. All information of the job should be displayed along with the company name and the department it belongs to.*/
exec Search_for_Vacancy 'manger'--done

/*7 View companies in the order of having the highest average salaries.*/
exec CompaniesAvgSal --done


																	/* As a Job Seeker I should be able to :*/

/*1 Apply for any job as long as I have the needed years of experience for the job. Make sure that a job seeker can’t apply for a job, if he/she applied for it before and the application is still pending.*/
exec job_seeker_apply 'Basma Afifi' ,0,'Administrative Assistant','IT12','email@semiens.com'--done
exec job_seeker_apply 'Basma Afifi' ,0,'Administrative Assistant','IT23','email@apple.com' --done
exec job_seeker_apply 'Basma Afifi',0,'Administrative Assistant','IT34','email@facebook.com' --done 

/*2 View the interview questions related to the job I am applying for.*/
exec viewinterview 'Basma Afifi' ,'Administrative Assistant','IT23','email@apple.com'--done

/*3 Save the score I got while applying for a certain job.*/
exec  savescore    'Basma Afifi','Are you ok?',1,1,'Administrative Assistant','IT23','email@apple.com' --done

/*4 View the status of all jobs I applied for before (whether it is finally accepted, rejected or still in the review process), along with the score of the interview questions.*/
exec viewstatus  'Basma Afifi' ,'Administrative Assistant','IT23','email@apple.com' --done

/*5 Choose a job from the jobs I was accepted in, which would make me a staff member in the company and the department that offered this job. Accordingly, my salary and company email are set, and I get 30 annual leaves. In addition, I should also choose one day-off other than Friday. The number of vacancies for the assigned job has to be updated too.*/
exec ChooseJob 'Basma Mohamed','Administrative Assistant','IT34','email@facebook.com','Friday'--done
exec ChooseJob 'Basma Afifi','Administrative Assistant','IT12','email@semiens.com','Monday'--done

/*6 Delete any job application I applied for as long as it is still in the review process.*/
exec DeleteApp 'Basma Afifi','Administrative Assistant','IT34','email@facebook.com'--done





																--“As a regular employee, I should be able to ...”

/*3 After finalizing a task, I can change the status of this task to ‘Fixed’ as long as it did not pass the
deadline.*/
exec Finalizing_Task 'task1','project1','email@apple.com','R5'--done

/*4 Work on the task again (a task that was assigned to me before). I can change the status of this
task from ‘Fixed’ to ‘Assigned’ as long as the deadline did not pass and it was not reviewed by the
manager yet.*/
exec Update_Task 'task1','project1','email@apple.com','R5'--done
--“As a manager, I should be able to ...”
/*1 View new requests from staff members working in my department. Note that only managers with
type = ‘HR’ are allowed to review requests applied for by HR employees, and this manager’s review
is considered the final decision taken for this request, i.e. it does not pass by an HR employee
afterwards.*/
exec Manager_View_Requests 'MG3','Media12','email@semiens.com'--done

/*2 Accept or reject requests from staff members working in my department before being reviewed by
the HR employee. In case of disapproval, I should provide a reason to be saved.*/
exec Manger_Accept_Request 'MG3','2017-1-2','HR4','Media12','email@semiens.com'--done

exec Manager_Reject_Request 'MG3','2017-1-5','MG4','Media12','email@semiens.com','no time'--done

/*3 View applications for a specific job in my department that were approved by an HR employee. For
each application, I should be able to check information about the job seeker, job, and the score
he/she got while applying.*/
exec Manager_Veiw_Job 'MG7','Administrative Assistant','IT23','email@apple.com'--done

/*4 Accept or reject job applications to jobs related to my department after being approved by an HR
employee.*/
exec Manager_approve_Job 'MG7','Administrative Assistant','IT23','email@apple.com','Basma Afifi'--done

exec Manager_reject_job 'MG7','Administrative Assistant','IT23','email@apple.com','Basma Afifi'--done

--5 Create a new project in my department with all of its information
exec Create_New_Project 'project10','email@semiens.com','IT12','2017-11-21','2017-12-20','MG1'--done

/*6 Assign regular employees to work on any project in my department. Regular employees should be
working in the same department. Make sure that the regular employee is not working on more than
two projects at the same time.*/
exec Manager__assign_regular_employee_project 'project10','email@semiens.com','IT12','R1','MG1'--done

/*7 Remove regular employees assigned to a project as long as they don’t have tasks assigned to him/her
in this project.*/
exec Manager__Remove_Regular_employee_from_Project 'project10','email@semiens.com','IT12','R1','MG1'--done

/*8 Define a task in a project in my department which will have status ‘Open’.*/
exec Manager_create_task 'task1','project10','email@semiens.com','IT12','2017-11-27','task','MG1'--done

/*9 Assign one regular employee (from those already assigned to the project) to work on an already
defined task by me in this project.*/
declare @res int 
exec Manger_Assign_Regular_Employee_Task 'task','pro','email@semiens.com','R1','MG1','IT12',@res output--done
print @res
/*10 Change the regular employee working on a task on the condition that its state is ‘Assigned’, i.e. by
assigning it to another regular employee.*/
exec Manager_Change_Regular_Employee_Task 'task1','project10','email@semiens.com','R9','MG1','IT12'--done

/*11 View a list of tasks in a certain project that have a certain status.*/
exec Manager_Veiw_Tasks 'project10','email@semiens.com','MG1','Assigned','IT12'--done

/*12 Review a task that I created in a certain project which has a state ‘Fixed’, and either accept or
reject it. If I accept it, then its state would be ‘Closed’, otherwise it will be re-assigned to the same
regular employee with state ‘Assigned’. The task should have now a new deadline.*/
exec Review_Accept_Task 'task1','project10','email@semiens.com','MG1','IT12'--done

exec Review_Reject_Task 'task1','project10','email@semiens.com','2017-12-10','MG1','IT12'--done



GO
exec Staff_Member_Check_in HR14																		-- correctly executed  (staff ques1)
exec Staff_Member_Check_in HR1																		-- correctly executed  (staff ques1)
exec Staff_Member_Check_out HR13																	-- correctly executed  (staff ques2)
					
Go
declare @duration float,@missing_hours float												
exec View_my_attendance HR13,'1999-5-1','2018-2-1',@duration,@missing_hours							-- correctly executed  (staff ques3) 

go
declare @s datetime
set @s  = '12-11-2017'
declare @b datetime
set @b = '15-11-2017'
exec Apply_For_Leave_Request HR17,@s,@b,'jjj'

go
declare @s datetime																					-- correctly executed  (staff ques4)
set @s  = '12-11-2017'
declare @b datetime
set @b = '15-11-2017'
exec Apply_For_Business_Trip_Requests HR13,@s,@b,'venice','business'


exec View_status_of_requests HR4																	-- correctly executed  (staff ques5)
exec Delete_request	HR4																				-- correctly executed  (staff ques6)
exec send_mails HR16,HR18,afdga,fgwtrhw46sxfc,700770												-- correctly executed  (staff ques7)
exec See_Recieved_emails HR18																		-- correctly executed  (staff ques8)

exec Reply_email HR18,HR16,oiueiuiude,jnieduide,700770,7988789										-- correctly executed (staff ques9)

exec View_Announcements HR1																			-- correctly executed  (staff ques10)
																
Go
declare @type varchar(50)																			-- correctly executed  (user ques1)
exec User_Login HR8,pass,@type output
print @type

exec view_all_user_info HR13																		-- correctly executed  (user ques2)

Go																									
declare @a datetime																					
set @a = '1997-9-27'                                    
exec update_all_my_info MG18,ggg,nb@balabizo, @a,6,arnabna,f_manwar,anwar							-- correctly executed   (user ques3)



EXEC Edit_HR_Job 'HR1','Administrative Assistant','email@semiens.com','hena','',3,2345.00,'1997.12.12',3,4,'IT12'

EXEC Veiw_Applications 'HR10','Executive Officer','Media23','email@apple.com'

exec view_requests 'HR6','Finance12','email@semiens.com'

exec HR_Appliction_Accept 'HR12','2017-2-1','MG11','Finance23','email@apple.com'




 
  /*8 Accept or reject requests of staff members working with me in the same department that were
approved by a manager. My response decides the final status of the request, therefore the annual
leaves of the applying staff member should be updated in case the request was accepted. Take into
consideration that if the duration of the request includes the staff member’s weekly day-off and/or
Friday, they should not be counted as annual leaves..*/
exec Hr_Accept_request 'HR3','Media12','email@semiens.com','2/2/2017','HR4'

exec Hr_Reject_request 'HR3','Media12','email@semiens.com','2/2/2017','HR4'


/*11 View names of the top 3 high achievers in my department. A high achiever is a regular employee
who stayed the longest hours in the company for a certain month and all tasks assigned to him/her
with deadline within this month are fixed.*/
 exec View_Top_Achievers'HR1','IT12','email@semiens.com',2 ,2016

 
 exec View_Top_Achievers'HR1','IT12','email@semiens.com',2 ,2016


EXEC GET_Job 'HR1','Administrative Assistant','IT12','email@semiens.com'



exec HR_View_attendance 'HR13','IT34','email@facebook.com','HR13','1999-5-1','2018-2-1',@duration,@missing_hours 


 exec HR_View_WorkingHours 'HR13','IT34','email@facebook.com','HR13'


EXEC Edit_HR_Job 'HR1','Administrative Assistant','email@semiens.com','hena','',3,2345.00,'1997.12.12',3,4,'IT12'


EXEC Edit_HR_Job 'HR1','Administrative Assistant','email@semiens.com','hena','',3,2345.00,'1997.12.12',3,4,'IT12'

EXEC Veiw_Applications 'HR10','Executive Officer','Media23','email@apple.com'


EXEC Veiw_Projects 'R5','email@apple.com'


exec Veiw_task 'R5','Project3'