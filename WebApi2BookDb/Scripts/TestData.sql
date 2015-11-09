declare @statusId int,
	@taskId int,
	@userId int

if not exists (select * from [User] where UserName = 'bhogg')
	INSERT into [dbo].[User] ([FirstName], [LastName], [UserName])
		VALUES (N'Boss', N'Hoog', N'bhogg')

if not exists (select * from [User] where UserName = 'jbob')
	INSERT into [dbo].[User] ([FirstName], [LastName], [UserName])
		VALUES (N'Jim', N'Bob', N'jbob')

if not exists (select * from [User] where UserName = 'jdoe')
	INSERT into [dbo].[User] ([FirstName], [LastName], [UserName])
		VALUES (N'John', N'Doe', N'jdoe')

if not exists (select * from dbo.Task where Subject = 'Test Task')
begin
	select top 1 @statusId = StatusId from Status order by StatusId;
	select top 1 @userId = UserId from [User] order by UserId;

	insert into dbo.Task(Subject, StartDate, StatusId, CreatedDate, CreatedUserId)
		values('Test Task', getdate(), @statusId, getdate(), @userId);

	set @taskId = SCOPE_IDENTITY();

	INSERT [dbo].[TaskUser] ([TaskId], [UserId])
		VALUES (@taskId, @userId)
end
