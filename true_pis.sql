create function true_pis(@pis varchar(20)) returns varchar(20) as
begin
declare @Iteration Integer = 1,  
@x varchar(1),
@total Integer = 0,
@verificador Integer = 0

if substring(@pis,1, 1) = 'd'
	set @pis = SUBSTRING(@pis, 2, LEN(@pis))
if LEN(@pis) < 11
	set @pis = replicate('0', 11 - len(@pis)) + @pis
 
WHILE @Iteration < LEN(@pis)  
	begin
		set @x = substring(@pis,@Iteration, 1);
		If @Iteration = 1 
			begin
				set @total = @total + (@x * 3)
			end
		else if @Iteration = 2
			begin
				set @total = @total + (@x * 2)
			end
		else
			begin
				set @total = @total + (@x * (10 + 2 - @Iteration))
			end
		SET @Iteration += 1  
	end;
	if @total%11 < 2
		set @verificador = 0
	else if @total%11 >= 2
		set @verificador =  11 - (@total%11)
		
	if @verificador = substring(@pis,LEN(@pis), 1)
		return 'PIS valido'
	else 
		return '!!!!PIS invalido!!!!'
		
	return 'error'
end;