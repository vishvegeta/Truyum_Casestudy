

insert into truyum.menu_items values( 'Sandwich', 99.00, 'Yes', '2017-03-15', 'Main Course', 'Yes');
insert into truyum.menu_items values( 'Burger', 129.00, 'Yes', '2017-12-23', 'Main Course', 'No');
insert into truyum.menu_items values( 'Pizza', 149.00, 'Yes', '2017-08-21', 'Main Course', 'No');
insert into truyum.menu_items values( 'French Fries', 57.00, 'No', '2017-07-02', 'Starters', 'Yes');
insert into truyum.menu_items values( 'Chocolate Brownie', 32.00, 'Yes', '2022-11-02', 'Dessert', 'Yes');
GO

SELECT * FROM truyum.menu_items
GO


SELECT * from truyum.menu_items where mnu_active= 'Yes' and DATEDIFF(year,mnu_date_of_launch, getdate())>=0;
GO



CREATE PROCEDURE get_menu_items(@mnu_id int)
As BEGIN
select * from truyum.menu_items where mnu_id=@mnu_id
END
GO

EXEC get_menu_items @mnu_id = 1;
GO

UPDATE truyum.menu_items set mnu_name='milk shake', mnu_price=108, mnu_active='Yes', mnu_date_of_launch='2017-12-23', mnu_category='Dessert',mnu_free_delivery='No' where mnu_id=5;
GO

insert into truyum.[user] values(101, 'Vinoo');
insert into truyum.[user] values(102, 'Manohar');
select * from truyum.[user];
GO

insert into truyum.cart values(1001, 102, 1);
insert into truyum.cart values(1002, 102, 2);
insert into truyum.cart values(1004, 102, 3);
insert into truyum.cart values(1005, 102, 4);
GO

SELECT c.crt_usr_id,mi.mnu_name,mi.mnu_price,mi.mnu_category from truyum.menu_items mi
INNER join truyum.cart c on crt_mnu_id=mnu_id where crt_usr_id=102;
GO


CREATE PROCEDURE user_cart_detials (@user int)
AS BEGIN
SELECT c.crt_usr_id,mi.mnu_name,mi.mnu_price,mi.mnu_category from truyum.menu_items mi
INNER join truyum.cart c on crt_mnu_id=mnu_id where crt_usr_id=@user;
END


EXEC user_cart_detials @user=102
GO


CREATE PROCEDURE total_price @user_id INT
AS BEGIN
select SUM(mi.mnu_price) as 'Total Price'from truyum.menu_items mi 
INNER join truyum.cart on crt_mnu_id=mnu_id where crt_usr_id=@user_id
END
go


EXEC user_cart_detials @user=102
GO

EXEC total_price @user_id=102
GO



CREATE PROCEDURE delete_cart_items @user_id int , @menu_item_no INT
AS BEGIN
DELETE from truyum.cart where crt_usr_id=@user_id and crt_mnu_id=@menu_item_no
END


EXEC delete_cart_items @user_id=102, @menu_item_no=1
GO




