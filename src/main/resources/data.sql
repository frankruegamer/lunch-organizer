-- noinspection SpellCheckingInspectionForFile

WITH address AS (
    INSERT INTO address (country, postal_code, city, street, house_number)
    VALUES ('DE', '97074', 'Würzburg', 'Rottendorfer Straße', '48')
    RETURNING id
)
, restaurant AS (
    INSERT INTO restaurant (name, telephone, address_id)
        SELECT 'Bobby''s Pizza', '49-931-26077171', id FROM address
    RETURNING id
)
INSERT INTO food(number, name, description, price, restaurant_id)
VALUES
(null, 'Samosa Teigtaschen', 'mit Gemüse gefüllt', 5.00, (SELECT id FROM restaurant)),
(null, 'Chicken Nuggets', '8 Stück', 5.00, (SELECT id FROM restaurant)),
(null, 'Chicken Wings', '8 Stück', 5.00, (SELECT id FROM restaurant)),
(null, 'Calamari paniert', '10 Ringe', 5.00, (SELECT id FROM restaurant)),
('1', 'Pizza Margherita', 'mit Tomaten und Käse', 4.20, (SELECT id FROM restaurant)),
('2', 'Pizza Vorderschinken', null, 4.20, (SELECT id FROM restaurant)),
('3', 'Pizza Salami', null, 4.20, (SELECT id FROM restaurant)),
('4', 'Pizza Peperoniwurst', null, 4.20, (SELECT id FROM restaurant)),
('5', 'Pizza Champignons', null, 4.20, (SELECT id FROM restaurant)),
('6', 'Pizza Paprika', null, 4.20, (SELECT id FROM restaurant)),
('7', 'Pizza Broccoli', null, 4.20, (SELECT id FROM restaurant)),
('8', 'Pizza Artischocken', null, 4.20, (SELECT id FROM restaurant)),
('9', 'Pizza Spinat mit Hirtenkäse', null, 4.20, (SELECT id FROM restaurant)),
('10', 'Pizza Leo', 'mit Vorderschinken und Peperoniwurst', 4.20, (SELECT id FROM restaurant)),
('11', 'Pizza Roma', 'mit Vorderschinken und Salami', 4.20, (SELECT id FROM restaurant)),
('12', 'Pizza Salame Funghi', 'mit Salami, Champignons', 4.20, (SELECT id FROM restaurant)),
('13', 'Pizza Peperoniwurst Funghi', 'mit Peperoniwurst und Champignons', 4.20, (SELECT id FROM restaurant)),
('14', 'Pizza Prosciuto Funghi', 'mit Vorderschinken und Champignons', 4.20, (SELECT id FROM restaurant)),
('15', 'Pizza Regina', 'mit Vorderschinken und Paprika', 4.20, (SELECT id FROM restaurant)),
('17', 'Pizza Hawaii', 'mit Vorderschinken und Ananas', 4.20, (SELECT id FROM restaurant)),
('18', 'Pizza Mozzarella', 'mit frischen Tomaten, Mozzarella und Basilikum', 4.20, (SELECT id FROM restaurant)),
('19', 'Pizza Mista', 'mit Vorderschinken, Salami und Champignons', 4.20, (SELECT id FROM restaurant)),
('20', 'Pizza Navi', 'mit Vorderschinken, Salami, Peperoniwurst und Champignons', 4.20, (SELECT id FROM restaurant)),
('21', 'Pizza Vier Jahreszeiten', 'mit Vorderschinken, Salami, Paprika und Champignons', 4.20, (SELECT id FROM restaurant)),
('22', 'Pizza Italia', 'mit Vorderschinken, Paprika und Spiegelei', 4.20, (SELECT id FROM restaurant)),
('23', 'Pizza Tonno Cipolle', 'mit Thunfisch, Zwiebel und Knoblauch', 4.20, (SELECT id FROM restaurant)),
('24', 'Pizza Frutti di Mare', 'mit Meeresfrüchten', 4.20, (SELECT id FROM restaurant)),
('25', 'Pizza Sardellen', 'mit Sardellen, Kapern und Zwiebeln', 4.20, (SELECT id FROM restaurant)),
('26', 'Pizza Capricciosa', 'mit Vorderschinken, Champignons, Oliven und Artischocken', 4.20, (SELECT id FROM restaurant)),
('27', 'Pizza Diavolo', 'mit Peperoniwurst, grüne Peperoni und Paprika', 4.20, (SELECT id FROM restaurant)),
('28', 'Pizza Bobbynulls', 'mit frischen Tomaten, Spinat und Mozzarella', 4.20, (SELECT id FROM restaurant)),
('29', 'Pizza Vegetarisch', 'mit Champignons, Paprika, Artischocken, Broccoli, Spinat, grüne Peperoni, Zwiebeln und Oliven', 4.20, (SELECT id FROM restaurant)),
('30', 'Pizza Speciale', 'mit Vorderschinken, Salami, Peperoniwurst, Oliven, Champignons, grüne Peperoni, Paprika und Zwiebeln', 4.20, (SELECT id FROM restaurant)),
('31', 'Pizza Milano (scharf)', 'mit Vorderschinken, Salami, Hackfleisch, Zwiebeln, Jalapenos und Knoblauch', 4.20, (SELECT id FROM restaurant)),
('32', 'Pizza Mexicana (scharf)', 'mit Peperoniwurst, Champignons, Paprika, Kidney Bohnen, Mais, Knoblauch und Jalapenos', 4.20, (SELECT id FROM restaurant)),
('33', 'Pizza Santana (scharf)', 'Hähnchenbrustfilet, Hirtenkäse, Zwiebeln, grüne Peperoni und Chili', 4.20, (SELECT id FROM restaurant)),
('34', 'Pizza Hähnchen-Gyros', 'mit Hähnchenbrustfilet, Curry und Zwiebeln', 4.20, (SELECT id FROM restaurant)),
('35', 'Pizza Holondaise (scharf)', 'mit Vorderschinken, Salami, Hähnchenbrustfilet, Paprika, Zwiebeln, Chili und Sauce Holondaise', 4.20, (SELECT id FROM restaurant)),
('36', 'Pizza Barbecue', 'mit Hähnchenbrustfilet, Zwiebeln, Paprika und BBQ-Sauce', 4.20, (SELECT id FROM restaurant)),
('37', 'Pizza Texas', 'mit Peperoniwurst, Paprika, Mozzarella und BBQ-Sauce', 4.20, (SELECT id FROM restaurant)),
('38', 'Pizza Mumbai', 'mit Salami, Mais, Hähnchenbrustfilet und Zwiebeln', 4.20, (SELECT id FROM restaurant)),
('39', 'Pizza Quadro Formagi', 'mit Edamer, Hirtenkäse, Gorgonzola und Mozzarella', 4.20, (SELECT id FROM restaurant)),
('40', 'Pizza Calzone', 'mit Vorderschinken, Salami und Champignons gefüllt', 4.20, (SELECT id FROM restaurant)),
('41', 'Pizzabrot', null, 2.50, (SELECT id FROM restaurant)),
('42', 'Pizzabrot', 'mit Tomatensauce und Knoblauch', 3.50, (SELECT id FROM restaurant)),
('43', 'Pizza Mafia', 'mit Vorderschinken, Hackfleisch, Hirtenkäse und grüne Peperoni, scharf', 4.20, (SELECT id FROM restaurant)),
('50', 'Pasta al Pomodoro', 'mit Tomatensauce', 6.50, (SELECT id FROM restaurant)),
('51', 'Pasta Bolognese', 'mit Hackfleischsauce', 6.90, (SELECT id FROM restaurant)),
('52', 'Pasta Carbonara', 'mit Vorderschinken, Ei und Sahnesauce', 7.90, (SELECT id FROM restaurant)),
('53', 'Pasta Pana', 'mit Vorderschinken und Sahnesauce', 7.50, (SELECT id FROM restaurant)),
('54', 'Pasta Della Casa', 'mit Hackfleischsauce, Schinken, Pilze und Erbsen', 7.90, (SELECT id FROM restaurant)),
('55', 'Pasta Diavlo (scharf)', 'mit Paprika, grüne Peperoni, Champignons und Tomatensauce', 7.90, (SELECT id FROM restaurant)),
('56', 'Pasta Gorgonzola', 'mit Sahnesauce und Gorgonzola', 7.90, (SELECT id FROM restaurant)),
('57', 'Pasta Tono', 'mit Tomatensauce, Thunfisch und Knoblauch', 7.90, (SELECT id FROM restaurant)),
('59', 'Pasta al Forno', 'mit Hackfleischsauce, Schinken und mit Käse überbacken', 8.50, (SELECT id FROM restaurant)),
('60', 'Pasta al Forno Broccoli', 'mit Sahnesauce, Broccoli und mit Käse überbacken', 8.50, (SELECT id FROM restaurant)),
('61', 'Pasta al Forno Mista', 'mit Hackfleischsauce, Rigatoni, Tortellini, Spaghetti und mit Käse überbacken', 8.90, (SELECT id FROM restaurant)),
('62', 'Lasagne', 'mit Hackfleischsauce, Schinken und mit Käse überbacken', 8.50, (SELECT id FROM restaurant)),
('63', 'Lasagne Vegetarisch', 'Broccoli, Spinat, Tomatensauce und mit Käse überbacken', 8.50, (SELECT id FROM restaurant)),
('70', 'Insalata Mista', 'mit Gurken, Tomaten, Paprika, Karotten und Zwiebeln', 6.50, (SELECT id FROM restaurant)),
('71', 'Insalata Casa Italia', 'mit Gurken, Tomaten, Karotten, grünen Peperoni, Zwiebeln, Oliven, Ei, Vorderschinken und Käse', 7.50, (SELECT id FROM restaurant)),
('72', 'Griechischer Salat', 'mit Gurken, Tomaten, Paprika, Karotten, Oliven und Fetakäse', 7.50, (SELECT id FROM restaurant)),
('73', 'Insalata Tono', 'mit Gurken, Tomaten, Thunfisch, Zwiebeln, Oliven und Ei', 7.50, (SELECT id FROM restaurant)),
('74', 'Bauernsalat', 'mit Gurken, Tomaten, Paprika, Zwiebeln, Oliven, Mais, Bohnen, Fetakäse und Ei', 7.50, (SELECT id FROM restaurant)),
('75', 'Hähnchenbrustfilet-Salat', 'mit gebratenen Hähnchenbrustfilet-Streifen, Gurken und Tomaten', 8.00, (SELECT id FROM restaurant)),
('76', 'Salat Mozzarella Pomodorro', 'mit Tomaten, Mozzarella und Basilikum', 7.50, (SELECT id FROM restaurant)),
('77', 'Insalata Dimare', 'mit Gurken, Paprika und Shrimps', 8.00, (SELECT id FROM restaurant)),
('80', 'Schnitzel Wiener Art', 'mit Zitrone', 8.90, (SELECT id FROM restaurant)),
('81', 'Rahmschnitzel', 'mit Rahmsauce', 9.90, (SELECT id FROM restaurant)),
('82', 'Jägerschnitzel', 'mit Champignons und Jägersauce', 9.90, (SELECT id FROM restaurant)),
('83', 'Schnitzel Paprika', 'mit bunter Paprika-Sauce', 9.90, (SELECT id FROM restaurant)),
('84', 'Schnitzel al Forno', 'mit Hackfleischsauce, Schinken und mit Käse überbacken', 9.90, (SELECT id FROM restaurant)),
('85', 'Broccoli-Schnitzel', 'mit Sahnesauce, Broccoli und mit Käse überbacken', 9.90, (SELECT id FROM restaurant)),
('86', 'Schnitzel Hawaii', 'mit Sahnesauce, Schinken, Ananas und mit Käse überbacken', 9.90, (SELECT id FROM restaurant)),
('87', 'Schnitzel Bobby''s', 'mit Sahnesauce, Schinken, Champignons und mit Käse überbacken', 9.90, (SELECT id FROM restaurant)),
('88', 'Gorgonzola-Schnitzel', 'mit Sahne-Gorgonzolasauce', 9.90, (SELECT id FROM restaurant)),
('89', 'Pfeffer-Schnitzel', 'mit Bratensauce und grünem Pfeffer', 9.90, (SELECT id FROM restaurant)),
('90', 'Cordon Bleu', 'mit Vorderschinken und Käse gefüllt, dazu Sahnesauce oder Zitrone', 10.90, (SELECT id FROM restaurant)),
('92', 'Gyros', 'mit Tzaziki und einem Krautsalat', 9.50, (SELECT id FROM restaurant)),
('101', 'Murgh Korma', 'Hähnchenbrustfilet mit Joghurt-Sahne-Sauce, Mandeln, Kokosnuss und exotische Gewürze', 9.90, (SELECT id FROM restaurant)),
('102', 'Murgh Vindola', 'Hähnchenbrustfilet, Kartoffeln und eine pikante Curry-Sauce', 9.90, (SELECT id FROM restaurant)),
('103', 'Palak Murgh', 'Hähnchenbrustfilet und Spinat auf nordindische Art zubereitet', 9.90, (SELECT id FROM restaurant)),
('104', 'Butter Murgh', 'Hähnchenbrustfilet mit einer leichten Butter-Sauce', 9.90, (SELECT id FROM restaurant)),
('105', 'Murgh-Chili-Masala', 'Hähnchenbrustfilet, Ingwer, Knoblauch, Zwiebeln, Paprika und Chilisauce', 9.90, (SELECT id FROM restaurant)),
('106', 'Mango-Murgh', 'Hähnchenbrustfilet mit einer traditionellen Mango-Sauce', 9.90, (SELECT id FROM restaurant)),
('107', 'Murgh Sabzi', 'Hähnchenbrustfilet mit verschiedenem Gemüse und Curry-Sauce', 9.90, (SELECT id FROM restaurant)),
('110', 'Gosht Karahi', 'Lammfleisch mit Ingwer, Knoblauch und Chilisauce, scharf', 10.90, (SELECT id FROM restaurant)),
('111', 'Gosht Korma', 'Lammfleisch mit Safran-Mandel-Sauce', 10.90, (SELECT id FROM restaurant)),
('112', 'Palak Gosht', 'Lammfleisch mit Spinat auf nordindische Art', 10.90, (SELECT id FROM restaurant)),
('113', 'Gosht Vindalo', 'Lammfleisch mit Kartoffeln und eine pikante Sauce', 10.90, (SELECT id FROM restaurant)),
('114', 'Gosht Chili-Masala', 'Lammfleisch mit Zwiebeln, Paprika, Ingwer, Knoblauch und einer scharfen Chili-Sauce', 10.90, (SELECT id FROM restaurant)),
('115', 'Gosht Jalfrazie', 'Lammfleisch mit verschiedenem Gemüse und Zitronensaft', 10.90, (SELECT id FROM restaurant)),
('120', 'Channa Masala', 'Kichererbsen, Tomaten, Ingwer und Knoblauch mit indischen Gewürzen, gebraten', 8.50, (SELECT id FROM restaurant)),
('121', 'Sag Paneer', 'Spinat mit Frischkäse, Ingwer, Knoblauch auf nordindische Art gebraten', 8.50, (SELECT id FROM restaurant)),
('122', 'Matter Paneer', 'grüne Erbsen mit Frischkäse, Tomaten und einer milden Curry-Sauce', 8.50, (SELECT id FROM restaurant)),
('123', 'Mixed Vegetable', 'mit verschiedenem Gemüse, auf nordindische Art zubereitet', 8.50, (SELECT id FROM restaurant)),
('130', 'Murgh Biryani', 'Hähnchenbrustfilet, Basmatireis mit Mandeln und Rosinen', 8.90, (SELECT id FROM restaurant)),
('131', 'Gosht Biryani', 'Lammfleisch, Basmatireis mit Mandeln und Rosinen', 8.90, (SELECT id FROM restaurant)),
('132', 'Sabzi Biryani', 'verschiedene Gemüse, Basmatireis und Rosinen', 8.90, (SELECT id FROM restaurant)),
('150', 'Chili con Carne (sehr scharf)', 'Hackfleisch, Bohnen, Mais, Paprika, Knoblauch, Zwiebeln und Pizzabrot', 8.90, (SELECT id FROM restaurant)),
('151', 'Enchilada (sehr scharf)', 'gefüllt mit Hackfleisch, Zwiebeln, Jalapenos, Knoblauch, Tomatensauce und mit Käse überbacken', 8.90, (SELECT id FROM restaurant)),
('152', 'Burritos (sehr scharf)', 'gefüllt mit Hackfleisch, Zwiebeln, Mais, Jalapenos, Knoblauch, Joghurt Dressing und mit Käse überbacken', 8.90, (SELECT id FROM restaurant)),
('153', 'Tres Tacos', 'Mais-Tortillas gefüllt mit Hackfleisch, Mais, Zwiebeln, Bohnen, Tomatensauce und mit Käse überbacken', 8.90, (SELECT id FROM restaurant)),
('160', 'Broccoli-Auflauf', 'mit Kartoffeln, Sahnesauce, Broccoli, Champignons, Vorderschinken und mit Käse überbacken', 8.90, (SELECT id FROM restaurant)),
('161', 'Gemüse-Auflauf', 'mit Kartoffeln, Sahnesauce, versch. Gemüse und mit Käse überbacken', 8.90, (SELECT id FROM restaurant)),
('162', 'Blumenkohl-Auflauf', 'mit Kartoffeln, Sahnesauce, frischem Blumenkohl, Vorderschinken, Hackfleisch und mit Käse überbacken', 8.90, (SELECT id FROM restaurant)),
('163', 'Zuccini-Auflauf', 'mit Kartoffeln, Sahnesauce, Zuccini, Tomaten und mit Käse überbacken', 8.90, (SELECT id FROM restaurant)),
('164', 'Kartoffel-Hackfleisch-Auflauf', 'mit Kartoffeln, Sahnesauce, Hackfleisch, Schinken und mit Käse überbacken', 8.90, (SELECT id FROM restaurant)),
('165', 'Hähnchen-Gemüse-Auflauf', 'mit Kartoffeln, Sahnesauce, Hähnchen, versch. Gemüse und mit Käse überbacken', 8.90, (SELECT id FROM restaurant)),
(null, 'Pommes Frites', null, 2.50, (SELECT id FROM restaurant)),
(null, 'Bunter Beilagensalat', null, 2.50, (SELECT id FROM restaurant)),
(null, 'Knoblauchkartoffeln', null, 3.00, (SELECT id FROM restaurant)),
(null, 'Basmatireis', null, 3.00, (SELECT id FROM restaurant)),
(null, 'Tzatziki', null, 3.00, (SELECT id FROM restaurant)),
(null, 'Gurkensalat', null, 3.00, (SELECT id FROM restaurant)),
(null, 'Krautsalat', null, 3.00, (SELECT id FROM restaurant)),
(null, 'Ben & Jerry''s Cookie Dough', '100 ml', 3.00, (SELECT id FROM restaurant)),
(null, 'Ben & Jerry''s Chocolate Fudge Brownie', '100 ml', 3.00, (SELECT id FROM restaurant)),
(null, 'Ben & Jerry''s Strawberry Cheesecake', '100 ml', 3.00, (SELECT id FROM restaurant)),
(null, 'Ben & Jerry''s Chunky Monkey', '100 ml', 3.00, (SELECT id FROM restaurant)),
(null, 'Ben & Jerry''s Peanut Butter Cup', '100 ml', 3.00, (SELECT id FROM restaurant)),
(null, 'Ben & Jerry''s Caramel Chew Chew', '100 ml', 3.00, (SELECT id FROM restaurant)),
(null, 'Ben & Jerry''s Karamel Sutra', '500 ml', 7.49, (SELECT id FROM restaurant)),
(null, 'Mövenpick apleStraciatella', '900 ml', 7.50, (SELECT id FROM restaurant)),
(null, 'Mövenpick apleBourbon Vanille', '900 ml', 7.50, (SELECT id FROM restaurant)),
(null, 'Mövenpick apleMaple Walnuts', '900 ml', 7.50, (SELECT id FROM restaurant)),
(null, 'Coca Cola', '1,0 Liter', 2.20, (SELECT id FROM restaurant)),
(null, 'Coca Cola light', '1,0 Liter', 2.20, (SELECT id FROM restaurant)),
(null, 'Fanta', '1,0 Liter', 2.20, (SELECT id FROM restaurant)),
(null, 'Sprite', '1,0 Liter', 2.20, (SELECT id FROM restaurant)),
(null, 'Mezzo Mix', '1,0 Liter', 2.20, (SELECT id FROM restaurant)),
(null, 'Wasser', '1,0 Liter', 2.20, (SELECT id FROM restaurant)),
(null, 'Kauzen Pils', '0,5 Liter', 2.00, (SELECT id FROM restaurant)),
(null, 'Kauzen Hefeweizen', '0,5 Liter', 2.00, (SELECT id FROM restaurant)),
(null, 'Käuzle Kultbier', '0,3 Liter', 1.80, (SELECT id FROM restaurant)),
(null, 'Frascati Weißwein', 'trocken 0,7 Liter', 6.50, (SELECT id FROM restaurant)),
(null, 'Chianti Rotwein', 'trocken 0,7 Liter', 6.50, (SELECT id FROM restaurant)),
(null, 'Bardolina Rotwein', 'trocken 0,7 Liter', 6.50, (SELECT id FROM restaurant)),
(null, 'Lambrusco Rotwein', 'süß 0,7 Liter', 6.50, (SELECT id FROM restaurant))
;

