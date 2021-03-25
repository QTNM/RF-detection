function S=detec(f1)
Fs=5e11; %sampling frequency
T=1/Fs;  %sampling period;

L=500000; %length of the signal, longer length produce better frequency approximations.
t=(1:L-1)*T;  %time vector

A1=1;  % amplitude 1
A2=1;  % amplitude 2

%f1=25e9; %cyclotron radiation frquency 25GHz
f2=24.9e9;  %mixer frequency
x1=A1*sin(2*pi*f1*t);  %cyclotron wave
x2=A2*sin(2*pi*f2*t);  %mixer wave

ym=x1.*x2;                 %signal after mixing 
y=3*ym+5*randn(size(t));   %random noise + 10dB amplification (amplitude amplifier)

ys=fft(y);   %fft to frequency domain

%%compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L.
Y2=abs(ys/L);  %two-sided
Y1=Y2(1:L/2+1);
Y1(2:end-1)=2*Y1(2:end-1);  %single sided

f=Fs*(0:(L/2))/L; %define frequency domain
%plot(f,Y1); %plot frequency domain single sided amp[litude sepctrum.

%%%finding the in-phase component after the mixing
M=max(Y1(1:1000));  %maximum in phase amplitude
d=find(Y1==M);
fip=f(d);  %find the in-phase freuqency
ff=fip/1e6;  %change unit to MHz
S=[M,ff];






