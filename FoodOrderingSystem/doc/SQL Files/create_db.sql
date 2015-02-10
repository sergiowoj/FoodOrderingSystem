CREATE TABLE CUSTOMER(
		CustomerID			Int				NOT NULL,
		FirstName 			Char(25)		NOT NULL,
		LastName			Char(25)		NOT NULL,
		Phone				Char(12)		NOT NULL,
		Phone2				Char(12)		NULL,
		Email				Char(50)		NOT NULL,
		Password			Char(255)		NOT NULL,
		Address1			Char(100)		NOT NULL,
		Address2			Char(100)		NULL,
		City				Char(50)		NOT NULL,
		Province			Char(50)		NOT NULL,
		Zip					Char(6)			NOT NULL,
		CONSTRAINT			CustomerPK		PRIMARY KEY(CustomerID)
		);

CREATE TABLE COOK(
		CookID				Int				NOT NULL IDENTITY (1, 1),
		FirstName 			Char(25)		NOT NULL,
		LastName			Char(25)		NOT NULL,
		Phone				Char(12)		NOT NULL,
		Email				Char(100)		NULL,
		CONSTRAINT			CookPK		PRIMARY KEY(CookID)
		);

CREATE TABLE DELIVERY_GUY(
		DeliveryID			Int				NOT NULL IDENTITY (1, 1),
		FirstName 			Char(25)		NOT NULL,
		LastName			Char(25)		NOT NULL,
		Phone				Char(12)		NOT NULL,
		Email				Char(100)		NULL,
		CONSTRAINT			DeliveryPK		PRIMARY KEY(DeliveryID)
		);

CREATE TABLE ITEM(
		ItemID			Int				NOT NULL,
		Name			Char (50)		NOT NULL,
		Price			Decimal(3,2)	NULL,
		Description		Varchar(500)	NULL,
		CONSTRAINT		ItemPK	PRIMARY KEY(ItemID)
		);
		
CREATE TABLE INVOICE_ITEM(
		Id				Int				NOT NULL,
		InvoiceID		Int				NOT NULL,
		ItemID			Int				NOT NULL,
		Quantity		Int				NOT NULL,
		CONSTRAINT		Invoice_ItemPK	PRIMARY KEY(Id)
		);

CREATE TABLE STAGE(
		StageID			Int				NOT NULL,
		Stage			Char (50)		NOT NULL,
		CONSTRAINT		StagePK		PRIMARY KEY(StageID)
		);


CREATE TABLE INVOICE(
		InvoiceID			Int				NOT NULL,
		DateIn				Date			NOT NULL,
		DateOut				Date			NULL,
		TotalAmount			Decimal(5,2)	NULL,
		CustomerID			Int				NOT NULL,
		CookID				Int				NULL,
		DeliveryID			Int				NULL,
		StageID				Int				NOT NULL,
		CONSTRAINT			InvoicePK			PRIMARY KEY (InvoiceID)
		);


/********************************************************************************/





