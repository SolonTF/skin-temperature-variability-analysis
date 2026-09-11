% Code for calculation of memory lenghth and KullbackLeibler divergence
% based on PLoS One. 2013 Sep 5;8(9):e72854. Modified by ARM 15 Feb 2016

clear all
close all
clc

load("data.mat")

first=3601;
last=7200;

tic
R =1;% R is number of repeat for calculation of the memory length in a given time-series
T = 300; % The length of search for finding rare events for longer time-sereis select 1000
Levels = (0.5:0.5:3); % Levels for definition of rare events. Here from 0.5 x sigma till 3 x sigma
Num = 20; % Num is the number of shuffles for making inverse distribution function for shuffled data

sl=size(Levels);
U1= NaN(sl(1,2), T);% To draw inverse distribution function
U2= NaN(sl(1,2), T);% To draw inverse distribution function in shuffled

for participant=1:24

skintemp= Data{participant}(first:last,2);    
N = length(skintemp); 




% data normalization 
skintemp = diff(skintemp);
    skintemp=skintemp-mean(skintemp);
    skintemp=skintemp./std(skintemp);
    skintemp = cumsum(skintemp);
   
for jj=1:R;



ip = 0;
for p = Levels
    ip = ip+1;
    
    a1 = zeros(1, T);    
    a2 = zeros(Num, T);
    
        B = skintemp;

        A = diff(B);
        L = 0+p;
    
        et = zeros(T, 1);
        for i = 1:N-1
            t = find(-B(i+1:end)+ B(i) >= L, 1);
            if  ~isempty(t) && (t <= T)
                et(t) = et(t)+1;
            end;  
        end;    

        a = et';
        if sum(a)>0    
            a1 = a./sum(a);
        else
            a1 = zeros(T, 1);
        end;
    
    for LL = 1:Num

        B = skintemp;
        B = diff(B);
        N = length(B);
        B = B(randperm(N-1));
        B = [B(1); cumsum(B)];
        et = zeros(T, 1);
        for i = 1:N-1
            t = find(-B(i+1:end)+ B(i) >= L, 1);
            if ~isempty(t) && (t <= T)
                et(t) = et(t)+1;
            end;
        end;

        a = et';
        a2(LL, :) = a./sum(a);

        
    end;

a1smooth = smooth(a1)';
u2=mean(a2);
U1(ip,:)=a1smooth (1,:);
U2(ip,:)=u2(1,:);

% Calculaation of memory length
S = sign(mean(a2)-a1smooth);%S = sign(mean(a2)-a1); This was the original code but I chnaged it to use the smooth line for estimation of Memory lengt
S(1,T) = -1;
Memlength(ip, jj) = find(S(4:end)<0, 1, 'first') + 3;

% Calculation of KullbackLeibler divergence
a1(u2==0) = 0;
u2(u2==0) = 1;
a11 = a1;
a11(a11==0) = 1;
KL(ip, jj) = sum(a1.*log(a11./u2));
     
end;
 
end


KL_mean = mean(KL');
ML_mean = mean(Memlength');


% Store cooling distributions for this participant
U1_all_cooling(participant,:,:) = U1;
U2_all_cooling(participant,:,:) = U2;

KL_mean_cooling(participant,:) = mean(KL');
ML_mean_cooling(participant,:) = mean(Memlength');


end


toc

% Average cooling memory graphs for shuffled and real data

figure('Position',[100 100 1400 900])

for x = 1:6

    AverageOriginalCooling = NaN(1,300);

    AverageShuffledCooling = NaN(1,300);

    for y = 1:300

        AverageOriginalCooling(y) = median(U1_all_cooling(1:24,x,y), 'omitnan');

        AverageShuffledCooling(y) = median(U2_all_cooling(1:24,x,y), 'omitnan');

    end

    xaxis = 1:300;

    subplot(3,2,x)

    plot(xaxis, AverageOriginalCooling, '.-', 'DisplayName', 'Original')
    hold on
    plot(xaxis, AverageShuffledCooling, '.-r', 'DisplayName', 'Shuffled')
    hold off

    set(gca, 'XScale', 'log')

    xlabel('Exit time / seconds')

    ylabel('Average probability')

    title(['Average curve at ', num2str(Levels(x)), '\sigma'])

    legend('show')

end

sgtitle('Median cooling inverse-statistics curves across 24 participants')
saveas(gcf, ['InverseStatistics_sigma_CoolingEvents_24Participants.png'])