declare function subops(integer,integer) as integer
dim x as long
dim y as long

loop
	input x
	input y
	print subops(x,y)
end loop

function subops(p1,p2)
return p1-p2
end function

