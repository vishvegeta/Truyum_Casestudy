
Create SCHEMA [truyum]
GO

CREATE TABLE [truyum].[user]
(
    [usr_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [usr_name] NVARCHAR(50) NOT NULL,
    --[ColumnName3] NVARCHAR(50) NOT NULL
    -- Specify more columns here
);
GO

CREATE TABLE [truyum].[menu_items]
(
    [mnu_id] INT identity(1,1) PRIMARY KEY,
    [mnu_name] VARCHAR(100) NULL,
    [mnu_price] DECIMAL(8,2) NULL,
    [mnu_active] VARCHAR(3) NULL,
    [mnu_date_of_launch] DATE NULL,
    [mnu_category] VARCHAR(45) NULL,
    [mnu_free_delivery] VARCHAR(3) NULL,

);
GO

CREATE TABLE [truyum].[cart] (
    [crt_id] INT NOT NULL PRIMARY KEY,
    [crt_usr_id] INT NULL,
    [crt_mnu_id] INT NULL, 
    INDEX [crt_usr_fk_idx] ([crt_usr_id] ASC),
    INDEX [crt_mnu_fk_idx] ([crt_mnu_id] ASC),
    CONSTRAINT [crt_usr_fk] FOREIGN KEY ([crt_usr_id]) 
    REFERENCES [truyum].[user] ([usr_id]) 
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT [crt_mnu_fk] FOREIGN KEY ([crt_mnu_id]) 
    REFERENCES [truyum].[menu_items] ([mnu_id]) 
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
GO



