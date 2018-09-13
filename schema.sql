DROP DATABASE IF EXISTS bamazon;
CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (
	item_id INT NOT NULL,
    product_name varchar (30) NOT NULL,
    department_name varchar (30) NOT NULL,
    price INT NOT NULL, 
    stock_quantity INT,
    PRIMARY KEY (item_id)
)

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
	VALUES (169, 'macbook', 'electronics', 1200, 16); 
    
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
	VALUES (249, 'cutting board', 'kitchen', 8, 76); 
    
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
	VALUES (145, 'xbox', 'electronics', 350, 4); 
    
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
	VALUES (342, 'comforter', 'bedding', 120, 7); 
    
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
	VALUES (290, 'knife set', 'kitchen', 50, 10); 
    
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
	VALUES (129, 'television', 'electronics', 800, 8); 
    
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
	VALUES (328, 'matress topper', 'bedding', 130, 13); 
    
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
	VALUES (576, 'legos', 'toys', 50, 34); 
    
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
	VALUES (532, 'barbie', 'toys', 20, 9); 
    
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
	VALUES (153, 'headphones', 'electronics', 300, 4); 

SELECT * from products