CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;
CREATE TABLE class(
    class_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    startDate DATETIME    NOT NULL,
    status    BIT
);
CREATE TABLE student(
    student_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    student_address     VARCHAR(50),
    student_phone       VARCHAR(20),
    status      BIT,
    class_id     INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE subject(
    sub_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    status  BIT                  DEFAULT 1
);
CREATE TABLE mark(
    mark_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT NOT NULL,
    student_id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES subject(sub_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);