WITH address AS (
    INSERT INTO address (country, postal_code, city, street, house_number)
        VALUES ('DE', '97076', 'Würzburg', 'Nürnberger Straße', '76')
    RETURNING id
)
INSERT INTO restaurant(name, telephone, address_id)
SELECT 'Thanh Tin', '49-931-2999043', id FROM address;

WITH address AS (
    INSERT INTO address (country, postal_code, city, street, house_number)
        VALUES ('DE', '97082', 'Würzburg', 'Weißenburgerstraße', '7')
    RETURNING id
)
INSERT INTO restaurant(name, telephone, address_id)
SELECT 'Kyo Xpress', '49-931-46043533', id FROM address;

WITH address AS (
    INSERT INTO address (country, postal_code, city, street, house_number)
        VALUES ('DE', '97218', 'Gerbrunn', 'Mühlweg', '10a')
    RETURNING id
)
, restaurant AS (
    INSERT INTO restaurant(name, telephone, address_id)
        SELECT 'Dönmez Döner', '49-931-46583037', id FROM address
    RETURNING id
)
INSERT INTO food(number, name, description, price, restaurant_id)
VALUES
('1', 'Drehspieß', 'mit Drehspießfleisch, grüner Salat, Krautsalat, Zwiebeln, Tomaten und Soße', 4.90, (SELECT id FROM restaurant)),
('2', 'Drehspieß Pur', 'mit Drehspießfleisch und Soße', 4.60, (SELECT id FROM restaurant)),
('3', 'Studenten / Schüler Drehspieß', 'mit Drehspießfleisch, grüner Salat, Krautsalat, Zwiebeln, Tomaten und Soße', 4.60, (SELECT id FROM restaurant)),
('4', 'Drehspieß Spezial', 'mit Drehspießfleisch, grüner Salat, Krautsalat, Zwiebeln, Tomaten, Käse und Soße', 5.50, (SELECT id FROM restaurant)),
('5', 'Dönmez Drehspieß', 'mit Drehspießfleisch, grüner Salat, Krautsalat, Zwiebeln, Tomaten, Oliven, Käse und Soße', 5.50, (SELECT id FROM restaurant)),
('6', 'Royal Drehspieß', 'mit Drehspießfleisch, Gemischter Salat, Bratkartoffeln und Pizzakäse', 6.00, (SELECT id FROM restaurant)),
('7', 'Döner-Box', 'mit Drehspießfleisch, Kartoffeln, Pommes oder Salat', 5.00, (SELECT id FROM restaurant)),
('8', 'Monster Drehspieß', 'mit Drehspießfleisch, grüner Salat, Krautsalat, Zwiebeln, Tomaten und Soße', 6.50, (SELECT id FROM restaurant)),
('9', 'Cheese-Drehspieß', 'mit Drehspießfleisch, grüner Salat, Krautsalat, Zwiebeln, Tomaten, Käse überbacken und Soße', 5.50, (SELECT id FROM restaurant)),
('10', 'Dürüm Drehspieß', 'mit Drehspießfleisch, grüner Salat, Krautsalat, Zwiebeln, Tomaten und Soße', 5.50, (SELECT id FROM restaurant)),
('11', 'Dürüm Drehspieß Spezial', 'mit Drehspießfleisch, grüner Salat, Krautsalat, Zwiebeln, Tomaten,Käse und Soße', 6.00, (SELECT id FROM restaurant)),
('12', 'Kinder Drehspieß', 'mit Drehspießfleisch, grüner Salat, Krautsalat, Zwiebeln, Tomaten, Soße', 4.00, (SELECT id FROM restaurant)),
('13', 'Drehspieß Teller', 'mit Drehspießfleisch, Kartoffeln, Pommes oder Reis grüner Salat, Krautsalat, Zwiebeln, Tomaten, Peperoni, Käse und Soße', 8.50, (SELECT id FROM restaurant)),
('14', 'kleiner Drehspieß Teller', 'mit Krautsalat, Zwiebeln, Tomaten, Peperoni, Käse und Soß mit Drehspießfleisch, Kartoffeln, Pommes oder Reis', 7.00, (SELECT id FROM restaurant)),
('20', 'Pide mit Käse', null, 6.00, (SELECT id FROM restaurant)),
('21', 'Pide mit Käse und Spinat', null, 6.00, (SELECT id FROM restaurant)),
('22', 'Pide mit Sucuk', null, 6.00, (SELECT id FROM restaurant)),
('25', 'Hamburger', null, 6.00, (SELECT id FROM restaurant)),
('26', 'Hamburger mit Pommes', null, 9.00, (SELECT id FROM restaurant)),
('27', 'Cheeseburger', null, 6.50, (SELECT id FROM restaurant)),
('28', 'Cheeseburger mit Pommes', null, 9.50, (SELECT id FROM restaurant)),
('30', 'Lahmacun', 'mit grüner Salat, Krautsalat, Zwiebeln, Tomaten und Soße', 5.00, (SELECT id FROM restaurant)),
('31', 'Lahmacun Pur', 'mit Drehspießfleisch und Soße', 5.00, (SELECT id FROM restaurant)),
('32', 'Lahmacun Gerolt', 'mit Drehspießfleisch, grüner Salat, Krautsalat, Zwiebeln, Tomaten und Soße', 5.50, (SELECT id FROM restaurant)),
('33', 'Lahmacun Spezial', 'mit Drehspießfleisch, grüner Salat, Krautsalat, Zwiebeln, Tomaten, Käse und Soße', 6.00, (SELECT id FROM restaurant)),
('35', 'Hirtensalat', null, 6.00, (SELECT id FROM restaurant)),
('36', 'Krautsalat', null, 5.00, (SELECT id FROM restaurant)),
('37', 'Nudelsalat', null, 6.00, (SELECT id FROM restaurant)),
('38', 'Gemischter Salat', null, 6.00, (SELECT id FROM restaurant)),
('39', 'Dönmez Salat', null, 6.00, (SELECT id FROM restaurant)),
('40', 'Auberginen Salat', null, 6.00, (SELECT id FROM restaurant)),
('41', 'Beilagen Salat', null, 5.00, (SELECT id FROM restaurant)),
('42', 'Italienisch Salat', 'Grüner Salat, Kraut, Zwiebeln, Hirtensalat, Putenschinken, Mozzarella. Gekochter Eier, Oliven Öl', 7.00, (SELECT id FROM restaurant)),
('45', 'Vegetarischer im Brot', 'mit grüner Salat, Krautsalat, Zwiebeln, Tomaten, Auberginen, Käser und Soße', 5.00, (SELECT id FROM restaurant)),
('46', 'Vegetarischer Dürüm', 'mit grüner Salat, Krautsalat, Zwiebeln, Tomaten, Auberginen, Käser und Soße',  5.00, (SELECT id FROM restaurant)),
('47', 'Vegetarischer Teller', 'mit Kartoffeln oder Pommes frites, grüner Salat, Krautsalat. Zwiebeln, Tomaten, Peperoni, Käser und Soße', 7.50, (SELECT id FROM restaurant)),
('48', 'Falafel', 'mit pürierte und gewürzte Kichererbsen, Käse, grüner Salat, Krautsalat, Zwiebeln, Tomaten und Soße', 5.00, (SELECT id FROM restaurant)),
('49', 'Falafel Teller', 'mit Kartoffeln oder Pommes, grüner Salat, Krautsalat, Zwiebeln, Tomaten, Peperoni, Auberginen, Käse und Soße', 8.00, (SELECT id FROM restaurant)),
('50', 'Veganer im Fladenbrot', 'mit grüner Salat, Krautsalat. Zwiebeln, Tomaten, Auberginen und Knoblauch Öl', 5.50, (SELECT id FROM restaurant)),
('51', 'Kalamariteller', 'mit Kartoffeln oder Pommes frites und Salat', 8.50, (SELECT id FROM restaurant)),
('55', 'Knoblauchkartoffeln', 'null', 4.00, (SELECT id FROM restaurant)),
('56', 'Knoblauchkartoffeln Spezial klein', 'mit Drehspießfleisch und Soße', 7.00, (SELECT id FROM restaurant)),
('57', 'Knoblauchkartoffeln Spezial groß', 'mit Drehspießfleisch und Soße', 8.50, (SELECT id FROM restaurant)),
('58', 'Portion Pommes Frites', 'mit Ketchup oder Nayonnaise', 3.90, (SELECT id FROM restaurant)),
('60', 'Pizza Margherita', null, 5.00, (SELECT id FROM restaurant)),
('61', 'Pizza Rindersalami', null, 5.50, (SELECT id FROM restaurant)),
('62', 'Pizza mit Rinderpeperoniwurst', null, 5.50, (SELECT id FROM restaurant)),
('63', 'Pizza Putenschinken', null, 5.50, (SELECT id FROM restaurant)),
('64', 'Pizza mit Champignons', null, 5.00, (SELECT id FROM restaurant)),
('65', 'Pizza mit Knoblauch', 'und Zwiebeln', 5.50, (SELECT id FROM restaurant)),
('66', 'Pizza mit Drehspießfleisch', null, 7.50, (SELECT id FROM restaurant)),
('67', 'Pizza mit Rindersalami', 'und Putenschinken', 6.00, (SELECT id FROM restaurant)),
('68', 'Pizza Mary', 'und Rindersalami, Putenschinken, Champignons', 6.00, (SELECT id FROM restaurant)),
('69', 'Pizza Italia', 'mit Paprika Putenschinken und Ei', 6.50, (SELECT id FROM restaurant)),
('70', 'Pizza Calzone', 'gefüllt mit Rindersalami, Putenschinken und Champignons', 7.00, (SELECT id FROM restaurant)),
('71', 'Pizza Mozzarella', 'mit Tomatenscheiben und Basilikum', 7.00, (SELECT id FROM restaurant)),
('72', 'Pizza Hawaii', 'mit Putenschinken und Ananas', 6.50, (SELECT id FROM restaurant)),
('73', 'Pizza Vier Jahreszeiten', 'mit Putenschinken, Rindersalami, Paprika und Champignons', 7.00, (SELECT id FROM restaurant)),
('74', 'Pizza Tonno', 'mit Thunfisch, Zwiebeln und Knoblauch', 7.50, (SELECT id FROM restaurant)),
('75', 'Pizza Drehspieß-Calzone', 'gefüllt mit Drehspießfleisch, Salat, Zwiebeln, Weißkraut und Knoblauchsoße', 7.50, (SELECT id FROM restaurant)),
('76', 'Pizza Spezial', 'mit Rindersalami, Putenschinken, Champignons und grüner Peperoni', 7.50, (SELECT id FROM restaurant)),
('77', 'Pizza Vegetarisch', 'mit Broccoli, frischen Champignons, Paprika, Zwiebeln, Mais und Oliven', 7.50, (SELECT id FROM restaurant))
;

WITH address AS (
    INSERT INTO address (country, postal_code, city, street, house_number)
        VALUES ('DE', '97076', 'Würzburg', 'Louis-Pasteur-Straße', '5')
    RETURNING id
)
INSERT INTO restaurant(name, telephone, address_id)
SELECT 'Pavillon', '49-931-2700160', id FROM address;

WITH address AS (
    INSERT INTO address (country, postal_code, city, street, house_number)
        VALUES ('DE', '97076', 'Würzburg', 'Nürnberger Straße', '124')
    RETURNING id
)
INSERT INTO restaurant(name, telephone, address_id)
SELECT 'Bacon Bomber', '49-173-5365975', id FROM address;
