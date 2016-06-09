function[lamda]=cal_lamda(interest)
sum_tmp=0;
for i=1:numel(interest)
    sum_tmp=sum_tmp+interest(i);
end
lamda=sum_tmp;
end
    