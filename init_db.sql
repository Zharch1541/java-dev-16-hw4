
CREATE TABLE worker (
    ID IDENTITY PRIMARY KEY,
    NAME VARCHAR NOT NULL,
    CONSTRAINT name_length_check 
    CHECK (LENGTH(NAME) BETWEEN 2 AND 1000),
    BIRTHDAY DATE,
    CONSTRAINT birthday_year_check
    CHECK (YEAR(BIRTHDAY) > 1900),
    LEVEL VARCHAR NOT NULL,
    CONSTRAINT level_enum_values
    CHECK (LEVEL IN ('Trainee', 'Junior', 'Middle', 'Senior')),
    SALARY BIGINT,
    CONSTRAINT salary_range_check 
    CHECK (SALARY BETWEEN 100 AND 100000)
);


CREATE TABLE client (
    ID IDENTITY PRIMARY KEY,
    NAME VARCHAR NOT NULL,
    CONSTRAINT client_name_length_check
    CHECK (LENGTH(NAME) BETWEEN 2 AND 1000)
);

CREATE TABLE project (
    ID IDENTITY PRIMARY KEY,
    CLIENT_ID BIGINT NOT NULL,
    CONSTRAINT client_id_fk
    FOREIGN KEY (CLIENT_ID) REFERENCES client(ID),
    START_DATE DATE,
    FINISH_DATE DATE
);

CREATE TABLE project_worker (
    PROJECT_ID BIGINT NOT NULL,
    WORKER_ID BIGINT NOT NULL,
    PRIMARY KEY (PROJECT_ID, WORKER_ID),
    FOREIGN KEY (PROJECT_ID) REFERENCES project(ID),
    FOREIGN KEY (WORKER_ID) REFERENCES worker(ID)
);




project_worker - таблиця, що показує, які працівники над якими проєктами працюють. Поля таблиці:
PROJECT_ID - ідентифікатор проєкту. Зовнішній ключ для таблиці project(id)
WORKER_ID - ідентифікатор клієнту. Зовнішній ключ для таблиці worker(id)
первинний ключ для цієї таблиці - складений, пара (PROJECT_ID, WORKER_ID)

project - таблиця для проєктів. Мають бути наступні поля:
ID - ідентифікатор проєкту, ціле число, сурогатний первинний ключ.
CLIENT_ID - ідентифікатор клієнта, що замовив цей проєкт
START_DATE - дата початку виконання проєкту
FINISH_DATE - дата кінця виконання проєкту


ALTER TABLE worker
ALTER COLUMN NAME VARCHAR NOT NULL;

ALTER TABLE worker
ADD CONSTRAINT name_length_check CHECK (LENGTH(NAME) BETWEEN 2 AND 1000); ???

ALTER TABLE worker
ADD CONSTRAINT birthday_year_check
CHECK (YEAR(BIRTHDAY) > 1900); ???

ALTER TABLE worker
ALTER COLUMN LEVEL VARCHAR NOT NULL;

ALTER TABLE worker
ADD CONSTRAINT level_enum_values
CHECK (LEVEL IN ('Trainee', 'Junior', 'Middle', 'Senior'));   ???

ALTER TABLE worker
ADD CONSTRAINT salary_range_check 
CHECK (SALARY BETWEEN 100 AND 100000);






worker - таблиця для працівників. У таблиці мають бути наступні поля:
ID - ідентифікатор працівника, ціле число, сурогатний первинний ключ. !
NAME - ім'я працівника, рядок. Обмеження - не має бути NULL, довжина має бути від 2 до 1000 символів включно.!
BIRTHDAY - дата народження. Рік у цій даті має бути більшим за 1900 !
LEVEL - рівень технічного розвитку працівника. Має бути обмеження - це поле не може бути NULL, значення поля може бути одним з - Trainee, Junior, Middle, Senior !
SALARY - заробітна плата працівника за 1 місяць. Обмеження - ціле число, не менше 100 і не більше 100 000!



client - таблиця для клієнтів. Мають бути наступні поля:
ID - ідентифікатор клієнта, ціле число, сурогатний первинний ключ.
NAME - ім'я працівника, рядок. Обмеження - не має бути NULL, довжина має бути від 2 до 1000 символів включно.
