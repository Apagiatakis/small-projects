CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    age INT,
    job_title VARCHAR(100),
    department VARCHAR(100),
    years_experience INT,
    salary DECIMAL(10,2),
    phone VARCHAR(20),
    hire_date DATE,
    performance_rating DECIMAL(2,1),
    remote_status VARCHAR(20)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    employee_id INT,
    project_name VARCHAR(100),
    project_budget INT,
    project_status VARCHAR(50),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
CREATE TABLE performance_reviews (
    review_id INT PRIMARY KEY,
    employee_id INT,
    review_date DATE,
    performance_score INT,
    bonus INT,
    review_comments VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


INSERT INTO employees VALUES
(1,'Liam','Anderson','liam.anderson@company.com',29,'Data Analyst','Analytics',4,72000,'555-1023','2021-03-15',4.5,'Hybrid'),
(2,'Olivia','Martinez','olivia.martinez@company.com',34,'HR Manager','Human Resources',10,85000,'555-1045','2018-07-10',4.7,'Onsite'),
(3,'Noah','Thompson','noah.thompson@company.com',41,'Senior Developer','IT',15,110000,'555-1098','2015-01-20',4.8,'Remote'),
(4,'Emma','Garcia','emma.garcia@company.com',26,'Marketing Specialist','Marketing',3,60000,'555-1102','2022-06-01',4.2,'Hybrid'),
(5,'James','Rodriguez','james.rodriguez@company.com',38,'Finance Manager','Finance',12,98000,'555-1156','2017-09-18',4.6,'Onsite'),
(6,'Ava','Lee','ava.lee@company.com',30,'UX Designer','Design',6,75000,'555-1190','2020-11-25',4.4,'Remote'),
(7,'William','Harris','william.harris@company.com',45,'Operations Director','Operations',20,125000,'555-1201','2012-04-12',4.9,'Onsite'),
(8,'Sophia','Clark','sophia.clark@company.com',28,'Content Strategist','Marketing',5,65000,'555-1222','2021-02-14',4.3,'Hybrid'),
(9,'Benjamin','Lewis','benjamin.lewis@company.com',32,'Backend Developer','IT',8,90000,'555-1254','2019-05-09',4.6,'Remote'),
(10,'Isabella','Walker','isabella.walker@company.com',27,'Recruiter','Human Resources',4,58000,'555-1288','2022-01-11',4.1,'Onsite'),
(11,'Lucas','Hall','lucas.hall@company.com',36,'Data Engineer','Analytics',11,102000,'555-1300','2016-03-27',4.7,'Remote'),
(12,'Mia','Allen','mia.allen@company.com',31,'Accountant','Finance',7,73000,'555-1311','2020-08-17',4.4,'Hybrid'),
(13,'Henry','Young','henry.young@company.com',39,'IT Support Lead','IT',14,88000,'555-1345','2014-10-03',4.5,'Onsite'),
(14,'Charlotte','King','charlotte.king@company.com',24,'Junior Developer','IT',2,55000,'555-1389','2023-04-20',4.0,'Remote'),
(15,'Alexander','Wright','alexander.wright@company.com',42,'Business Analyst','Operations',16,97000,'555-1402','2013-12-12',4.6,'Hybrid'),
(16,'Amelia','Lopez','amelia.lopez@company.com',29,'Social Media Manager','Marketing',5,62000,'555-1423','2021-07-19',4.3,'Remote'),
(17,'Daniel','Hill','daniel.hill@company.com',37,'Product Manager','Product',13,105000,'555-1456','2016-09-22',4.8,'Hybrid'),
(18,'Harper','Scott','harper.scott@company.com',33,'QA Engineer','IT',9,83000,'555-1478','2018-05-30',4.5,'Onsite'),
(19,'Matthew','Green','matthew.green@company.com',46,'Chief Financial Officer','Finance',22,150000,'555-1501','2010-02-14',4.9,'Onsite'),
(20,'Evelyn','Baker','evelyn.baker@company.com',35,'Training Coordinator','Human Resources',9,70000,'555-1522','2017-06-05',4.4,'Hybrid'),
(21,'Sebastian','Adams','sebastian.adams@company.com',28,'Frontend Developer','IT',6,78000,'555-1550','2020-03-18',4.3,'Remote'),
(22,'Abigail','Nelson','abigail.nelson@company.com',40,'Supply Chain Manager','Operations',15,99000,'555-1577','2015-08-09',4.7,'Onsite'),
(23,'David','Carter','david.carter@company.com',31,'Database Administrator','IT',8,92000,'555-1600','2019-01-21',4.6,'Hybrid'),
(24,'Ella','Mitchell','ella.mitchell@company.com',27,'Graphic Designer','Design',4,58000,'555-1623','2022-10-10',4.2,'Remote'),
(25,'Joseph','Perez','joseph.perez@company.com',43,'Operations Manager','Operations',18,112000,'555-1655','2012-07-07',4.8,'Onsite'),
(26,'Scarlett','Roberts','scarlett.roberts@company.com',26,'Data Scientist','Analytics',3,88000,'555-1678','2023-01-16',4.5,'Remote'),
(27,'Samuel','Turner','samuel.turner@company.com',38,'Legal Advisor','Legal',12,101000,'555-1702','2016-04-04',4.6,'Hybrid'),
(28,'Victoria','Phillips','victoria.phillips@company.com',30,'Customer Success Manager','Support',7,72000,'555-1724','2020-09-12',4.4,'Hybrid'),
(29,'Owen','Campbell','owen.campbell@company.com',35,'Cybersecurity Specialist','IT',10,108000,'555-1756','2017-03-03',4.7,'Remote'),
(30,'Grace','Parker','grace.parker@company.com',32,'Office Administrator','Administration',8,64000,'555-1789','2019-11-11',4.3,'Onsite');


INSERT INTO projects VALUES
(1,3,'AI Customer Insights',120000,'Active','2023-01-10','2024-01-10'),
(2,9,'E-Commerce Platform Upgrade',95000,'Active','2023-03-01','2023-12-01'),
(3,11,'Data Warehouse Migration',150000,'Completed','2022-02-15','2023-02-15'),
(4,17,'Mobile App Launch',80000,'Active','2023-04-20','2023-11-20'),
(5,6,'Website UX Redesign',45000,'Completed','2022-05-10','2022-12-10'),
(6,4,'Marketing Automation',60000,'Active','2023-06-01','2024-03-01'),
(7,23,'Database Optimization',70000,'Completed','2022-08-15','2023-03-15'),
(8,21,'Frontend Performance Upgrade',50000,'Active','2023-07-10','2023-12-10'),
(9,15,'Operations Workflow System',90000,'Active','2023-02-05','2023-10-05'),
(10,26,'Predictive Sales Analytics',130000,'Active','2023-01-25','2024-01-25'),
(11,12,'Financial Reporting System',75000,'Completed','2022-09-01','2023-04-01'),
(12,18,'Automated Testing Framework',55000,'Active','2023-05-15','2023-11-15'),
(13,1,'Customer Data Dashboard',48000,'Completed','2022-11-10','2023-05-10'),
(14,22,'Supply Chain Tracking Tool',110000,'Active','2023-03-22','2024-02-22'),
(15,29,'Cybersecurity Monitoring',140000,'Active','2023-02-01','2024-02-01');

INSERT INTO performance_reviews VALUES
(1,3,'2023-12-01',5,10000,'Outstanding leadership'),
(2,9,'2023-12-01',4,6000,'Strong technical contribution'),
(3,11,'2023-12-01',5,12000,'Excellent data engineering work'),
(4,4,'2023-12-01',3,2000,'Solid marketing support'),
(5,6,'2023-12-01',4,5000,'Creative design work'),
(6,17,'2023-12-01',5,15000,'Exceptional product leadership'),
(7,18,'2023-12-01',4,5000,'Reliable QA performance'),
(8,12,'2023-12-01',3,2000,'Consistent accounting work'),
(9,21,'2023-12-01',4,4500,'Great frontend improvements'),
(10,26,'2023-12-01',5,13000,'Outstanding data science results');

