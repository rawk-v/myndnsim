function[x,y]=cal(start,m_end,phase)


x=start:0.01:m_end;
for i=1:numel(x)
    y(i)=cos(x(i)+phase);
end
end
