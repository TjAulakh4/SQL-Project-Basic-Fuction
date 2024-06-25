CREATE TABLE Empl (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Mobile VARCHAR(15),
    Email VARCHAR(100),
    Gender VARCHAR(10),
    Salary DECIMAL(10, 2)
);
INSERT INTO Empl (EmployeeID, Name, Mobile, Email, Gender, Salary) VALUES
(1, 'Alice Johnson', '123-456-7890', 'alice@example.com', 'Female', 75000.00),
(2, 'Bob Smith', '234-567-8901', 'bob@example.com', 'Male', 55000.00),
(3, 'Charlie Brown', '345-678-9012', 'charlie@example.com', 'Male', 82000.00),
(4, 'Diana Prince', '456-789-0123', 'diana@example.com', 'Female', 90000.00),
(5, 'Evan Davis', '567-890-1234', 'evan@example.com', 'Male', 67000.00),
(6, 'Fiona Gallagher', '678-901-2345', 'fiona@example.com', 'Female', 60000.00),
(7, 'George Malley', '789-012-3456', 'george@example.com', 'Male', 58000.00),
(8, 'Hannah Montana', '890-123-4567', 'hannah@example.com', 'Female', 94000.00),
(9, 'Ian Somerhalder', '901-234-5678', 'ian@example.com', 'Male', 71000.00),
(10, 'Jane Doe', '012-345-6789', 'jane@example.com', 'Female', 85000.00);

desc empl
select * from empl

>>>>>>>>>>>Sum of Salary
select sum(salary) as Total_salary from Empl

>>>>>>>>>>>Sum of salary according to the gender
select  gender,sum(salary) as Total_salary_gender from Empl group by gender

>>>>>>>>>>>Average Salary of employee
select round(avg(salary),2) as avg_salary from empl 

>>>>>>>>>>>Running Avg Salary
Select employeeid,name,salary,avg(salary) over (order by salary rows between unbounded preceding and current row) as RunningAvgSalary from Empl order by salary;

>>>>>>>>>>>MAx and min salary of emp.
select max(salary) as Maxsalary,min(salary) as MinSalary from Empl

>>>>>>>>>>>Count of employee
select count(*) As Empcount from empl

>>>>>>>>>>>Count of emp. by gender
 select gender,count(*) as Emp_count_by_gender from empl group by gender
 
>>>>>>>>>>>Cumulative salary 
select employeeid,name,salary,sum(salary) over(order by salary) As CumulativeSalary from empl order by salary

>>>>>>>>>>>Ranking of salary
select employeeid,name,salary,Rank() over(order by salary desc) as salary_rank from empl order by salary_Rank


>>>>>>>>>>>Row Number
select employeeid,name,salary,Row_Number() over(order by salary desc) as RowNumber from empl

>>>>>>>>>>>First_value
select employeeid,name,salary,First_value(salary) over(order by salary desc) as FV from empl

>>>>>>>>>>>NTH_Value
select employeeid,name,salary,Nth_value(salary,3) over(order by salary desc) as nthValue from empl

>>>>>>>>>>>Last_Value
select employeeid,name,salary,Last_value(salary) over(order by salary desc rows between unbounded preceding and unbounded following) as LV from empl

>>>>>>>>>>>Percent_Rank
select employeeid,name,salary,percent_rank() over(order by salary desc) as PercentRank from empl

>>>>>>>>>>>Lead Salary
select employeeid,name,salary,lead(salary ) over( order by salary ) as nxt_salary from empl;

>>>>>>>>>>>Lag Salary
select employeeid,name,salary,lag(salary ) over( order by salary) as last_salary from empl order by salary;

>>>>>>>>>>>>Wildcards(% and _)
select employeeid,name,salary from empl where name like '%m%' 
select employeeid,name,salary from empl where name like 'b%' 
select employeeid,name,salary from empl where name like '_o%' 

>>>>>>>>>>>>SplitValue
Select name ,substring_index(name,' ',1) as first_name ,substring_index(name,' ',-1) as  Lastname  from empl

>>>>>>Other Basic Functions
select Concat('TAjinder','Singh') as concatenate

SElect TRim('    Tajinder Singh     ') as trim 

Select lTrim('    Tajinder Singh     ') as Ltrim

select curdate(),curtime(),now()

select year(curdate()), Month(curdate()), Day(curdate())

select datediff("2024/05/31","1997/01/05") as age_in_days

select name,substring_index(name," ",1) as first_name,substring_index(name," ",-1) as LAst_name from empl


>>>>>Student Result Table with null value

CREATE TABLE student_results (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(50),
    score INT,
    grade CHAR(1)
);
INSERT INTO student_results (name, subject, score, grade) VALUES
('John Doe', 'Math', 85, 'B'),
('Jane Smith', 'Science', NULL, NULL),
('Mike Johnson', 'English', 92, 'A'),
('Emily Davis', 'Math', NULL, 'C'),
('Michael Brown', 'Science', 78, NULL),
('Sarah Miller', 'History', 90, 'A'),
('Chris Wilson', 'Math', 82, 'B'),
('Patricia Taylor', 'English', NULL, NULL),
('Robert Anderson', 'Science', 88, 'B'),
('Linda Thomas', 'Math', 95, 'A'),
('James Jackson', 'History', 67, 'D'),
('Barbara White', 'English', 76, 'C'),
('Steven Harris', 'Science', NULL, 'B'),
('Maria Martin', 'Math', NULL, NULL),
('David Thompson', 'History', 59, 'F'),
('Susan Garcia', 'English', 85, NULL),
('Daniel Martinez', 'Science', 91, 'A'),
('Lisa Robinson', 'Math', 84, 'B'),
('Mark Clark', 'History', NULL, 'C'),
('Nancy Rodriguez', 'English', 72, NULL);

 select*from student_results

>>>>>>>>>>>update null value 
update Student_results set score=0 and where Score is null
update student_results set grade='F' where grade is null

>>>>>>>>>>>Update score in btween a range 

update student_results set score =floor(70 +(rand()*11)) where grade ='c'
select*from student_results where grade='c'







