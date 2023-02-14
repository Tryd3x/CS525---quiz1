DROP TABLE IF EXISTS bar CASCADE;
CREATE TABLE bar (
  name TEXT,
  city TEXT,
  owner TEXT,
  closedon TEXT,
  PRIMARY KEY(name, city)
);
INSERT INTO bar VALUES
('Murphys' , 'Chicago' , 'McDonald' , NULL),
('The Elephant' , 'Chicago' , 'Smith' , 'Saturday'),
('Fiesta' , 'Schaumburg' , 'Gordot' , 'Sunday')
;

DROP TABLE IF EXISTS drink CASCADE;
CREATE TABLE drink (
  drink TEXT PRIMARY KEY,
  type TEXT,
  alcoholperc FLOAT
);
INSERT INTO drink VALUES
('Cranberry Juice', 'juice' , 0.0),
('Millers light', 'beer' , 3.5),
('Lagunitas maximus', 'beer' , 9.0),
('Jack Daniels', 'liquor' , 38.0),
('Oban', 'liquor', 45.0),
('Guiness', 'beer', 6)
;

DROP TABLE IF EXISTS menu CASCADE;
CREATE TABLE menu (
  drink TEXT,
  bname TEXT,
  bcity TEXT,
  price NUMERIC(10,2),
  FOREIGN KEY (drink) REFERENCES drink,
  FOREIGN KEY (bname,bcity) REFERENCES bar, 
  PRIMARY KEY (drink,bname,bcity)
);
INSERT INTO menu VALUES
('Cranberry Juice', 'Murphys', 'Chicago', 3.5),
('Millers light', 'Murphys', 'Chicago', 3.0),
('Oban', 'Murphys', 'Chicago', 14.5),
('Guiness', 'Murphys', 'Chicago', 7.5),
('Lagunitas maximus', 'The Elephant', 'Chicago', 6.0),
('Jack Daniels', 'The Elephant', 'Chicago', 9.5),
('Guiness', 'The Elephant', 'Chicago', 8.3),
('Lagunitas maximus', 'Fiesta' , 'Schaumburg', 5.5),
('Jack Daniels', 'Fiesta' , 'Schaumburg', 12.5),
('Cranberry Juice', 'Fiesta' , 'Schaumburg', 6.5)
;

DROP TABLE IF EXISTS receipt CASCADE;
CREATE TABLE receipt (
  id INT,
  patron TEXT,
  bname TEXT,
  bcity TEXT,
  paymentmethod TEXT,
  FOREIGN KEY (bname,bcity) REFERENCES bar, 
  PRIMARY KEY (id)
);
INSERT INTO receipt VALUES
(1, 'Smitthy', 'Murphys', 'Chicago', 'card'),
(2, 'Smitthy', 'The Elephant', 'Chicago', 'cash'),
(3, 'Fran', 'Murphys', 'Chicago', 'card'),
(4, 'Otto', 'Murphys', 'Chicago', 'cash'),
(5, 'Schmotto', 'Fiesta', 'Schaumburg', 'cash'),
(6, 'Potto', 'Fiesta', 'Schaumburg', 'cash')
;

DROP TABLE IF EXISTS item CASCADE;
CREATE TABLE item (
  receiptid INT,
  drink TEXT,
  quantity INT,
  FOREIGN KEY (drink) REFERENCES drink,
  FOREIGN KEY (receiptid) REFERENCES receipt, 
  PRIMARY KEY (receiptid, drink)
);
INSERT INTO item VALUES
(1, 'Millers light', 1),
(1, 'Oban', 3),
(2, 'Guiness', 2),
(3, 'Guiness', 4),
(3, 'Cranberry Juice', 2),
(4, 'Oban', 1),
(5, 'Lagunitas maximus', 1),
(5, 'Jack Daniels', 1),
(6, 'Lagunitas maximus', 5)
;

DROP TABLE IF EXISTS formula CASCADE;
CREATE TABLE formula (
  clause INT,
  var INT,
  negated INT
);
INSERT INTO formula VALUES
(0,0,0),
(0,1,0),
(1,0,0),
(1,1,1),
(2,0,1),
(2,1,0),
(3,0,1),
(3,1,1)
;
