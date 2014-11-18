# how to create a table with a primary key and a foreign key
CREATE TABLE products (
  pid int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  price int(255) DEFAULT NULL,
  description text,
  catid int(11) DEFAULT NULL,
  PRIMARY KEY (pid),
  FOREIGN KEY (catid) REFERENCES pcategories(catid)
);

# how to alter a table to add a foreign key after creation
ALTER TABLE login ADD FOREIGN KEY (email) REFERENCES users(email);

# how to alter a table to add a primary key after creation
ALTER TABLE postcodes ADD PRIMARY KEY (zip);

# how to alter a table to add a unique key after creation
ALTER TABLE users ADD UNIQUE (email);