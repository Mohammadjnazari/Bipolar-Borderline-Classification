function [WE_All_Ch,RWE_All_Ch] = WE_Fe(EEG_Signal,Level,wname)
WE_All_Ch = [] ; 
RWE_All_Ch = [] ; 
for i=1:size(EEG_Signal,1)
    Each_channel = EEG_Signal(i,:) ; 
    [C,L] = wavedec(Each_channel,Level,wname);
    [Ea,Ed] = wenergy(C,L);
    All_E = [Ea,Ed] ; 
    Etotoal = sum(All_E) ;
    for j=2:size(All_E,2)
        RWE(j-1) = (sum(All_E(1:j)))/Etotoal;
    end
    WE = sum((RWE .* log(RWE))) ; 
    WE_All_Ch = cat(2,WE_All_Ch,WE);
    RWE_All_Ch = cat(2,RWE_All_Ch,RWE);
end

