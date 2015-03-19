DROP TABLE IF EXISTS CLENSES;
CREATE TABLE
CLENSES (ID INT PRIMARY KEY,
AGE VARCHAR(255),
SPR VARCHAR(255),
AST VARCHAR(255),
TPR VARCHAR(255),
LNS VARCHAR(255)
);

INSERT INTO CLENSES VALUES(1, 'young', 'myope', 'no', 'reduced', 'No contact lenses');
INSERT INTO CLENSES VALUES(2, 'young', 'myope', 'no', 'normal', 'Soft contact lenses');
INSERT INTO CLENSES VALUES(3, 'young', 'myope', 'yes', 'reduced', 'No contact lenses');
INSERT INTO CLENSES VALUES(4, 'young', 'myope', 'yes', 'normal', 'Hard contact lenses');
INSERT INTO CLENSES VALUES(5, 'young', 'hypermetrope', 'no', 'reduced', 'No contact lenses');
INSERT INTO CLENSES VALUES(6, 'young', 'hypermetrope', 'no', 'normal', 'Soft contact lenses');
INSERT INTO CLENSES VALUES(7, 'young', 'hypermetrope', 'yes', 'reduced', 'No contact lenses');
INSERT INTO CLENSES VALUES(8, 'young', 'hypermetrope', 'yes', 'normal', 'Hard contact lenses');
INSERT INTO CLENSES VALUES(9, 'pre-presbyopic', 'myope', 'no', 'reduced', 'No contact lenses');
INSERT INTO CLENSES VALUES(10, 'pre-presbyopic', 'myope', 'no', 'normal', 'Soft contact lenses');
INSERT INTO CLENSES VALUES(11, 'pre-presbyopic', 'myope', 'yes', 'reduced', 'No contact lenses');
INSERT INTO CLENSES VALUES(12, 'pre-presbyopic', 'myope', 'yes', 'normal', 'Hard contact lenses');
INSERT INTO CLENSES VALUES(13, 'pre-presbyopic', 'hypermetrope', 'no', 'reduced', 'No contact lenses');
INSERT INTO CLENSES VALUES(14, 'pre-presbyopic', 'hypermetrope', 'no', 'normal', 'Soft contact lenses');
INSERT INTO CLENSES VALUES(15, 'pre-presbyopic', 'hypermetrope', 'yes', 'reduced', 'No contact lenses');
INSERT INTO CLENSES VALUES(16, 'pre-presbyopic', 'hypermetrope', 'yes', 'normal', 'No contact lenses');
INSERT INTO CLENSES VALUES(17, 'presbyopic', 'myope', 'no', 'reduced', 'No contact lenses');
INSERT INTO CLENSES VALUES(18, 'presbyopic', 'myope', 'no', 'normal', 'No contact lenses');
INSERT INTO CLENSES VALUES(19, 'presbyopic', 'myope', 'yes', 'reduced', 'No contact lenses');
INSERT INTO CLENSES VALUES(20, 'presbyopic', 'myope', 'yes', 'normal', 'Hard contact lenses');
INSERT INTO CLENSES VALUES(21, 'presbyopic', 'hypermetrope', 'no', 'reduced', 'No contact lenses');
INSERT INTO CLENSES VALUES(22, 'presbyopic', 'hypermetrope', 'no', 'normal', 'Soft contact lenses');
INSERT INTO CLENSES VALUES(23, 'presbyopic', 'hypermetrope', 'yes', 'reduced', 'No contact lenses');
INSERT INTO CLENSES VALUES(24, 'presbyopic', 'hypermetrope', 'yes', 'normal', 'No contact lenses');


CALL DECISIONTREE('CLENSES', 'AGE', 'SPR', 'AST', 'TPR', 'LNS');

ALTER TABLE CLENSES
ADD COLUMN PREDICTION VARCHAR(255) AS CLASSIFY('CLENSES', AGE, SPR, AST, TPR, LNS) AFTER LNS


INSERT INTO CLENSES (ID, AGE, SPR, AST, TPR, LNS)
VALUES (25, 'young', 'hypermetrope', 'yes', 'reduced', 'Soft contact lenses')

INSERT INTO CLENSES (ID, AGE, SPR, AST, TPR, LNS)
VALUES (26, 'young', 'hypermetrope', 'no', 'normal', 'No contact lenses')