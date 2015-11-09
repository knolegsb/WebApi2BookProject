CREATE TABLE [dbo].[User](
	[UserId]    BIGINT   IDENTITY (1, 1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOt NULL,
	[UserName] NVARCHAR(50) NOT NULL,
	[ts] [rowversion] NOT NULL,
	CONSTRAINT [PK_User] PRIMARY KEY ([UserId])
);