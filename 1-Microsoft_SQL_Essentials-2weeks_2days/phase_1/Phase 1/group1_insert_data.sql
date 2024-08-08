USE CompanyDB;
GO

INSERT INTO Staff.Departments
       (DepartmentID, DepartmentName, [Location])
VALUES (1, 'Accounting & Finance', 'Cairo'),
       (2, 'Human Resources ', 'Cairo'),
       (3, 'Research & Development', 'Alexandria'),
       (4, 'Production', 'Giza'),
       (5, 'IT', 'Alexandria');


INSERT INTO Staff.Employees
       (EmployeeID, FirstName, LastName, DepartmentID, HireDate, Position, Salary)
VALUES (1, 'Shahd', 'Ammar', 5, '2020-6-15', 'Software Engineer', 50000),
       (2, 'Ahmed', 'Ismail', 4, '2021-2-27', 'Production Manager', 65000),
       (3, 'Marwan', 'Atef', 2, '2021-4-13', 'HR Director', 73000),
       (4, 'Omar', 'Salah', 3, '2022-9-8', 'R&D Engineer', 80000),
       (5, 'Shahd', 'Mohamed', 1, '2023-3-18', 'Accountant', 60000),
       (6, 'Mostafa', 'Ammar', 2, '2023-4-8', 'Recruiter', 90000);


INSERT INTO  Staff.Projects
       (ProjectID, ProjectName, StartDate, EndDate, Budget)
VALUES (1, 'Website Redesign', '2023-01-01', '2023-06-30', 50000.00),
       (2, 'Mobile App Development', '2023-02-15', '2023-12-31', 120000.00),
       (3, 'Cloud Migration', '2023-03-01', '2023-11-01', 80000.00),
       (4, 'SEO Optimization', '2023-04-10', '2023-09-15', 20000.00),
       (5, 'New Product Launch', '2023-05-05', '2023-11-20', 150000.00); 


INSERT INTO  Staff.Assignments
       (AssignmentID, EmployeeID, ProjectID, Role, AssignmentDate)
VALUES (1, 1, 201, 'Developer', '2023-01-15'),
       (2, 2, 202, 'Manager', '2022-11-23'),
       (3, 3, 201, 'Analyst', '2023-03-11'),
       (4, 4, 203, 'HR Coordinator', '2021-09-30'),
       (5, 5, 204, 'Marketing Specialist', '2022-04-19'); 


INSERT INTO  Sales.Customers
       (CustomerID, CustomerName, ContactNumber, Email, Address)
VALUES (1, 'Alice Johnson', '555-1234', 'alice.johnson@example.com', '123 Maple Street, Springfield, IL'),
       (2, 'Bob Smith', '555-5678', 'bob.smith@example.com', '456 Oak Avenue, Springfield, IL'),
       (3, 'Charlie Brown', '555-8765', 'charlie.brown@example.com', '789 Pine Road, Springfield, IL'),
       (4, 'Diana Prince', '555-4321', 'diana.prince@example.com', '101 Elm Boulevard, Springfield, IL'),
       (5, 'Ethan Hunt', '555-6789', 'ethan.hunt@example.com', '202 Cedar Lane, Springfield, IL'); 


INSERT INTO  Sales.Orders
       (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (1, 1001, '2023-01-10', 250.75),
       (2, 1002, '2023-01-15', 450.00),
       (3, 1003, '2023-01-20', 300.50),
       (4, 1001, '2023-01-25', 500.25),
       (5, 1004, '2023-01-30', 125.00);


INSERT INTO  Sales.Products
       (ProductID, ProductName, Category, Price, StockQuantity)
VALUES  (1, 'Laptop', 'Electronics', 999.99, 50),
        (2, 'Smartphone', 'Electronics', 699.99, 150),
        (3, 'Desk Chair', 'Furniture', 89.99, 75),
        (4, 'Electric Kettle', 'Appliances', 29.99, 100),
        (5, 'Notebook', 'Stationery', 3.99, 200); 


INSERT INTO  Sales.OrderDetails
       (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)
VALUES (1, 1001, 2001, 2, 19.99),
       (2, 1002, 2002, 1, 29.99),
       (3, 1003, 2003, 3, 9.99),
       (4, 1004, 2004, 5, 14.99),
       (5, 1005, 2005, 4, 24.99);



