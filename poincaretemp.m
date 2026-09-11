%plot the Poincare plot of 1 hour temperature time-series 
% to calculate SD1 and SD2 of the Poincare plot.

clc
close all
clear all



first=3601; % start from 3601 second (ignoring the first hour)
last=7200; % end at second hour so total duration of our time sereis is 1 hour

extendedlag= 1;

SD1SD2matrixtemp=NaN(24,2);

load('Data.mat')

 for i=1:24
        

    Participant=Data{i};
    
    Temp =Participant(first:last,2); % Skin temp

    storeaveragetemperature(i,1)= mean(Temp); %For excel
    storestdtemp(i,1)=std(Temp); %For excel

    Tbeforescaled{i}(:,1) = [Temp];
    
    Tempx{i} = Tbeforescaled{i}(1:end- extendedlag);
    Tempy{i} = Tbeforescaled{i}(1+extendedlag:end);
    
    sd1temp{i} = std(Tempy{i} - Tempx{i})/ sqrt(2); %https://uk.mathworks.com/matlabcentral/answers/24958-poincare-plot-for-hrv
    sd2temp{i} = std(Tempy{i} + Tempx{i})/ sqrt(2); %Amar et al. SD2>SD1 variability more long-term than short

SD1SD2matrixtemp(i,1)=sd1temp{i};
SD1SD2matrixtemp(i,2)=sd2temp{i};


%Do for the other 3 variables to compare

    
    SPO2 =Participant(first:last,3); % Skin temp

    storeaveragespo2(i,1)= mean(SPO2); %For excel
    storestdspo2(i,1)=std(SPO2); %For excel

    SPO2beforescaled{i}(:,1) = [SPO2];
    
    SPO2x{i} = SPO2beforescaled{i}(1:end- extendedlag);
    SPO2y{i} = SPO2beforescaled{i}(1+extendedlag:end);
    
    sd1SPO2{i} = std(SPO2y{i} - SPO2x{i})/ sqrt(2); %https://uk.mathworks.com/matlabcentral/answers/24958-poincare-plot-for-hrv
    sd2SPO2{i} = std(SPO2y{i} + SPO2x{i})/ sqrt(2); %Amar et al. SD2>SD1 variability more long-term than short

SD1SD2matrixSPO2(i,1)=sd1SPO2{i};
SD1SD2matrixSPO2(i,2)=sd2SPO2{i};



HR =Participant(first:last,4); % Skin temp

    storeaverageHR(i,1)= mean(HR); %For excel
    storestdHR(i,1)=std(HR); %For excel

    HRbeforescaled{i}(:,1) = [HR];
    
    HRx{i} = HRbeforescaled{i}(1:end- extendedlag);
    HRy{i} = HRbeforescaled{i}(1+extendedlag:end);
    
    sd1HR{i} = std(HRy{i} - HRx{i})/ sqrt(2); %https://uk.mathworks.com/matlabcentral/answers/24958-poincare-plot-for-hrv
    sd2HR{i} = std(HRy{i} + HRx{i})/ sqrt(2); %Amar et al. SD2>SD1 variability more long-term than short

SD1SD2matrixHR(i,1)=sd1HR{i};
SD1SD2matrixHR(i,2)=sd2HR{i};




RR =Participant(first:last,5); % Skin temp

    storeaverageRR(i,1)= mean(RR); %For excel
    storestdRR(i,1)=std(RR); %For excel

    RRbeforescaled{i}(:,1) = [RR];
    
    RRx{i} = RRbeforescaled{i}(1:end- extendedlag);
    RRy{i} = RRbeforescaled{i}(1+extendedlag:end);
    
    sd1RR{i} = std(RRy{i} - RRx{i})/ sqrt(2); %https://uk.mathworks.com/matlabcentral/answers/24958-poincare-plot-for-hrv
    sd2RR{i} = std(RRy{i} + RRx{i})/ sqrt(2); %Amar et al. SD2>SD1 variability more long-term than short

SD1SD2matrixRR(i,1)=sd1RR{i};
SD1SD2matrixRR(i,2)=sd2RR{i};



   
    end

writematrix(SD1SD2matrixtemp,'SD1SD2tempmatrix.csv')

mean_of_sd1temp= mean(SD1SD2matrixtemp(:,1))
std_of_sd1temp= std(SD1SD2matrixtemp(:,1))

mean_of_sd2temp= mean(SD1SD2matrixtemp(:,2))
std_of_sd2temp= std(SD1SD2matrixtemp(:,2))



mean_of_sd1SPO2= mean(SD1SD2matrixSPO2(:,1))
std_of_sd1SPO2= std(SD1SD2matrixSPO2(:,1))

mean_of_sd2SPO2= mean(SD1SD2matrixSPO2(:,2))
std_of_sd2SPO2= std(SD1SD2matrixSPO2(:,2))




mean_of_sd1HR= mean(SD1SD2matrixHR(:,1))
std_of_sd1HR= std(SD1SD2matrixHR(:,1))

mean_of_sd2HR= mean(SD1SD2matrixHR(:,2))
std_of_sd2HR= std(SD1SD2matrixHR(:,2))


mean_of_sd1RR= mean(SD1SD2matrixRR(:,1))
std_of_sd1RR= std(SD1SD2matrixRR(:,1))

mean_of_sd2RR= mean(SD1SD2matrixRR(:,2))
std_of_sd2RR= std(SD1SD2matrixRR(:,2))




scatter(Tempx{1},Tempy{1},36,'filled','MarkerFaceColor','k','MarkerEdgeColor','k')
xlabel('Temperature at time n');
ylabel('Temperature at time n+1');
title('Poincare plot of temperature');
xlim([33 37]);
ylim([33 37]);