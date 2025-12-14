

/* - data.sql for tranika
**
**  Creates sql code to generate sample data for the tranika store
*/

/* truncate tables: */
DELETE tranika_dept_prod 
GO
DELETE tranika_dept 
GO
DELETE tranika_variant 
GO
DELETE tranika_attr_door 
GO
DELETE tranika_attr_toilet 
GO
DELETE tranika_attr_floor 
GO
DELETE tranika_product 
GO
DELETE tranika_receipt 
GO
DELETE tranika_receipt_item 
GO
DELETE tranika_basket 
GO
DELETE tranika_shopper 
GO



INSERT INTO tranika_dept VALUES (
	1,
	'dept name 1',
	'dept description 1'
) 
GO

INSERT INTO tranika_dept VALUES (
	2,
	'dept name 2',
	'dept description 2'
) 
GO

INSERT INTO tranika_dept VALUES (
	3,
	'dept name 3',
	'dept description 3'
) 
GO

INSERT INTO tranika_dept VALUES (
	4,
	'dept name 4',
	'dept description 4'
) 
GO

INSERT INTO tranika_product VALUES (
	'001',
	'product name 1',
	'product description 1',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	1,
	'001'
)  
GO

INSERT INTO tranika_product VALUES (
	'002',
	'product name 2',
	'product description 2',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	1,
	'002'
)  
GO

INSERT INTO tranika_product VALUES (
	'003',
	'product name 3',
	'product description 3',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	1,
	'003'
)  
GO

INSERT INTO tranika_product VALUES (
	'004',
	'product name 4',
	'product description 4',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	1,
	'004'
)  
GO

INSERT INTO tranika_product VALUES (
	'005',
	'product name 5',
	'product description 5',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	2,
	'005'
)  
GO

INSERT INTO tranika_product VALUES (
	'006',
	'product name 6',
	'product description 6',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	2,
	'006'
)  
GO

INSERT INTO tranika_product VALUES (
	'007',
	'product name 7',
	'product description 7',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	2,
	'007'
)  
GO

INSERT INTO tranika_product VALUES (
	'008',
	'product name 8',
	'product description 8',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	2,
	'008'
)  
GO

INSERT INTO tranika_product VALUES (
	'009',
	'product name 9',
	'product description 9',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	3,
	'009'
)  
GO

INSERT INTO tranika_product VALUES (
	'010',
	'product name 10',
	'product description 10',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	3,
	'010'
)  
GO

INSERT INTO tranika_product VALUES (
	'011',
	'product name 11',
	'product description 11',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	3,
	'011'
)  
GO

INSERT INTO tranika_product VALUES (
	'012',
	'product name 12',
	'product description 12',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	3,
	'012'
)  
GO

INSERT INTO tranika_product VALUES (
	'013',
	'product name 13',
	'product description 13',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	4,
	'013'
)  
GO

INSERT INTO tranika_product VALUES (
	'014',
	'product name 14',
	'product description 14',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	4,
	'014'
)  
GO

INSERT INTO tranika_product VALUES (
	'015',
	'product name 15',
	'product description 15',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	4,
	'015'
)  
GO

INSERT INTO tranika_product VALUES (
	'016',
	'product name 16',
	'product description 16',
	1099,
	'product.gif',
	128,
	128,
	999,
	'19970411',
	'19980411',
    1,
    10
)
GO

INSERT INTO tranika_dept_prod VALUES (
	4,
	'016'
)  
GO

INSERT INTO tranika_attr_door VALUES (
	1,
	'door 1'
) 
GO

INSERT INTO tranika_attr_door VALUES (
	2,
	'door 2'
) 
GO

INSERT INTO tranika_attr_door VALUES (
	3,
	'door 3'
) 
GO

INSERT INTO tranika_attr_door VALUES (
	4,
	'door 4'
) 
GO

INSERT INTO tranika_attr_toilet VALUES (
	1,
	'toilet 1'
) 
GO

INSERT INTO tranika_attr_toilet VALUES (
	2,
	'toilet 2'
) 
GO

INSERT INTO tranika_attr_toilet VALUES (
	3,
	'toilet 3'
) 
GO

INSERT INTO tranika_attr_toilet VALUES (
	4,
	'toilet 4'
) 
GO

INSERT INTO tranika_attr_floor VALUES (
	1,
	'floor 1'
) 
GO

INSERT INTO tranika_attr_floor VALUES (
	2,
	'floor 2'
) 
GO

INSERT INTO tranika_attr_floor VALUES (
	3,
	'floor 3'
) 
GO

INSERT INTO tranika_attr_floor VALUES (
	4,
	'floor 4'
) 
GO

INSERT INTO tranika_variant VALUES (
	'001-001',
	'001',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'001-002',
	'001',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'001-003',
	'001',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'001-004',
	'001',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'002-001',
	'002',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'002-002',
	'002',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'002-003',
	'002',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'002-004',
	'002',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'003-001',
	'003',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'003-002',
	'003',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'003-003',
	'003',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'003-004',
	'003',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'004-001',
	'004',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'004-002',
	'004',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'004-003',
	'004',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'004-004',
	'004',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'005-001',
	'005',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'005-002',
	'005',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'005-003',
	'005',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'005-004',
	'005',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'006-001',
	'006',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'006-002',
	'006',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'006-003',
	'006',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'006-004',
	'006',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'007-001',
	'007',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'007-002',
	'007',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'007-003',
	'007',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'007-004',
	'007',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'008-001',
	'008',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'008-002',
	'008',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'008-003',
	'008',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'008-004',
	'008',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'009-001',
	'009',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'009-002',
	'009',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'009-003',
	'009',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'009-004',
	'009',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'010-001',
	'010',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'010-002',
	'010',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'010-003',
	'010',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'010-004',
	'010',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'011-001',
	'011',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'011-002',
	'011',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'011-003',
	'011',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'011-004',
	'011',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'012-001',
	'012',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'012-002',
	'012',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'012-003',
	'012',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'012-004',
	'012',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'013-001',
	'013',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'013-002',
	'013',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'013-003',
	'013',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'013-004',
	'013',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'014-001',
	'014',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'014-002',
	'014',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'014-003',
	'014',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'014-004',
	'014',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'015-001',
	'015',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'015-002',
	'015',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'015-003',
	'015',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'015-004',
	'015',
	1,
	1,
	4
) 
GO

INSERT INTO tranika_variant VALUES (
	'016-001',
	'016',
	1,
	1,
	1
) 
GO

INSERT INTO tranika_variant VALUES (
	'016-002',
	'016',
	1,
	1,
	2
) 
GO

INSERT INTO tranika_variant VALUES (
	'016-003',
	'016',
	1,
	1,
	3
) 
GO

INSERT INTO tranika_variant VALUES (
	'016-004',
	'016',
	1,
	1,
	4
) 
GO

