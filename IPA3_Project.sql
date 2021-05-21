create database ipafinal;
use ipafinal
go
-- if you are not selecting ipa  in master command then we can write "use ipa". 

--- Create Vendor Table
 CREATE TABLE vendor
  (
  vendor_id    CHAR(5)     NOT NULL,
  vendor_name    VARCHAR(25)     NOT NULL,
  CONSTRAINT pk_vendor PRIMARY KEY (vendor_id)
  );
--- Insert values into vendors
   INSERT INTO vendor VALUES('V001','WestReg Tooling supply');
   INSERT INTO vendor VALUES('V002','Helly Tooling supply');
   INSERT INTO vendor VALUES('V003','Ria Tools');

---- Create Tools table 
	CREATE TABLE tool
  (
  tool_id    CHAR(5)     NOT NULL,
  tool_name    VARCHAR(255)     NOT NULL,
  vendor_id  CHAR(5)     NOT NULL,
  CONSTRAINT pk_tool PRIMARY KEY (tool_id),
  CONSTRAINT fk_tool_vendor FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
  );
  ----- Insert Values into Tools Table
   INSERT INTO tool VALUES('TK001','Shackle','V001');
   INSERT INTO tool VALUES('TK002','Rod','V002');
   INSERT INTO tool VALUES('TK003','Compass','V002');
   INSERT INTO tool VALUES('TK004','Twister','V001');
   INSERT INTO tool VALUES('TK005','Screwdriver','V003');
   INSERT INTO tool VALUES('TK006','Mop','V001');

----------- Create Skills table
CREATE TABLE skills
  (
  skill_id    CHAR(5)     NOT NULL,
  skill_name    VARCHAR(255)     NOT NULL,
  CONSTRAINT pk_skill PRIMARY KEY (skill_id)
  );
  ------- Insert Values into skills
  INSERT INTO skills VALUES('SK001','Electrician');
  INSERT INTO skills VALUES('SK002','Plumbing');
  INSERT INTO skills VALUES('SK003','Drawing');
  INSERT INTO skills VALUES('SK004','Assembling');
  INSERT INTO skills VALUES('SK005','Carpenting');
  INSERT INTO skills VALUES('SK006','Interior Designer');
  INSERT INTO skills VALUES('SK007','Flooring Expert');
  INSERT INTO skills VALUES('SK008','Lock Smith');

