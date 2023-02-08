/*
Используя базу данных carsshop создайте функцию для нахождения минимального возраста клиента, 
затем сделайте выборку всех машин, которые он купил.
*/

DELIMITER //
USE carsshop;
//

CREATE FUNCTION MinAge() 
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    RETURN (SELECT MIN(cl.age) FROM clients cl 
        INNER JOIN orders o ON cl.id = o.client_id
	INNER JOIN cars c ON c.id = o.car_id
        INNER JOIN marks m ON c.mark_id = m.id);
END
//

SELECT MinAge(), cl.name, m.mark
FROM clients cl 
        INNER JOIN orders o ON cl.id = o.client_id
	INNER JOIN cars c ON c.id = o.car_id
        INNER JOIN marks m ON c.mark_id = m.id
WHERE cl.age = MinAge();
//
