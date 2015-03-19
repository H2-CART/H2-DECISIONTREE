DROP TABLE IF EXISTS MarineAnimal;
CREATE TABLE 
	MarineAnimal(ID INT PRIMARY KEY, 
		NOSURFACE INT,
		FLAPPERS INT,
		FISH VARCHAR(3)
	);

INSERT INTO MarineAnimal VALUES(1, 1, 1, 'Yes');
INSERT INTO MarineAnimal VALUES(2, 1, 1, 'Yes');
INSERT INTO MarineAnimal VALUES(3, 1, 0, 'No');
INSERT INTO MarineAnimal VALUES(4, 0, 1, 'No');
INSERT INTO MarineAnimal VALUES(5, 0, 1, 'No');

CALL DECISIONTREE('MARINEANIMAL', 'NOSURFACE', 'FLAPPERS', 'FISH');

ALTER TABLE MARINEANIMAL
ADD COLUMN PREDICTION VARCHAR(50) AS CLASSIFY('MARINEANIMAL', NOSURFACE, FLAPPERS, FISH) AFTER FISH

INSERT INTO MARINEANIMAL(ID, NOSURFACE, FLAPPERS, FISH) VALUES (6, 1, 1, 'Yes’)