first=3601;
last=7200;

lags = [1,5,10,15,20,25,30];

load("Data.mat")

for x = 1:numel(lags)
    lag = lags(x);

    for i=1:24

    Participant=Data{i};
    
    T=Participant(first:last,2); % Skin temp
    S=Participant(first:last,3); % SpO2
    H=Participant(first:last,4); % Heart rate
    R=Participant(first:last,5); % Resp rate 

    TEa = transferEntropyPartition(T,S,lag,lag);
    TEb = transferEntropyPartition(S,T,lag,lag);
    TEc = transferEntropyPartition(T,H,lag,lag);
    TEd = transferEntropyPartition(H,T,lag,lag);
    TEe = transferEntropyPartition(T,R,lag,lag);
    TEf = transferEntropyPartition(R,T,lag,lag);
    TEg = transferEntropyPartition(S,H,lag,lag);
    TEh = transferEntropyPartition(H,S,lag,lag);
    TEi = transferEntropyPartition(S,R,lag,lag);
    TEj = transferEntropyPartition(R,S,lag,lag);
    TEk = transferEntropyPartition(H,R,lag,lag);
    TEl = transferEntropyPartition(R,H,lag,lag);

% Store the results in a matrix for later analysis
    results(i, :) = [TEa, TEb, TEc, TEd, TEe, TEf, TEg, TEh, TEi, TEj, TEk, TEl];
    
    end

a=median(results);

writematrix(a, fullfile('/Users/sfountzopoulos/Library/CloudStorage/OneDrive-Personal/Research/NetworkPhysiology/MATLABTe/Lagtimematrices', ['healthymedian' num2str(lag) '.txt']));

% Save the 'results' matrix for this lag
writematrix(results, fullfile('/Users/sfountzopoulos/Library/CloudStorage/OneDrive-Personal/Research/NetworkPhysiology/MATLABTe/Lagtimematrices', ['healthyresults_lag' num2str(lag) '.txt']));
end
