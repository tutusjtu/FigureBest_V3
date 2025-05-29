close all
figure(1)
x = 0:2:20;
plot(x,40+x.^1.5,x,20-x.^1.8,x,-5-x,x,x.^0.9)
axis([0 22 -250 180])

figure(2)
bar([8 3 4;2 4 2; 3 1 1])

figure(3)

scatter(randn(100,1),randn(100,1))
hold on
scatter(2+randn(100,1),1+randn(100,1))
scatter(3+randn(100,1),3+randn(100,1))

figure(4)
surf(peaks)


