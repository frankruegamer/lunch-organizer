-- noinspection SpellCheckingInspectionForFile

INSERT INTO PERSON(name)
VALUES ('Person'),
       ('Person2');

INSERT INTO ADDRESS (country, postal_code, city, street, house_number)
VALUES ('DE', '97074', 'Würzburg', 'Rottendorfer Straße', '48');
INSERT INTO RESTAURANT(name, address_id)
SELECT 'Bobby''s Pizza', lastval();

INSERT INTO ADDRESS (country, postal_code, city, street, house_number)
VALUES ('DE', '97076', 'Würzburg', 'Nürnberger Straße', '76');
INSERT INTO RESTAURANT(name, address_id)
SELECT 'Thanh Tin', lastval();

INSERT INTO ADDRESS (country, postal_code, city, street, house_number)
VALUES ('DE', '97082', 'Würzburg', 'Weißenburgerstraße', '7');
INSERT INTO RESTAURANT(name, address_id)
SELECT 'Kyo Xpress', lastval();

INSERT INTO ADDRESS (country, postal_code, city, street, house_number)
VALUES ('DE', ' 97218', 'Gerbrunn', 'Mühlweg', '10a');
INSERT INTO RESTAURANT(name, address_id)
SELECT 'Dönmez Döner', lastval();

INSERT INTO ADDRESS (country, postal_code, city, street, house_number)
VALUES ('DE', '97076', 'Würzburg', 'Louis-Pasteur-Straße', '5');
INSERT INTO RESTAURANT(name, address_id)
SELECT 'Pavillon', lastval();

INSERT INTO ADDRESS (country, postal_code, city, street, house_number)
VALUES ('DE', '97076', 'Würzburg', 'Nürnberger Straße', '124');
INSERT INTO RESTAURANT(name, address_id)
SELECT 'Bacon Bomber', lastval();
