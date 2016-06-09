function[]=draw(ditch)

plot(1:50,ditch(1,:),'ro-')
hold on
plot(1:50,ditch(2,:),'k+-.')
plot(1:50,ditch(3,:),'bx--')
xlabel('流行度')
ylabel('PIT丢包率')




end