----- Create Department Table
CREATE TABLE department
   (
   department_id    CHAR(5)     NOT NULL,
   department_name    VARCHAR(255)     NOT NULL,
   department_manager   VARCHAR(255)     NOT NULL,
   CONSTRAINT pk_department PRIMARY KEY (department_id)
  );
  
  --------Insert values into department
  INSERT INTO department VALUES('D001','BasicHome','Chris');
  INSERT INTO department VALUES('D002','AdvanceHome','Stella');
  INSERT INTO department VALUES('D003','FineHome','Bonnie');
  INSERT INTO department VALUES('D004','Interiors','Micheal');
  
  ------- Create Technician Table
  CREATE TABLE technician
  (
  technician_id   CHAR(5)     NOT NULL,
  department_id    CHAR(5)     NOT NULL,
  tool_id    CHAR(5)     NOT NULL,
  skill_id    CHAR(5)     NOT NULL,
  technician_fname VARCHAR(255) ,
  technician_lname VARCHAR(255) ,
  technician_email		VARCHAR(255)			,
  technician_phone    VARCHAR(10)         ,
  technician_address  VARCHAR(255)         ,
  technician_city     VARCHAR(255)         ,
  technician_state    VARCHAR(255)             ,
  technician_zip      VARCHAR(5)             ,
  technician_designation varchar(255),
  CONSTRAINT pk_technician PRIMARY KEY (technician_id),
  CONSTRAINT fk_technician_department FOREIGN KEY (department_id) REFERENCES department(department_id),
  CONSTRAINT fk_technician_tool FOREIGN KEY (tool_id) REFERENCES tool(tool_id),
  CONSTRAINT fk_technician_skills FOREIGN KEY (skill_id) REFERENCES skills(skill_id),
  );
  
  -----------Insert value into department
  INSERT INTO technician VALUES('T001','D001','TK001','SK001','Harry','Potter','hp@gmail.com','6789875432','7431 frankford road','Dallas','Texas','75256','Electrician');
  INSERT INTO technician VALUES('T002','D001','TK002','SK002','Emerald','Jade','ejade@gmail.com','6234567891','5678 Frisco street','Dallas','Texas','75213','Plumber');
  INSERT INTO technician VALUES('T003','D002','TK003','SK003','Emily','Kane','em@gmail.com','6724536789','6534 estates on back','Plano','Texas','76342','Architect');
  INSERT INTO technician VALUES('T004','D003','TK004','SK004','Lara','Skaut','lsk@gmail.com','7534256789','5342 Mandrian Street','DFW','Texas','76345','Decorator');
  INSERT INTO technician VALUES('T005','D002','TK005','SK005','Dia','Amen','da@gmail.com','5234567890','4213 Estaes on Pearl','Houston','Texas','73498','Floor Planner');
  INSERT INTO technician VALUES('T006','D003','TK004','SK005','Diam','Mehta','dm@gmail.com','5234567111','7575 Estates','California','CA','76788','Floor maintanence');
  INSERT INTO technician VALUES('T007','D002','TK004','SK004','Dhia','Verma',NULL,'5234567222','7576 Estates','California','CA','76788','Floor maintanence');
  INSERT INTO technician VALUES('T008','D002','TK004','SK004','TIA','Verma',NULL,'5234588222','pearl 71 Estates','California','CA','76788','Designer');
  INSERT INTO technician VALUES('T009','D001','TK004','SK004','Sahira','Verma',NULL,'5234567222','7576 Estates','California','CA','76788','Floor maintanence');
  INSERT INTO technician VALUES('T010','D003','TK004','SK004','Karan','Gill',NULL,'5234588222','pearl 71 Estates','California','CA','76788','Designer');

 -------- Create Customer Table

 CREATE TABLE customer
 (
  customer_id    CHAR(5)     NOT NULL,
  customer_fname VARCHAR(255) NOT NULL,
  customer_lname VARCHAR(255) ,
  email		VARCHAR(255)			,
  phone    VARCHAR(12)         ,
  address  VARCHAR(255)         ,
  city     VARCHAR(255)         ,
  state    CHAR(255)             ,
  zip      CHAR(5)             ,
  CONSTRAINT pk_customer PRIMARY KEY (customer_id),
 );
  
 -------Insert Values into customer
   INSERT INTO customer VALUES('C001','Jenny','Buchman','jb@gmail.com','718-496-7223','75 West 205 St','Bronx','NY','10468');
   INSERT INTO customer VALUES('C002','Wendy','Heydemark','wh@gmail.com','303-986-7020','2922 Baseline Rd','Boulder','CO','80303');
   INSERT INTO customer VALUES('C003','Hallie','Hull','hhull@gmail.com','415-549-4278','3800 Waldo Ave, #14F','San Francisco','CA','94123');
INSERT INTO customer VALUES('C004','Klee','Hull','kh@gmail.com','415-549-4278','3800 Waldo Ave, #14F','San Francisco','CA','94123');
INSERT INTO customer VALUES('C005','Christian','Kells','ck@gmail.com','212-771-4680','114 Horatio St','New York','NY','10014');
INSERT INTO customer VALUES('C006','jane','Kellsey','jk@gmail.com','650-836-7128','390 Serra Mall','Palo Alto','CA','94305');
INSERT INTO customer VALUES('C007','Paddy','O''Furniture','pf@gmail.com','941-925-0752','1442 Main St','Sarasota','FL','34236');
INSERT INTO customer VALUES('C008','Padmini','Helly',NULL,'941-925-0788','1991 Estate St','Sarans','CA','67823');
INSERT INTO customer VALUES('C009','Damini','Malhotra','dm@gmail.com','678-092-0987','7575 Frankford Road','Dallas','TX','75252');
INSERT INTO customer VALUES('C010','Priya','Desai','pd@gmail.com','941-925-1234','1235 nainital street','denvar','DN','34239');


