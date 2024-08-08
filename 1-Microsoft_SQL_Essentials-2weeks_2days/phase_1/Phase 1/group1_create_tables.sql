USE CompanyDB;
GO
/* Staff(schema)
   Departments(table)
   Employees(table)
*/
CREATE TABLE Staff.Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(80) NOT NULL,
    Location VARCHAR(80),
);

CREATE TABLE Staff.Employees
(
    EmployeeID   INT PRIMARY KEY,
    FirstName    VARCHAR(20) NOT NULL,
    LastName     VARCHAR(20) NOT NULL,
    DepartmentID INT,
    HireDate     DATE NOT NULL,
    Position     VARCHAR(80),
    Salary       NUMERIC(12, 3),
    CONSTRAINT employees_chk CHECK (Salary > 0),
    CONSTRAINT employees_chd CHECK (HireDate <= CAST(SYSDATETIME() AS DATE))
);

INSERT INTO Staff.Departments
VALUES (1, 'Accounting & Finance', 'Cairo'),
       (2, 'Human Resources ', 'Cairo'),
       (3, 'Research & Development', 'Alexandria'),
       (4, 'Production', 'Giza'),
       (5, 'IT', 'Alexandria');

INSERT INTO Staff.Employees
VALUES (1, 'Shahd', 'Ammar', 5, '2020-6-15', 'Software Engineer', 50000),
       (2, 'Ahmed', 'Ismail', 4, '2021-2-27', 'Production Manager', 65000),
       (3, 'Marwan', 'Atef', 2, '2021-4-13', 'HR Director', 73000),
       (4, 'Omar', 'Salah', 3, '2022-9-8', 'R&D Engineer', 80000),
       (5, 'Shahd', 'Mohamed', 1, '2023-3-18', 'Accountant', 60000),
       (6, 'Mostafa', 'Ammar', 2, '2023-4-8', 'Recruiter', 90000);