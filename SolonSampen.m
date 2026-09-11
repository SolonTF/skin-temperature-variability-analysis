function [SE] = SolonSampen(Data)
% m=2 and r=0.2
S=sampen(Data,2,0.2);
SE=S(2,1);

end