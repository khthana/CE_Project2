

/* - schema.sql for Tranika
**
**  Creates the schema for the Tranika store
*/

/* drop existing tables: */
if exists (SELECT * FROM sysobjects WHERE id = object_id('tranika_dept_prod') and sysstat & 0xf = 3)
    DROP TABLE tranika_dept_prod 
GO
if exists (SELECT * FROM sysobjects WHERE id = object_id('tranika_dept') and sysstat & 0xf = 3)
    DROP TABLE tranika_dept 
GO
if exists (SELECT * FROM sysobjects WHERE id = object_id('tranika_variant') and sysstat & 0xf = 3)
    DROP TABLE tranika_variant 
GO
if exists (SELECT * FROM sysobjects WHERE id = object_id('tranika_attr_door') and sysstat & 0xf = 3)
    DROP TABLE tranika_attr_door 
GO
if exists (SELECT * FROM sysobjects WHERE id = object_id('tranika_attr_toilet') and sysstat & 0xf = 3)
    DROP TABLE tranika_attr_toilet 
GO
if exists (SELECT * FROM sysobjects WHERE id = object_id('tranika_attr_floor') and sysstat & 0xf = 3)
    DROP TABLE tranika_attr_floor 
GO
if exists (SELECT * FROM sysobjects WHERE id = object_id('tranika_product') and sysstat & 0xf = 3)
    DROP TABLE tranika_product 
GO
if exists (SELECT * FROM sysobjects WHERE id = object_id('tranika_receipt') and sysstat & 0xf = 3)
    DROP TABLE tranika_receipt 
GO
if exists (SELECT * FROM sysobjects WHERE id = object_id('tranika_receipt_item') and sysstat & 0xf = 3)
    DROP TABLE tranika_receipt_item 
GO
if exists (SELECT * FROM sysobjects WHERE id = object_id('tranika_basket') and sysstat & 0xf = 3)
    DROP TABLE tranika_basket 
GO
if exists (SELECT * FROM sysobjects WHERE id = object_id('tranika_shopper') and sysstat & 0xf = 3)
    DROP TABLE tranika_shopper 
GO

CREATE TABLE tranika_product(
    pf_id VARCHAR(100) NOT NULL,
    name VARCHAR(255) NULL,
    description VARCHAR(255) NULL,
    list_price INT NULL,
    image_file VARCHAR(255) NULL,
    image_width INT NULL,
    image_height INT NULL,
    sale_price INT NULL,
    sale_start DATETIME NULL,
    sale_end DATETIME NULL,
    tax_vat_included TINYINT NULL,
    tax_vat_rate REAL NULL,
    PRIMARY KEY (pf_id)
) 
GO

CREATE TABLE tranika_dept (
    dept_id INT NOT NULL,
    dept_name VARCHAR(255) NULL,
    dept_description VARCHAR(255) NULL,
    PRIMARY KEY (dept_id)
) 
GO

CREATE TABLE tranika_dept_prod (
    dept_id INT NOT NULL, 
    pf_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (dept_id, pf_id),
    FOREIGN KEY (dept_id) REFERENCES tranika_dept,
    FOREIGN KEY (pf_id) REFERENCES tranika_product
) 
GO

CREATE TABLE tranika_attr_door (
    door_id INT NOT NULL,
    door_value VARCHAR(50) NULL,
    PRIMARY KEY(door_id),
    UNIQUE(door_value)
) 
GO
CREATE TABLE tranika_attr_toilet (
    toilet_id INT NOT NULL,
    toilet_value VARCHAR(50) NULL,
    PRIMARY KEY(toilet_id),
    UNIQUE(toilet_value)
) 
GO
CREATE TABLE tranika_attr_floor (
    floor_id INT NOT NULL,
    floor_value VARCHAR(50) NULL,
    PRIMARY KEY(floor_id),
    UNIQUE(floor_value)
) 
GO

CREATE TABLE tranika_variant(
    sku VARCHAR(100) NOT NULL, 
    pf_id VARCHAR(100) NOT NULL, 
    attr_door INT NOT NULL, 
    attr_toilet INT NOT NULL, 
    attr_floor INT NOT NULL, 
    PRIMARY KEY(sku),
    UNIQUE (pf_id, attr_door, attr_toilet, attr_floor),
    FOREIGN KEY (pf_id) REFERENCES tranika_product,
    FOREIGN KEY (attr_door) REFERENCES tranika_attr_door(door_id),
    FOREIGN KEY (attr_toilet) REFERENCES tranika_attr_toilet(toilet_id),
    FOREIGN KEY (attr_floor) REFERENCES tranika_attr_floor(floor_id)
) 
GO


CREATE TABLE tranika_basket(
    shopper_id        CHAR(32) NOT NULL,
    date_changed      DATETIME NOT NULL,
    marshalled_basket IMAGE NOT NULL,
    PRIMARY KEY (shopper_id)
) 
GO

CREATE TABLE tranika_shopper(
    shopper_id   CHAR(32) NOT NULL,
    date_created DATETIME NOT NULL,
    name         VARCHAR(100) NULL,
    password     VARCHAR(100) NULL,
    address1     VARCHAR(100) NULL,
    address2     VARCHAR(100) NULL,
    address3     VARCHAR(100) NULL,
    address4     VARCHAR(100) NULL,
    country      VARCHAR(100) NULL,  
    phone        VARCHAR(100) NULL,  
    email        VARCHAR(100) UNIQUE NOT NULL,
    PRIMARY KEY (shopper_id)
) 
GO 

CREATE TABLE tranika_receipt (
    order_id     CHAR(26) NOT NULL,
    shopper_id   CHAR(32)  NOT NULL,
    total        INT NULL,
    status       INT NULL,
    date_entered DATETIME NULL,
    date_changed DATETIME NULL,
    marshalled_receipt IMAGE NULL,
    PRIMARY KEY (order_id)
) 
GO

CREATE TABLE tranika_receipt_item(
    order_id       CHAR(26) NOT NULL,
    row_id         INT NOT NULL,
    sku            VARCHAR(100) NULL,
    quantity       INT NOT NULL,
    adjusted_price INT NOT NULL,
    PRIMARY KEY (order_id, row_id)
) 
GO