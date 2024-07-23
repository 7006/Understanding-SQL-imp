BEGIN;

CREATE TABLE IF NOT EXISTS Customers (
  cnum smallint NOT NULL,
  cname varchar(50) NOT NULL,
  city varchar(50)  NOT NULL,
  rating smallint DEFAULT NULL,
  snum smallint NOT NULL
);

COMMENT ON COLUMN Customers.cnum IS 'Уникальный номер назначенный каждому заказчику';
COMMENT ON COLUMN Customers.cname IS 'Имя заказчика';
COMMENT ON COLUMN Customers.city IS 'Расположение заказчика (город)';
COMMENT ON COLUMN Customers.rating IS 'Код, указывающий уровень предпочтения данного заказчика перед другими. Более высокий номер указывают на большее предпочтение (рейтинг).';
COMMENT ON COLUMN Customers.snum IS 'Номер продавца, назначенного этому заказчику (из таблицы Продавцов)';

INSERT INTO Customers(cnum, cname, city, rating, snum) VALUES
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2007, 'Pereira', 'Rome', 100, 1004),
(2008, 'Cisneros', 'San Jose', 300, 1007);

CREATE TABLE IF NOT EXISTS Orders (
  onum smallint NOT NULL,
  amt decimal(10,2) NOT NULL,
  odate timestamp with time zone NOT NULL,
  cnum smallint NOT NULL,
  snum smallint NOT NULL
);

COMMENT ON COLUMN Orders.onum IS 'уникальный номер данный каждому приобретению';
COMMENT ON COLUMN Orders.amt IS 'значение суммы приобретений';
COMMENT ON COLUMN Orders.odate IS 'дата приобретения';
COMMENT ON COLUMN Orders.cnum IS 'номер заказчика делающего приобретение (из таблицы Заказчиков)';
COMMENT ON COLUMN Orders.snum IS 'номер продавца продающего приобретение (из таблицы Продавцов)';


INSERT INTO Orders(onum, amt, odate, cnum, snum) VALUES
(3001, '18.69', '1990-03-10', 2008, 1007),
(3003, '767.19', '1990-03-10', 2001, 1001),
(3002, '1900.10', '1990-03-10', 2007, 1004),
(3005, '5160.45', '1990-03-10', 2003, 1002),
(3006, '1098.16', '1990-03-10', 2008, 1007),
(3009, '1713.23', '1990-03-10', 2002, 1003),
(3007, '75.75', '1990-04-10', 2004, 1002),
(3008, '4723.00', '1990-05-10', 2006, 1001),
(3010, '1309.95', '1990-06-10', 2004, 1002),
(3011, '9891.88', '1990-06-10', 2006, 1001);

CREATE TABLE IF NOT EXISTS Salespeople (
  snum smallint NOT NULL,
  sname varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  comm decimal(2,2) NOT NULL
);

COMMENT ON COLUMN Salespeople.snum IS 'уникальный номер, назначенный каждому продавцу ("номер служащего")';
COMMENT ON COLUMN Salespeople.sname IS 'имя продавца';
COMMENT ON COLUMN Salespeople.city IS 'расположение продавца (город)';
COMMENT ON COLUMN Salespeople.comm IS 'комиссионные продавцов в десятичной форме';

INSERT INTO Salespeople(snum, sname, city, comm) VALUES
(1001, 'Peel', 'London', '0.12'),
(1002, 'Serres', 'San Jose', '0.13'),
(1004, 'Motika', 'London', '0.11'),
(1007, 'Rifkin', 'Barcelona', '0.15'),
(1003, 'Axelrod', 'New York', '0.10');

ALTER TABLE Customers ADD PRIMARY KEY (cnum);
ALTER TABLE Orders ADD PRIMARY KEY (onum);
ALTER TABLE Salespeople ADD PRIMARY KEY (snum);

COMMIT;
