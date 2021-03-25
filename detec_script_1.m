clear all

for m=1:20
    fs=25e9; %starting frequency
    for n=1:m
    fs=fs+0.001e9;
    A=detec(fs);
    Aa(n)=A(:,1);
    Af(n)=A(:,2);
    Aa=A(:,1);
    Af=A(:,2);
    
    %B3=rand(100,60)/5;
    B3(Af-80,n+10)=Aa;
    end
    B1=zeros(100-n-20,60);
    B2=zeros(20+n,60-10-n);
    B=[B3 B2;B1]+rand(100,60)/5;
       
    [X,Y]=meshgrid(0:0.5:29.5,80:179);
    [Xq,Yq]=meshgrid(0:0.25:29.5,80:0.125:179);
    Bq=interp2(X,Y,B,Xq,Yq);
    s=surf(Xq,Yq,Bq); c=colorbar; c.Label.String = 'Amplitude, V';
    xlabel('Time, ms  (starting from 5ms)','FontSize',16,'FontWeight','bold'); 
    ylabel('Frequency, MHz','FontSize',16,'FontWeight','bold');
    %show slowed motion of frequency increasing
    set(s,'linestyle','none');
    view(2);
    %hold on
    pause(0.1)
    
end
    
