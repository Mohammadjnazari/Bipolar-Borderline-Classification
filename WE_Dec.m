function [Dec] = WE_Dec(Signal,Level,wname)
Dec = {} ; 
[C,L] = wavedec(Signal,Level,wname);
CA = appcoef(C,L,wname);
Dec{1} = CA ; 
Idx = 2 ; 
for j=Level:-1:1
    Dec{Idx} = detcoef(C,L,j); 
    Idx = Idx + 1 ; 
end
end

