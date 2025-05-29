% test for GUI
close all;clc
figure
plot(magic(4));
axis([1 4 0 20])

figure
x = 0:0.5:20;
plot(x,40+x.^1.5,x,20-x.^1.8,x,-5-x,x,x.^0.9)
axis([0 22 -250 180])

figure
bar([6 3 4;2 4 2; 3 1 1]);
axis([0 4 0 7])

figure
subplot(211)
Y = plot(magic(4));
subplot(212)
bar(magic(4));

figure
subplot(221)
b = bar([2 4 6; 3 4 5;6 7 8]);
axis([0 4 0 9])
subplot(222)
plot(magic(4));
axis([1 4 0 20])
subplot(223)
plot([1 2 3 4;4 5 7 1]);
subplot(224)
b = bar([2 4 6; 3 4 5;6 7 8]);
axis([0 4 0 9])

figure
b = bar3([4 64 30 6; 3 5 6 20;6 7 8 15]);

figure
subplot(2,2,[1 2])
x = randn(1000,1);
nbins = 50;
hist(x,nbins)
subplot(223)
scatter(randn(100,1),randn(100,1))
hold on
scatter(2+randn(100,1),1+randn(100,1))
scatter(3+randn(100,1),3+randn(100,1))
subplot(224)
surf(peaks)


