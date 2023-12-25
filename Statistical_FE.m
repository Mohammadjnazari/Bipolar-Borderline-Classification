function [Mean_Per_Ch,Var_Per_Ch,Ske_Per_Ch,Kur_Per_Ch] = Statistical_FE(EEG)
EEG_signal = EEG.data ; 
EEG_signal = EEG_signal' ; 
Mean_Per_Ch = mean(EEG_signal) ; 
Var_Per_Ch = var(EEG_signal) ; 
Ske_Per_Ch = skewness(EEG_signal) ;
Kur_Per_Ch = kurtosis(EEG_signal) ;
% Features = [Mean_Per_Ch;Var_Per_Ch;Ske_Per_Ch;Kur_Per_Ch] ;
end

