function [P_Delta,P_Theta,P_Alpha,P_Beta] = Spectral_FE(EEG)
Delta_freqrange = [0.5,4] ; 
Theta_freqrange = [4,8] ; 
Alpha_freqrange = [8,13] ; 
Beta_freqrange = [13,30] ; 
EEG_Signal = EEG.data ; 
EEG_Signal_tr = EEG_Signal' ; 
[pxx,f] = pwelch(EEG_Signal_tr,[],[],[],EEG.srate);
P_Delta = bandpower(pxx,f,Delta_freqrange,'psd');
P_Theta = bandpower(pxx,f,Theta_freqrange,'psd');
P_Alpha = bandpower(pxx,f,Alpha_freqrange,'psd');
P_Beta = bandpower(pxx,f,Beta_freqrange,'psd');
% P = [P_Delta,P_Theta,P_Alpha,P_Beta] ; 
end

