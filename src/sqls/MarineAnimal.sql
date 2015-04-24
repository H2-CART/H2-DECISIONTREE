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
ADD COLUMN PREDICTION VARCHAR(50) AS CLASSIFY('MARINEANIMAL', NOSURFACE, FLAPPERS, FISH) AFTER FISH;

INSERT INTO MARINEANIMAL (ID, NOSURFACE, FLAPPERS, FISH) REDECISION VALUES (7, 1, 1, 'No');
INSERT INTO MARINEANIMAL (ID, NOSURFACE, FLAPPERS, FISH) REDECISION VALUES (8, 1, 1, 'No');
INSERT INTO MARINEANIMAL (ID, NOSURFACE, FLAPPERS, FISH) REDECISION VALUES (9, 1, 1, 'No');
INSERT INTO MARINEANIMAL (ID, NOSURFACE, FLAPPERS, FISH) REDECISION VALUES (10, 1, 1, 'No');
INSERT INTO MARINEANIMAL (ID, NOSURFACE, FLAPPERS, FISH) REDECISION VALUES (11, 1, 1, 'No');   
INSERT INTO MARINEANIMAL (ID, NOSURFACE, FLAPPERS, FISH) REDECISION VALUES (12, 1, 1, 'No');   
INSERT INTO MARINEANIMAL (ID, NOSURFACE, FLAPPERS, FISH) REDECISION VALUES (13, 1, 1, 'No');   
INSERT INTO MARINEANIMAL (ID, NOSURFACE, FLAPPERS, FISH) REDECISION VALUES (14, 1, 1, 'No');   
