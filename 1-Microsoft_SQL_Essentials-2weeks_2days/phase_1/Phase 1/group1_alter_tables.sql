USE CompanyDB
/* Staff(schema)
   Departments(table)
   Employees(table)
*/
ALTER TABLE Staff.Employees
ADD CONSTRAINT employees_fk  FOREIGN KEY (DepartmentID)
    REFERENCES Staff.Departments (DepartmentID);
    
UPDATE Staff.Employees
    SET DepartmentID = 1 WHERE EmployeeID = 1;
UPDATE Staff.Employees
    SET DepartmentID = 2 WHERE EmployeeID = 2;