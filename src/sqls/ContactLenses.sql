DROP TABLE IF EXISTS ContactLenses;
CREATE TABLE 
	ContactLenses (ID INT PRIMARY KEY,
		AGE INT,
		SPECPRESC INT,
		ASTIGMATIC INT,
		TEARPR INT,
		TARGET VARCHAR(15)
	);

INSERT INTO ContactLenses VALUES(1, 1, 1, 1, 1, 'No lenses');
INSERT INTO ContactLenses VALUES(2, 1, 1, 1, 2, 'Soft lenses');
INSERT INTO ContactLenses VALUES(3, 1, 1, 2, 1, 'No lenses');
INSERT INTO ContactLenses VALUES(4, 1, 1, 2, 2, 'Hard lenses');
INSERT INTO ContactLenses VALUES(5, 1, 2, 1, 1, 'No lenses');
INSERT INTO ContactLenses VALUES(6, 1, 2, 1, 2, 'Soft lenses');
INSERT INTO ContactLenses VALUES(7, 1, 2, 2, 1, 'No lenses');
INSERT INTO ContactLenses VALUES(8, 1, 2, 2, 2, 'Hard lenses');
INSERT INTO ContactLenses VALUES(9, 2, 1, 1, 1, 'No lenses');
INSERT INTO ContactLenses VALUES(10, 2, 1, 1, 2, 'Soft lenses');
INSERT INTO ContactLenses VALUES(11, 2, 1, 2, 1, 'No lenses');
INSERT INTO ContactLenses VALUES(12, 2, 1, 2, 2, 'Hard lenses');
INSERT INTO ContactLenses VALUES(13, 2, 2, 1, 1, 'No lenses');
INSERT INTO ContactLenses VALUES(14, 2, 2, 1, 2, 'Soft lenses');
INSERT INTO ContactLenses VALUES(15, 2, 2, 2, 1, 'No lenses');
INSERT INTO ContactLenses VALUES(16, 2, 2, 2, 2, 'No lenses');
INSERT INTO ContactLenses VALUES(17, 3, 1, 1, 1, 'No lenses');
INSERT INTO ContactLenses VALUES(18, 3, 1, 1, 2, 'No lenses');
INSERT INTO ContactLenses VALUES(19, 3, 1, 2, 1, 'No lenses');
INSERT INTO ContactLenses VALUES(20, 3, 1, 2, 2, 'Hard lenses');
INSERT INTO ContactLenses VALUES(21, 3, 2, 1, 1, 'No lenses');
INSERT INTO ContactLenses VALUES(22, 3, 2, 1, 2, 'Soft lenses');
INSERT INTO ContactLenses VALUES(23, 3, 2, 2, 1, 'No lenses');
INSERT INTO ContactLenses VALUES(24, 3, 2, 2, 2, 'No lenses');

