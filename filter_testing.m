%Chebyshev Type 1

f = 435e6; % Middle of 70cm Band
bw = 50e3; % 20 kHz Bandwidth

passband_ripple = 0.5; % in dB
order = 4;

lower_edge = f - bw/2;
upper_edge = f + bw/2;

[z1,p1,k1]  = cheby1(order, passband_ripple, [2*pi*lower_edge, 2*pi*upper_edge], 's');
[b1,a1] = zp2tf(z1,p1,k1);
[h1,w1] = freqs(b1,a1,10000000);

plot(w1/(2e6*pi),mag2db(abs(h1)))
axis([434.9 435.1 -20 0])
grid
xlabel('Frequency (Mhz)')
ylabel('Attenuation (dB)')
%legend('cheby1','cheby2','ellip')
