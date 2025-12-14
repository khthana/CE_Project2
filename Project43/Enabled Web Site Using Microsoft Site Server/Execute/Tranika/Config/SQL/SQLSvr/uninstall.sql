

/* - uninstall.sql for tranika
**
**  Unloads tables created by the Wizard for the Tranika store
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


