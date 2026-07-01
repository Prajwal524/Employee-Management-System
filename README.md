# 🏢 Employee Management System

A **Java Web Application** for managing employee records using **Servlets, JSP, JDBC, and MySQL** with the **DAO pattern**, deployed on **Apache Tomcat 10.1**.

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Language | Java (JDK 1.8) |
| Web | Jakarta Servlets + JSP |
| Database | MySQL + JDBC |
| Server | Apache Tomcat 10.1 |
| Styling | Tailwind CSS, Font Awesome |
| IDE | Eclipse IDE |

---

## ✅ Features

- Add, View, Update, Delete employee records
- Department management
- Search employees by name or department
- Dashboard with summary stats

---

## 🗄️ Database Setup

```sql
CREATE DATABASE employee_db;
USE employee_db;

CREATE TABLE department (
    dept_id   INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE employee (
    emp_id     INT AUTO_INCREMENT PRIMARY KEY,
    emp_name   VARCHAR(100) NOT NULL,
    emp_email  VARCHAR(100) UNIQUE NOT NULL,
    emp_phone  BIGINT NOT NULL,
    emp_salary DOUBLE NOT NULL,
    dept_id    INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO department (dept_name) VALUES
('Engineering'), ('Human Resources'), ('Finance'), ('Marketing');
```

Update DB credentials in `src/main/java/com/emp/connection/Connector.java`:

```java
String url      = "jdbc:mysql://localhost:3306/employee_db";
String username = "root";
String password = "your_password";
```

---

## ▶️ How to Run

**Prerequisites:** JDK 1.8+, Apache Tomcat 10.1, MySQL 8.x, Eclipse IDE

1. Clone the repo
```bash
git clone https://github.com/Prajwal524/Employee-Management-System.git
```
2. `File` → `Import` → `Existing Projects into Workspace` → Browse to folder → **Finish**
3. Run the SQL scripts and update credentials in `Connector.java`
4. Right-click project → `Run As` → `Run on Server` → select Tomcat 10.1
5. Open `http://localhost:8080/Employee-Management-System/`

---

## 👨‍💻 Author

[![GitHub](https://img.shields.io/badge/GitHub-Prajwal524-black?logo=github)](https://github.com/Prajwal524)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Prajwal_Y-blue?logo=linkedin)](https://www.linkedin.com/in/prajwal-y)
