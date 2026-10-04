function [TE] = TEAlireza3(X,Y,t,w)

% TEAlireza calculates Transfer Entropy (TE) from source X to target Y
% using the Darbellay-Vajda partitioning algorithm.
%
% Statistical significance is assessed using IAAFT surrogates of the
% source signal X. IAAFT approximately preserves:
%   1. the amplitude distribution of X
%   2. the power spectrum / linear autocorrelation structure of X
%
% while disrupting the original temporal relationship between X and Y.
%
% INPUTS:
% X : source time series (1-D vector)
% Y : target time series (1-D vector)
% t : time lag in X
% w : time lag in Y
%
% OUTPUT:
% TE : significant transfer entropy.
%      TE = observed TE if significant at p < 0.05
%      TE = 0 otherwise.


%% Make sure signals are column vectors
X = X(:);
Y = Y(:);

if length(X) ~= length(Y)
    error('X and Y must have the same length.');
end


%% Calculate observed Transfer Entropy
TEXY = transferEntropyPartition(X,Y,t,w);


%% IAAFT surrogate testing

nSurrogates = 100;
maxIter = 1000;

TEXYsurr = zeros(nSurrogates,1);

for i = 1:nSurrogates

    % Generate IAAFT surrogate of source X
    XX = IAAFTsurrogate(X,maxIter);

    % Calculate TE from surrogate source to original target
    TEXYsurr(i) = transferEntropyPartition(XX,Y,t,w);

end


%% Significance threshold

P = prctile(TEXYsurr,95);

if TEXY > P
    TE = TEXY;
else
    TE = 0;
end

end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IAAFT SURROGATE FUNCTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function xs = IAAFTsurrogate(x,maxIter)

% Generates an Iterative Amplitude Adjusted Fourier Transform (IAAFT)
% surrogate.
%
% The surrogate approximately preserves:
%   - amplitude distribution of x
%   - Fourier power spectrum of x
%
% while randomising its temporal organisation.


x = x(:);
N = length(x);


%% Original Fourier amplitudes

Xfft = fft(x);
targetAmplitude = abs(Xfft);


%% Sorted original values

sortedX = sort(x);


%% Initial surrogate: random permutation

xs = x(randperm(N));


%% Iterative adjustment

for iter = 1:maxIter

    xs_old = xs;


    % ---------------------------------------------------------------
    % Step 1: enforce original Fourier amplitudes
    % ---------------------------------------------------------------

    XS = fft(xs);

    % Keep phases of current surrogate but impose
    % Fourier amplitudes of original signal
    XSnew = targetAmplitude .* exp(1i * angle(XS));

    y = real(ifft(XSnew));


    % ---------------------------------------------------------------
    % Step 2: enforce original amplitude distribution
    % ---------------------------------------------------------------

    [~,rankIndex] = sort(y);

    xs(rankIndex) = sortedX;


    % ---------------------------------------------------------------
    % Check convergence
    % ---------------------------------------------------------------

    if isequal(xs,xs_old)
        break
    end

end

end