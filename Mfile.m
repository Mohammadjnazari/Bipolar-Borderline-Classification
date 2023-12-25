clc
clear all
close all
%% Loading an EEG data
eeglab ;

EEG = pop_biosig('C:\Users\EHSAN\Desktop\Mr.Nazari\2\rem');
EEG_Signal = EEG.data ;

% [Dec] = WE_Dec(EEG_Signal(10,:),5,'db4');

Fe = Statistical_FE(EEG);
[P_Delta,P_Theta,P_Alpha,P_Beta] = Spectral_FE(EEG);
writematrix(P_Delta,'Fetures.xlsx','sheet',1,'Range', 'a1')
writematrix(P_Theta,'Fetures.xlsx','sheet',2,'Range', 'a1')
writematrix(P_Alpha,'Fetures.xlsx','sheet',3,'Range', 'a1')
writematrix(P_Beta,'Fetures.xlsx','sheet',4,'Range', 'a1')

[Mean_Per_Ch,Var_Per_Ch,Ske_Per_Ch,Kur_Per_Ch] = Statistical_FE(EEG);
writematrix(Mean_Per_Ch,'Fetures.xlsx','sheet',5,'Range', 'a1')
writematrix(Var_Per_Ch,'Fetures.xlsx','sheet',6,'Range', 'a1')
writematrix(Ske_Per_Ch,'Fetures.xlsx','sheet',7,'Range', 'a1')
writematrix(Kur_Per_Ch,'Fetures.xlsx','sheet',8,'Range', 'a1')


[WE_All_Ch,RWE_All_Ch] = WE_Fe(EEG_Signal,5,'db4');
We_Features = [WE_All_Ch,RWE_All_Ch] ;
writematrix(WE_All_Ch,'Fetures.xlsx','sheet',9,'Range', 'a1')
writematrix(RWE_All_Ch,'Fetures.xlsx','sheet',10,'Range', 'a1')


EEG_Signal_tr = EEG_Signal' ;
rho = corr(EEG_Signal_tr);
figure
imagesc(rho)

% Level = 3 ;
% EEG_Signal_Ch5 = EEG_Signal(5,:);
% [C,L] = wavedec(EEG_Signal_Ch5,Level,'db2');
% CA = appcoef(C,L,'db2');
% CA = {CA} ;
% for i=1:Level
%     CD{i} = detcoef(C,L,i);
% end
% All_Comp = cat(2,CA,CD) ;


% [corDim,lyapExp,approxEnt,C0] = Nonlinear_FE(EEG_Signal,EEG.srate);
% Nonlinear_Features = [corDim,lyapExp,approxEnt,C0] ;
