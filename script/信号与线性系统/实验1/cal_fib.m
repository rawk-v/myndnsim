function[y,result]=cal_fib(i)
  if i<=2 y=1;
  else y=cal_fib(i-1)+(i-2);   
  end
   if y>10000
      result=y;
      end
end
