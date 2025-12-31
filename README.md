# Hostel Room Management System

A lightweight, role-based web app to automate hostel workflows — student applications, complaints, fee submission, leave requests and room allotment. Built with plain **HTML/CSS/JavaScript** for the frontend and **PHP + MySQL** for the backend. UI assets were designed with Canva for clarity and responsiveness.

---

## Key features

* Student dashboard: apply for hostel, submit complaints, pay fees, request leave, view room & leave status.
* Warden dashboard: view complaints, review hostel applications, allot rooms, view/manage leave requests.
* Role-based access and session handling (student / warden).
* Simple transactional room allotment and status tracking.
* Delivered as a self-contained PHP/MySQL project for local testing or college deployment.

---

## Tech stack

* Frontend: HTML, CSS, JavaScript
* Backend: PHP (server-side scripts in `backend/`)
* Database: MySQL (`hostel_db.sql`)
* Design: Canva (UI images / mockups)

---

## Repository contents (important files)

```
/ (root)
├─ home.html
├─ hostel.html
├─ vacant.html
├─ student_register.html
├─ student_dashboard.html
├─ fee.html
├─ test.php
├─ hostel_db.sql
├─ README.md
├─ config.php            # (recommended — DB credentials / common settings)
├─ assets/               # css, images, js (if present)
└─ backend/
   ├─ warden_login.php
   ├─ get_students.php
   ├─ update_room.php
   ├─ submit_fee.php
   ├─ submit_leave.php
   ├─ submit_complaint.php
   ├─ apply_hostel.php
   └─ other backend scripts...
```

> Note: If `config.php` is not present, create it to store DB connection details (example shown below).

---

## Quick setup (run locally)

1. Install a local PHP+MySQL stack (XAMPP, WAMP, MAMP, or LAMP).
2. Copy the repo folder to your web server folder:

   * XAMPP: `C:\xampp\htdocs\<repo-folder>\`
   * Linux: `/var/www/html/<repo-folder>/`
3. Start Apache and MySQL.
4. Create the database and import `hostel_db.sql`:

   * Using phpMyAdmin: import `hostel_db.sql`.
   * Or via terminal:

   ```
   mysql -u root -p
   CREATE DATABASE hostel_db;
   USE hostel_db;
   SOURCE /path/to/hostel_db.sql;
   ```
5. Configure DB credentials in `config.php` (create if missing). Example:

   ```php
   <?php
   // config.php
   $DB_HOST = 'localhost';
   $DB_USER = 'root';
   $DB_PASS = '';        // put your MySQL password here
   $DB_NAME = 'hostel_db';

   $conn = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);
   if ($conn->connect_error) {
       die("Connection failed: " . $conn->connect_error);
   }
   ?>
   ```
6. Open the app in your browser:

   ```
   http://localhost/<repo-folder>/home.html
   ```

---

## How to use (example flows)

* Student registers via `student_register.html`. The form posts to `backend/apply_hostel.php` or `backend/register_student.php`.
* Student logs in and uses `student_dashboard.html` to: apply for hostel, raise complaints (`submit_complaint.php`), submit fee payments (`submit_fee.php`), request leave (`submit_leave.php`).
* Warden logs in via `backend/warden_login.php` and uses the warden dashboard pages to: view complaints and applications (`get_students.php`, `get_complaints.php`), allot rooms (`update_room.php`), and update leave/room status.

> The backend PHP scripts are designed to receive standard form POST fields (e.g., `student_id`, `complaint_text`, `amount`, `room_id`) and respond by redirecting or returning JSON depending on the script. You can open `backend/*.php` for exact parameter names.

---

## Notes & tips

* This repo is intended as a college/demo project. Before production use:

  * Add prepared statements / parameterized queries to avoid SQL injection.
  * Add input validation and file upload security checks.
  * Hash passwords (use `password_hash()` / `password_verify()`).
  * Configure HTTPS for deployment.
* To test quickly, create a few sample student and warden accounts in `hostel_db.sql` or via phpMyAdmin.

---

## Troubleshooting

* `Can't connect to database` — check `config.php` credentials and MySQL status.
* Blank pages or PHP code visible — make sure Apache/PHP is running and files are in the web server folder.
* Forms not working — check the form `action` attribute and backend script names for typos.

---

## Suggested improvements (future)

* Switch to MVC structure or a lightweight framework for better maintainability.
* Use AJAX for smoother dashboards and real-time updates.
* Add logging, role-based permissions and an admin panel.
* Integrate email notifications for leave/fee/complaint status changes.

