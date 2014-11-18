# connection
# hostname: 127.0.0.1
# username: root
# password: mysql
# database: webshop

# get categories
SELECT * FROM pcategories;

# get products
SELECT * FROM products 
WHERE catid = "{filterCat}" || "{filterCat}" = "all" 
ORDER BY {sortOrder};

# register user
INSERT INTO users (fname, lname, email) VALUES ({fname}, {lname}, {email});

# get user
SELECT * FROM users WHERE email={email};

# register password
INSERT INTO login (email, password) VALUES ({email}, {password});

# login user
SELECT users.uid, users.fname, users.lname, users.email FROM users, login WHERE login.email={email} AND login.password={password} AND users.email=login.email;