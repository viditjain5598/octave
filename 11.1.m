clc; clear all; close all;
M=17; tau=(M-1)/2;
n=0:M-1;
Fc=1000; Ft=5000;
wc=(2*pi*Fc)/Ft;
hd=(sin(wc*(n-tau)))./(pi*(n-tau));
hd(tau+1)=0.4;
wrect=ones(1,M);
h=hd.*wrect;
w=0:0.01:pi;
Hw=freqz(h,1,w);
MagHw=abs(Hw);
HwdB=20*log(MagHw/max(MagHw));
subplot(221); stem(n,hd,'filled');
axis([-1 M -0.15 0.5]);
xlabel('n'); ylabel('hd(n)');
title('Ideal Impulse Response');
subplot(222); stem(n,hd,'filled');
axis([-1 M -0.15 0.5]);
xlabel('n'); ylabel('w(n)');
title('Rectangular window');
subplot(223); stem(n,h,'filled');
axis([-1 M -0.1 1.2]);
xlabel('n'); ylabel('h(n)');
title('Actual Impulse Response');
subplot(224); plot(w/pi, HwdB);
xlabel('freq'); ylabel('dB');
title('Magnitude Response');