---- Create Order Log table
CREATE TABLE orderlog
  (
  order_id   CHAR(5)     NOT NULL,
  customer_id    CHAR(5)     NOT NULL,
  technician_id    CHAR(5)     NOT NULL,
  CONSTRAINT pk_orderlog PRIMARY KEY (order_id),
  CONSTRAINT fk_orderlog_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT fk_orderlog_technician FOREIGN KEY (technician_id) REFERENCES technician(technician_id)
  );
  --------insert values into orderlog
  INSERT INTO orderlog VALUES('OR001','C001','T001');
  INSERT INTO orderlog VALUES('OR002','C002','T002');
  INSERT INTO orderlog VALUES('OR003','C001','T003');
  INSERT INTO orderlog VALUES('OR004','C002','T003');
  INSERT INTO orderlog VALUES('OR005','C002','T003');
  INSERT INTO orderlog VALUES('OR006','C003','T004');
   INSERT INTO orderlog VALUES('OR007','C004','T005');
    INSERT INTO orderlog VALUES('OR007','C005','T001');

 -------------- Create Worklog table
  CREATE TABLE worklog
  (
  worklog_id    CHAR(5)     NOT NULL,
  order_id    CHAR(5)     NOT NULL,
  technician_id    CHAR(5)     ,
  worklog_category    VARCHAR(255)     ,
  worklog_duration   DECIMAL(10,2)   ,
  woklog_status   VARCHAR(255)     NOT NULL,
  worklogpay_perhour DECIMAL(10,2),
  worklogpay_total DECIMAL(10,2),
  CONSTRAINT pk_worklog PRIMARY KEY (worklog_id),
  CONSTRAINT fk_worklog_technician FOREIGN KEY (technician_id) REFERENCES technician(technician_id)
  );
  
  -----Insert values into worklog table
  INSERT INTO worklog VALUES('WL001','OR001','T001','Housing','10.00','active','5.00','50.00');
  INSERT INTO worklog VALUES('WL002','OR002','T002','Housing','15.00','active','5.00','75.00');
  INSERT INTO worklog VALUES('WL003','OR003','T001','Housing','12.00','done','5.00','60.00');
  INSERT INTO worklog VALUES('WL004','OR004','T003','Society','12.00','done','6.00','72.00');
  INSERT INTO worklog VALUES('WL005','OR004','T004','Society','12.00','done','6.00','72.00');
  INSERT INTO worklog VALUES('WL006','OR004','T005','Society','10.00','done','1.00','10.00');
  INSERT INTO worklog VALUES('WL007','OR005','T001','Housing','12.00','done','5.00','60.00');
  INSERT INTO worklog VALUES('WL008','OR006','T002','Housing','12.00','done','6.00','72.00');
  
  
  ----Create Bill table
  CREATE TABLE bill
  (
  bill_id    CHAR(5)     NOT NULL,
  customer_id    CHAR(5)     NOT NULL,
  payment_amount DECIMAL(10,2),
  payment_method VARCHAR(255),
  payment_status VARCHAR(255),
  CONSTRAINT pk_bill PRIMARY KEY (bill_id),
  CONSTRAINT fk_bill_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
  );
  --- Insert values into bill table
  INSERT INTO bill VALUES('B001','C002','120.00','Cash','Complete');
  INSERT INTO bill VALUES('B002','C002','12.00','Cash','Complete');
  INSERT INTO bill VALUES('B003','C001','10.00',NULL,'Pending');
  INSERT INTO bill VALUES('B004','C003','20.00',NULL,'Pending');
  INSERT INTO bill VALUES('B005','C004','5.00',NULL,'Pending');
  
  -- Selecting Customer table
  select * from customer;

  --- Selcting values from Technician table
  select * from technician;

  --- Selcting values from orderlog table
  select * from orderlog;

   --- Selcting values from bills table
  select * from bill;

  ---- Selecting values from skills table
  select * from skills;

   ---- Selecting values from tools table
  select * from tool;

  ---- Selecting values from vendor table
  select * from vendor;

   ---- Selecting values from department table
  select * from department;

  --Selecting values from worklog
   select * from worklog;


  -- INNER JOIN--TECHNICIAN AND WORKLOG
 select e1.technician_id, e1.technician_fname, e2.worklog_duration, e2.order_id
from technician e1
inner join worklog e2
on e1.technician_id=e2.technician_id;

	----- FULL OUTER JOIN ---  bill and customer
	select e1.customer_id, e1.customer_fname, e2.bill_id, e2.payment_amount, e2.payment_status
	from customer e1
	FULL OUTER JOIN bill e2
	on e1.customer_id=e2.customer_id;


----- LEFT JOIN --- customers and technicians
select e1.customer_id, e1.customer_fname, e2.technician_id, e2.order_id
from customer e1
LEFT OUTER JOIN orderlog e2
on e1.customer_id=e2.customer_id;

-- RIGHT JOIN--- technician and skills
	select e1.technician_id, e1.technician_fname, e2.skill_id, e2.skill_name
	from technician e1
	RIGHT OUTER JOIN skills e2
	on e1.skill_id=e2.skill_id;

--- Intersect ---technician and worklog
select technician_id from technician
intersect
select technician_id from worklog;


---- Union-- technician and customer
Select email
from customer
UNION 
select technician_email
from technician;


--- Except --- Technician and Orderlog

select technician_id from technician 
EXCEPT 
select technician_id from orderlog;


 