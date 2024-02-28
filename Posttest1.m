

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Post Processing code for reading the SIMBF outputed trends         %
%           written for SIMMER/III code, July, 23, 2019. S.KH             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear all;close all;fclose('all');

tic %1

cd 'Inputs-experiment-D3.1'

% Importing the parameters from the excel sheets
disp('  Importing the experimental data from the excel files ... ');
PT_EXP = xlsread('pressures_injectiononly','pressures_injectiononly');
TC_EXP = xlsread('sbl_tc_data','sbl_tc_data');
TS_EXP = xlsread('test_section_tc_data','test_section_tc_data');
LT_EXP = xlsread('level_tc_data','level_tc_data');

[L1,W1] = size(PT_EXP);   [L2,W2] = size(TS_EXP);   [L3,W3] = size(TC_EXP);  [L4,W4] = size(LT_EXP);

% Matrix allocation
Time_PT = zeros(L1,1);    Time_TS = zeros(L2,1);    Time_TC = zeros(L3,1);    Time_LT = zeros(L4,1);

PC_SBL_01 = zeros(L1,1);  PC_S1B_01 = zeros(L1,1);  PT_SBL_01 = zeros(L1,1);	
PT_SBL_02 = zeros(L1,1);  PT_S1B_01 = zeros(L1,1);  PT_S1B_02 = zeros(L1,1);
PT_S1B_03 = zeros(L1,1);  PT_S1B_04 = zeros(L1,1);



TC_R11_L1 = zeros(L2,1);  TC_R13_L1 = zeros(L2,1);  TC_R11_L2 = zeros(L2,1);  TC_R12_L2 = zeros(L2,1);  
TC_R13_L2 = zeros(L2,1);  TC_R11_L3 = zeros(L2,1);  TC_R13_L3 = zeros(L2,1);  TC_R13_L5 = zeros(L2,1); 
TC_R11_L6 = zeros(L2,1);  TC_R12_L6 = zeros(L2,1);  TC_R21_L2 = zeros(L2,1);  TC_R22_L2 = zeros(L2,1);
TC_R21_L4 = zeros(L2,1);  TC_R22_L4 = zeros(L2,1);  TC_R23_L4 = zeros(L2,1);  TC_R31_L1 = zeros(L2,1);  
TC_R32_L1 = zeros(L2,1);  TC_R33_L1 = zeros(L2,1);  TC_R34_L1 = zeros(L2,1);  TC_R35_L1 = zeros(L2,1); 
TC_R32_L2 = zeros(L2,1);  TC_R33_L3 = zeros(L2,1);  TC_R31_L4 = zeros(L2,1);  TC_R33_L4 = zeros(L2,1);
TC_R31_L5 = zeros(L2,1);  TC_R32_L5 = zeros(L2,1);  TC_R33_L5 = zeros(L2,1);  TC_R31_L6 = zeros(L2,1); 
TC_R33_L6 = zeros(L2,1);  TC_R34_L6 = zeros(L2,1);  TC_R35_L6 = zeros(L2,1);  TC_R36_L6 = zeros(L2,1);
TC_R41_L2 = zeros(L2,1);  TC_R42_L2 = zeros(L2,1);  TC_R41_L3 = zeros(L2,1);  TC_R42_L3 = zeros(L2,1);
TC_R41_L4 = zeros(L2,1);  TC_R43_L4 = zeros(L2,1);  TC_R42_L5 = zeros(L2,1);  TC_R43_L5 = zeros(L2,1);
TC_R51_L1 = zeros(L2,1);  TC_R53_L1 = zeros(L2,1);  TC_R53_L4 = zeros(L2,1);  TC_R61_L3 = zeros(L2,1);  
TC_R63_L3 = zeros(L2,1);  TC_R61_L5 = zeros(L2,1);  TC_R63_L5 = zeros(L2,1);  TC_R61_L6 = zeros(L2,1); 
TC_R62_L6 = zeros(L2,1);  TC_R63_L6 = zeros(L2,1);
	
TC_SBL_01 = zeros(L3,1); TC_SBL_02 = zeros(L3,1); TC_SBL_03 = zeros(L3,1); TC_SBL_04 = zeros(L3,1);	TC_SBL_05= zeros(L3,1);

TC_S1B_L1 = zeros(L4,1); TC_S1B_L2 = zeros(L4,1);   

toc %1

% Filling up the experimental data into the related matrices

    Time_PT(:) = PT_EXP(:,1);   			

    PC_SBL_01(:) = PT_EXP(:,2);  PC_S1B_01(:) = PT_EXP(:,3);   PT_SBL_01(:) = PT_EXP(:,4);	
    PT_SBL_02(:) = PT_EXP(:,5);  PT_S1B_01(:) = PT_EXP(:,6);   PT_S1B_02(:) = PT_EXP(:,7);
    PT_S1B_03(:) = PT_EXP(:,8);  PT_S1B_04(:) = PT_EXP(:,9);													

    Time_TS(:) = TS_EXP(:,1);    				
   

    TC_R11_L1(:) = TS_EXP(:,2);   TC_R13_L1(:) = TS_EXP(:,3);   TC_R11_L2(:) = TS_EXP(:,4);   TC_R12_L2(:) = TS_EXP(:,5);  
    TC_R13_L2(:) = TS_EXP(:,6);   TC_R11_L3(:) = TS_EXP(:,7);   TC_R13_L3(:) = TS_EXP(:,8);   TC_R13_L5(:) = TS_EXP(:,9);
    TC_R11_L6(:) = TS_EXP(:,10);  TC_R12_L6(:) = TS_EXP(:,11);  TC_R21_L2(:) = TS_EXP(:,12);  TC_R22_L2(:) = TS_EXP(:,13);  
    TC_R21_L4(:) = TS_EXP(:,14);  TC_R22_L4(:) = TS_EXP(:,15);  TC_R23_L4(:) = TS_EXP(:,16);  TC_R31_L1(:) = TS_EXP(:,17);  
    TC_R32_L1(:) = TS_EXP(:,18);  TC_R33_L1(:) = TS_EXP(:,19);  TC_R34_L1(:) = TS_EXP(:,20);  TC_R35_L1(:) = TS_EXP(:,21); 
    TC_R32_L2(:) = TS_EXP(:,22);  TC_R33_L3(:) = TS_EXP(:,23);  TC_R31_L4(:) = TS_EXP(:,24);  TC_R33_L4(:) = TS_EXP(:,25);
    TC_R31_L5(:) = TS_EXP(:,26);  TC_R32_L5(:) = TS_EXP(:,27);  TC_R33_L5(:) = TS_EXP(:,28);  TC_R31_L6(:) = TS_EXP(:,29);  
    TC_R33_L6(:) = TS_EXP(:,30);  TC_R34_L6(:) = TS_EXP(:,31);  TC_R35_L6(:) = TS_EXP(:,32);  TC_R36_L6(:) = TS_EXP(:,33); 
    TC_R41_L2(:) = TS_EXP(:,34);  TC_R42_L2(:) = TS_EXP(:,35);  TC_R41_L3(:) = TS_EXP(:,36);  TC_R42_L3(:) = TS_EXP(:,37); 
    TC_R41_L4(:) = TS_EXP(:,38);  TC_R43_L4(:) = TS_EXP(:,39);  TC_R42_L5(:) = TS_EXP(:,40);  TC_R43_L5(:) = TS_EXP(:,41);
    TC_R51_L1(:) = TS_EXP(:,42);  TC_R53_L1(:) = TS_EXP(:,43);  TC_R53_L4(:) = TS_EXP(:,44);  TC_R61_L3(:) = TS_EXP(:,45);  
    TC_R63_L3(:) = TS_EXP(:,46);  TC_R61_L5(:) = TS_EXP(:,47);  TC_R63_L5(:) = TS_EXP(:,48);  TC_R61_L6(:) = TS_EXP(:,49);  
    TC_R62_L6(:) = TS_EXP(:,50);  TC_R63_L6(:) = TS_EXP(:,51);
  
    
    Time_TC(:) = TC_EXP(:,1);
    TC_SBL_01(:) = TC_EXP(:,2);  TC_SBL_02(:) = TC_EXP(:,3);  TC_SBL_03(:) = TC_EXP(:,4);
    TC_SBL_04(:) = TC_EXP(:,5);  TC_SBL_05(:) = TC_EXP(:,6);

    Time_LT(:) = LT_EXP(:,1);
    TC_S1B_L1(:) = LT_EXP(:,2);  TC_S1B_L2(:) = LT_EXP(:,3);


cd 'D:\Samad\PhDThesis\Post-test processing -Tests D3.1';

disp('    ');	
disp('  Experimental data importing is completed ');






% **************************************************************************************

% Calling the Inputreader function for reading the code outputs

disp('    ');
disp('  Reading the SIMBF file data ....'); clear transfer importer

cd 'Inputs-SIMMER\xbff';

transfer = readtable('PK(50,19).txt');[Lsim,Wsim] = size(transfer);


% Matrix allocation for the simbf part for reference case
Time_simbf = zeros(Lsim,1);  input = zeros(Lsim,2);

PK_50_19  = zeros(Lsim,1);   PK_1_45  = zeros(Lsim,1);    PK_3_40  = zeros(Lsim,1);    PK_47_82  = zeros(Lsim,1);   PK_50_56  = zeros(Lsim,1);    PK_30_79  = zeros(Lsim,1);
 
RBGK5_1_45 = zeros(Lsim,1);  VK6_1_45 = zeros(Lsim,1);    RBGK5_1_24 = zeros(Lsim,1);  VK6_1_24 = zeros(Lsim,1);

TGK_50_19 = zeros(Lsim,1);   TLK3_3_40 = zeros(Lsim,1);   TGK_3_40 = zeros(Lsim,1);      


% Ring 1-6
TLK1_12_51 = zeros(Lsim,1);  TLK1_12_54 = zeros(Lsim,1);  TLK1_12_57 = zeros(Lsim,1);  TLK1_12_61 = zeros(Lsim,1);   TLK1_12_63 = zeros(Lsim,1);
TLK1_19_54 = zeros(Lsim,1);  TLK1_19_59 = zeros(Lsim,1); 
TLK1_26_51 = zeros(Lsim,1);  TLK1_28_51 = zeros(Lsim,1);  TLK1_28_54 = zeros(Lsim,1);  TLK1_26_57 = zeros(Lsim,1);   TLK1_28_59 = zeros(Lsim,1);
TLK1_26_61 = zeros(Lsim,1);  TLK1_26_63 = zeros(Lsim,1);  TLK1_28_63 = zeros(Lsim,1);
TLK1_31_54 = zeros(Lsim,1);  TLK1_31_57 = zeros(Lsim,1);  TLK1_31_59 = zeros(Lsim,1);  TLK1_31_61 = zeros(Lsim,1);  
TLK1_35_51 = zeros(Lsim,1);  TLK1_37_59 = zeros(Lsim,1);  
TLK1_41_57 = zeros(Lsim,1);  TLK1_41_61 = zeros(Lsim,1);  TLK1_41_63 = zeros(Lsim,1);


% top flange
TLK1_41_69 = zeros(Lsim,1);  TLK1_41_72 = zeros(Lsim,1);



% Pressures
importer   = table2array(transfer);
Time_simbf = importer(:,1);
PK_50_19   = importer(:,2); 

transfer  = readtable('PK(1,45).txt');
importer  = table2array(transfer);
PK_1_45   = importer(:,2);

transfer  = readtable('PK(3,40).txt');
importer  = table2array(transfer);
PK_3_40   = importer(:,2);

transfer  = readtable('PK(47,82).txt');
importer  = table2array(transfer);
PK_47_82   = importer(:,2);

transfer  = readtable('PK(50,56).txt');
importer  = table2array(transfer);
PK_50_56  = importer(:,2);

transfer  = readtable('PK(30,79).txt');
importer  = table2array(transfer);
PK_30_79  = importer(:,2);





% Injector parameters
transfer   = readtable('RBGK5(1,45).txt');
importer   = table2array(transfer);
RBGK5_1_45 = importer(:,2);

transfer  = readtable('VK6(1,45).txt');
importer  = table2array(transfer);
VK6_1_45  = importer(:,2);

transfer   = readtable('RBGK5(1,24).txt');
importer   = table2array(transfer);
RBGK5_1_24 = (importer(:,2)+importer(:,3)+importer(:,4))/3;

transfer  = readtable('VK6(1,24).txt');
importer  = table2array(transfer);
VK6_1_24  = (importer(:,2)+importer(:,3)+importer(:,4))/3;



% Temperatures
transfer  = readtable('TGK(50,19).txt');
importer  = table2array(transfer);
TGK_50_19 = importer(:,2)-273.15;

transfer  = readtable('TLK3(3,40).txt');
importer  = table2array(transfer);
TLK3_3_40 = importer(:,2)-273.15;

transfer  = readtable('TGK(3,40).txt');
importer  = table2array(transfer);
TGK_3_40  = importer(:,2)-273.15;




% TCs in the S1B
% ring 1
transfer   = readtable('TLK1(12,51).txt');
importer   = table2array(transfer);
TLK1_12_51 = importer(:,2)-283.15;

transfer   = readtable('TLK1(12,54).txt');
importer   = table2array(transfer);
TLK1_12_54 = importer(:,2)-283.15;

transfer   = readtable('TLK1(12,57).txt');
importer   = table2array(transfer);
TLK1_12_57 = importer(:,2)-283.15;

transfer   = readtable('TLK1(12,61).txt');
importer   = table2array(transfer);
TLK1_12_61 = importer(:,2)-283.15;

transfer   = readtable('TLK1(12,63).txt');
importer   = table2array(transfer);
TLK1_12_63 = importer(:,2)-283.15;


% ring 2
transfer   = readtable('TLK1(19,54).txt');
importer   = table2array(transfer);
TLK1_19_54 = importer(:,2)-283.15;

transfer   = readtable('TLK1(19,59).txt');
importer   = table2array(transfer);
TLK1_19_59 = importer(:,2)-283.15;


% ring 3
transfer   = readtable('TLK1(26,51).txt');
importer   = table2array(transfer);
TLK1_26_51 = importer(:,2)-283.15;

transfer   = readtable('TLK1(28,51).txt');
importer   = table2array(transfer);
TLK1_28_51 = importer(:,2)-283.15;

transfer   = readtable('TLK1(28,54).txt');
importer   = table2array(transfer);
TLK1_28_54 = importer(:,2)-283.15;

transfer   = readtable('TLK1(26,57).txt');
importer   = table2array(transfer);
TLK1_26_57 = importer(:,2)-283.15;

transfer   = readtable('TLK1(28,59).txt');
importer   = table2array(transfer);
TLK1_28_59 = importer(:,2)-283.15;

transfer   = readtable('TLK1(26,61).txt');
importer   = table2array(transfer);
TLK1_26_61 = importer(:,2)-283.15;

transfer   = readtable('TLK1(26,63).txt');
importer   = table2array(transfer);
TLK1_26_63 = importer(:,2)-283.15;

transfer   = readtable('TLK1(28,63).txt');
importer   = table2array(transfer);
TLK1_28_63 = importer(:,2)-283.15;


% ring 4
transfer   = readtable('TLK1(31,54).txt');
importer   = table2array(transfer);
TLK1_31_54 = importer(:,2)-283.15;

transfer   = readtable('TLK1(31,57).txt');
importer   = table2array(transfer);
TLK1_31_57 = importer(:,2)-283.15;

transfer   = readtable('TLK1(31,59).txt');
importer   = table2array(transfer);
TLK1_31_59 = importer(:,2)-283.15;

transfer   = readtable('TLK1(31,61).txt');
importer   = table2array(transfer);
TLK1_31_61 = importer(:,2)-283.15;


% ring 5
transfer   = readtable('TLK1(35,51).txt');
importer   = table2array(transfer);
TLK1_35_51 = importer(:,2)-283.15;

transfer   = readtable('TLK1(37,59).txt');
importer   = table2array(transfer);
TLK1_37_59 = importer(:,2)-283.15;


% ring 6
transfer   = readtable('TLK1(41,57).txt');
importer   = table2array(transfer);
TLK1_41_57 = importer(:,2)-283.15;

transfer   = readtable('TLK1(41,61).txt');
importer   = table2array(transfer);
TLK1_41_61 = importer(:,2)-283.15;

transfer   = readtable('TLK1(41,63).txt');
importer   = table2array(transfer);
TLK1_41_63 = importer(:,2)-283.15;


% top flange
transfer   = readtable('TLK1(41,69).txt');
importer   = table2array(transfer);
TLK1_41_69 = importer(:,2)-273.15;

transfer   = readtable('TLK1(41,72).txt');
importer   = table2array(transfer);
TLK1_41_72 = importer(:,2)-273.15;

cd 'D:\Samad\PhDThesis\Post-test processing -Tests D3.1';

disp('    ');
disp(' The SIMBF file is imported correctly');



 

% ************** Reading the bfcal post-processor output file *************
disp('    ');
disp(' Reading the bfcal file data ....'); clear transfer; clear importer; 

cd 'Inputs-SIMMER\bfcal'

transfer = readtable('MASF(1,1).txt'); [Lbfcal,Wbfcal]=size(transfer);

% Matrix allocation for the bfcal part

Time_bfcal = zeros(Lbfcal,1);

MASF_1_1 = zeros(Lbfcal,1);    MASF_1_2 = zeros(Lbfcal,1);    MASF_1_3 = zeros(Lbfcal,1);     MASF_1_4 = zeros(Lbfcal,1);  
MASF_1_6 = zeros(Lbfcal,1);    MASF_1_7 = zeros(Lbfcal,1);    MASF_1_8 = zeros(Lbfcal,1);     MASF_1_9 = zeros(Lbfcal,1); 
MASF_1_10 = zeros(Lbfcal,1); 

GVOL_1_1 = zeros(Lbfcal,1);    GVOL_1_2 = zeros(Lbfcal,1);    GVOL_1_3 = zeros(Lbfcal,1);     GVOL_1_4 = zeros(Lbfcal,1);  
GVOL_1_6 = zeros(Lbfcal,1);    GVOL_1_7 = zeros(Lbfcal,1);    GVOL_1_8 = zeros(Lbfcal,1);     GVOL_1_9 = zeros(Lbfcal,1);
GVOL_1_10 = zeros(Lbfcal,1); 

MASFPG_1_1 = zeros(Lbfcal,1);  MASFPG_1_2 = zeros(Lbfcal,1);  MASFPG_1_3 = zeros(Lbfcal,1);   MASFPG_1_4 = zeros(Lbfcal,1);
MASFPG_1_6 = zeros(Lbfcal,1);  MASFPG_1_7 = zeros(Lbfcal,1);  MASFPG_1_8 = zeros(Lbfcal,1);   MASFPG_1_9 = zeros(Lbfcal,1);
MASFPG_1_10 = zeros(Lbfcal,1); 

MASN_1_1 = zeros(Lbfcal,1);    MASN_1_2 = zeros(Lbfcal,1);    MASN_1_3 = zeros(Lbfcal,1);     MASN_1_4 = zeros(Lbfcal,1);
MASN_1_6 = zeros(Lbfcal,1);    MASN_1_7 = zeros(Lbfcal,1);    MASN_1_8 = zeros(Lbfcal,1);     MASN_1_9 = zeros(Lbfcal,1);
MASN_1_10 = zeros(Lbfcal,1); 

MASN1_1_1 = zeros(Lbfcal,1);   MASN1_1_4 = zeros(Lbfcal,1);
MASN2_1_1 = zeros(Lbfcal,1);   MASN2_1_4 = zeros(Lbfcal,1);

TFLUXF_1_3 = zeros(Lbfcal,1);  TFLUXN_1_3 = zeros(Lbfcal,1); 

TMPF_1_1 = zeros(Lbfcal,1);    TMPF_1_4 = zeros(Lbfcal,1);    TMPL_1_1 = zeros(Lbfcal,1);     TMPALL_1_1 = zeros(Lbfcal,1);
TMPG_1_1 = zeros(Lbfcal,1);    TMPG_1_4 = zeros(Lbfcal,1);

H2 = zeros(Lbfcal,1);



% MASF (total mass of fuel)
importer   = table2array(transfer);
Time_bfcal = importer(:,1);
MASF_1_1   = importer(:,2); 

transfer   = readtable('MASF(1,2).txt');
importer   = table2array(transfer);
MASF_1_2   = importer(:,2);

transfer   = readtable('MASF(1,3).txt');
importer   = table2array(transfer);
MASF_1_3   = importer(:,2);

transfer   = readtable('MASF(1,4).txt');
importer   = table2array(transfer);
MASF_1_4   = importer(:,2);

transfer   = readtable('MASF(1,6).txt');
importer   = table2array(transfer);
MASF_1_6   = importer(:,2);

transfer   = readtable('MASF(1,7).txt');
importer   = table2array(transfer);
MASF_1_7   = importer(:,2);

transfer   = readtable('MASF(1,8).txt');
importer   = table2array(transfer);
MASF_1_8   = importer(:,2);

transfer   = readtable('MASF(1,9).txt');
importer   = table2array(transfer);
MASF_1_9   = importer(:,2);

transfer   = readtable('MASF(1,10).txt');
importer   = table2array(transfer);
MASF_1_10  = importer(:,2);


% GVOL (total volume of gas)
transfer   = readtable('GVOL(1,1).txt');
importer   = table2array(transfer);
GVOL_1_1   = importer(:,2);

transfer   = readtable('GVOL(1,2).txt');
importer   = table2array(transfer);
GVOL_1_2   = importer(:,2);

transfer   = readtable('GVOL(1,3).txt');
importer   = table2array(transfer);
GVOL_1_3   = importer(:,2);

transfer   = readtable('GVOL(1,4).txt');
importer   = table2array(transfer);
GVOL_1_4   = importer(:,2);

transfer   = readtable('GVOL(1,6).txt');
importer   = table2array(transfer);
GVOL_1_6   = importer(:,2);

transfer   = readtable('GVOL(1,7).txt');
importer   = table2array(transfer);
GVOL_1_7   = importer(:,2);

transfer   = readtable('GVOL(1,8).txt');
importer   = table2array(transfer);
GVOL_1_8   = importer(:,2);

transfer    = readtable('GVOL(1,9).txt');
importer    = table2array(transfer);
GVOL_1_9    = importer(:,2);

transfer    = readtable('GVOL(1,10).txt');
importer    = table2array(transfer);
GVOL_1_10   = importer(:,2);


% MASFPG (total mass of fission gas)
transfer    = readtable('MASFPG(1,1).txt');
importer    = table2array(transfer);
MASFPG_1_1  = importer(:,2);

transfer    = readtable('MASFPG(1,2).txt');
importer    = table2array(transfer);
MASFPG_1_2  = importer(:,2);

transfer    = readtable('MASFPG(1,3).txt');
importer    = table2array(transfer);
MASFPG_1_3  = importer(:,2);

transfer    = readtable('MASFPG(1,4).txt');
importer    = table2array(transfer);
MASFPG_1_4  = importer(:,2);

transfer    = readtable('MASFPG(1,6).txt');
importer    = table2array(transfer);
MASFPG_1_6  = importer(:,2);

transfer    = readtable('MASFPG(1,7).txt');
importer    = table2array(transfer);
MASFPG_1_7  = importer(:,2);

transfer    = readtable('MASFPG(1,8).txt');
importer    = table2array(transfer);
MASFPG_1_8  = importer(:,2);

transfer    = readtable('MASFPG(1,9).txt');
importer    = table2array(transfer);
MASFPG_1_9  = importer(:,2);

transfer    = readtable('MASFPG(1,10).txt');
importer    = table2array(transfer);
MASFPG_1_10 = importer(:,2);


% MASN (total mass of coolant)
transfer   = readtable('MASN(1,1).txt');
importer   = table2array(transfer);
MASN_1_1   = importer(:,2);

transfer   = readtable('MASN(1,2).txt');
importer   = table2array(transfer);
MASN_1_2   = importer(:,2);

transfer   = readtable('MASN(1,3).txt');
importer   = table2array(transfer);
MASN_1_3   = importer(:,2);

transfer   = readtable('MASN(1,4).txt');
importer   = table2array(transfer);
MASN_1_4   = importer(:,2);

transfer   = readtable('MASN(1,6).txt');
importer   = table2array(transfer);
MASN_1_6   = importer(:,2);

transfer   = readtable('MASN(1,7).txt');
importer   = table2array(transfer);
MASN_1_7   = importer(:,2);

transfer   = readtable('MASN(1,8).txt');
importer   = table2array(transfer);
MASN_1_8   = importer(:,2);

transfer   = readtable('MASN(1,9).txt');
importer   = table2array(transfer);
MASN_1_9   = importer(:,2);

transfer   = readtable('MASN(1,10).txt');
importer   = table2array(transfer);
MASN_1_10  = importer(:,2);


% MASN1 and MASN2 (mass of liquid and vapor coolant)
transfer  = readtable('MASN1(1,1).txt');
importer  = table2array(transfer);
MASN1_1_1 = importer(:,2);

transfer  = readtable('MASN1(1,4).txt');
importer  = table2array(transfer);
MASN1_1_4 = importer(:,2);

transfer  = readtable('MASN2(1,1).txt');
importer  = table2array(transfer);
MASN2_1_1 = importer(:,2);

transfer  = readtable('MASN2(1,4).txt');
importer  = table2array(transfer);
MASN2_1_4 = importer(:,2);


% TFLUXF and TFLUXN (total mass flow rates)
transfer   = readtable('TFLUXF(1,3).txt');
importer   = table2array(transfer);
TFLUXF_1_3 = importer(:,2);

transfer   = readtable('TFLUXN(1,3).txt');
importer   = table2array(transfer);
TFLUXN_1_3 = importer(:,2);


% TMPF (total fuel average temperature)
transfer   = readtable('TMPF(1,1).txt');
importer   = table2array(transfer);
TMPF_1_1   = importer(:,2)-273.15;

transfer   = readtable('TMPF(1,4).txt');
importer   = table2array(transfer);
TMPF_1_4   = importer(:,2)-273.15;

transfer   = readtable('TMPG(1,1).txt');
importer   = table2array(transfer);
TMPG_1_1   = importer(:,2)-273.15;

transfer   = readtable('TMPG(1,4).txt');
importer   = table2array(transfer);
TMPG_1_4   = importer(:,2)-273.15;

transfer   = readtable('TMPL(1,1).txt');
importer   = table2array(transfer);
TMPL_1_1   = importer(:,2)-273.15;

transfer   = readtable('TMPALL(1,1).txt');
importer   = table2array(transfer);
TMPALL_1_1 = importer(:,2)-273.15;

% H2  (total H2 in the macroregions)
transfer   = readtable('H2.txt');
importer   = table2array(transfer);
H2 = importer(:,2);


cd 'D:\Samad\PhDThesis\Post-test processing -Tests D3.1';

disp('    ');
disp(' The bfcal output files are imported correctly');





% Step 1

% ******************************* Complementary calculations *******************************************************

% Average temperature of PbLi inside the S1B:
% SIMMER
Average_SIM = zeros(Lsim,1);
Average_SIM(:) = TLK1_12_51(:)+TLK1_12_54(:)+TLK1_12_57(:)+...
TLK1_12_61(:)+TLK1_12_63(:)+TLK1_19_54(:)+TLK1_19_59(:)+...
TLK1_26_51(:)+TLK1_28_51(:)+TLK1_28_54(:)+TLK1_26_57(:)+...
TLK1_28_59(:)+TLK1_26_61(:)+TLK1_26_63(:)+TLK1_28_63(:)+...
TLK1_31_54(:)+TLK1_31_57(:)+TLK1_31_59(:)+TLK1_31_61(:)+...
TLK1_35_51(:)+TLK1_37_59(:)+TLK1_41_57(:)+TLK1_41_61(:)+TLK1_41_63(:);
Average_SIM(:) = Average_SIM(:)/24; Averag_eSIM(:) = Average_SIM(:)-273.15;



% Experiment
Average_EXP = zeros(L2,1);
Average_EXP(:) = TC_R11_L1(:)+TC_R13_L1(:)+TC_R11_L2(:)+...
    TC_R12_L2(:)+TC_R13_L2(:)+TC_R11_L3(:)+TC_R13_L3(:)+TC_R13_L5(:)+...
    TC_R11_L6(:)+TC_R12_L6(:)+TC_R21_L2(:)+TC_R22_L2(:)+TC_R21_L4(:)+...
    TC_R22_L4(:)+TC_R23_L4(:)+TC_R31_L1(:)+TC_R32_L1(:)+TC_R33_L1(:)+...
    TC_R34_L1(:)+TC_R35_L1(:)+TC_R32_L2(:)+TC_R33_L3(:)+TC_R31_L4(:)+...
    TC_R33_L4(:)+TC_R31_L5(:)+TC_R32_L5(:)+TC_R33_L5(:)+TC_R31_L6(:)+...   
    TC_R33_L6(:)+TC_R34_L6(:)+TC_R35_L6(:)+TC_R36_L6(:)+TC_R41_L2(:)+...   
    TC_R42_L2(:)+TC_R41_L3(:)+TC_R42_L3(:)+TC_R41_L4(:)+TC_R43_L4(:)+...    
    TC_R42_L5(:)+TC_R43_L5(:)+TC_R51_L1(:)+TC_R53_L1(:)+TC_R53_L4(:)+...
    TC_R61_L3(:)+TC_R63_L3(:)+TC_R61_L5(:)+TC_R63_L5(:)+TC_R61_L6(:)+...
    TC_R62_L6(:)+TC_R63_L6(:);  Average_EXP(:) = Average_EXP(:)/50;




% ******************************************************************************************************************

% Illustrating the requested plot

disp('    ');
disp('  Plotting the requested plots ....');

cd 'Output-plots'

x0=10;y0=10; width=1000; height=400;
set(gcf,'position',[x0,y0,width,height]);
set(0,'defaultAxesFontName','Arial');
set(0,'defaultAxesFontSize',12);
set(0,'DefaultLegendFontSize',10);


% (I) Pressures  S1B
disp('    ');
disp('  (I) Pressure at the PTs position: PT-S1B-01/03 versus PK(50,56)  ');
disp('  PT-SBL-01 versus PK(50,19) - PT-SBL-02 versus PK(3,40) ');
figure(1);
PK_50_56(:) = PK_50_56(:)/1.D5; PK_50_19(:) = PK_50_19(:)/1.D5; PK_3_40(:) = PK_3_40(:)/1.D5;
PT_SBL_02(:) = PT_SBL_02(:);

plot(Time_simbf-0.005,PK_50_56,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_simbf-0.005,PK_50_19,'-','color',[0.00 0.00 0.00],'LineWidth',0.75);
plot(Time_simbf-0.005,PK_3_40,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);

plot(Time_PT,PT_S1B_01,'--','color',[0.93 0.07 0.18],'LineWidth',0.75,'MarkerIndices',1:1000:length(PT_S1B_01));
plot(Time_PT,PT_S1B_02,'--','color',[0.43 0.07 0.18],'LineWidth',0.75,'MarkerIndices',1:1000:length(PT_S1B_02));
plot(Time_PT,PT_S1B_03,'--','color',[0.00 0.44 0.74],'LineWidth',0.75,'MarkerIndices',1:1000:length(PT_S1B_03));

plot(Time_PT,PC_SBL_01,'--','color',[0.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:1000:length(PT_SBL_01));
plot(Time_PT,PT_SBL_02,'--','color',[0.00 0.00 1.00],'LineWidth',0.75,'MarkerIndices',1:1000:length(PT_SBL_02));

legend('PK(50,56)-SIM. S1B','PK(50,19)-SIM. BC','PK(3,40)-SIM. SBL',...
    'PT-S1B-01-EXP. S1B','PT-S1B-02-EXP. S1B','PT-S1B-03-EXP. S1B',...
    'PC-SBL-01-EXP. BC','PT-SBL-02-EXP. SBL','Location','northeast','NumColumns',3);
xlabel('Time [s]'); 
ylabel('Pressure [bar]'); 
xlim([0 170]);ylim([0 260]);
saveas(gcf,'PK-S1B-foc(0-170).tif');
xlim([164 165]);
saveas(gcf,'PK-S1B-foc(164-165).tif');
xlim([164 170]);
saveas(gcf,'PK-S1B-foc(164-170).tif');
hold off;




% (II) Temperature at TS, based on the rings order
% Ring 1
disp('    ');
disp(' (II) Temperature at different rings of Test Section: ');
disp('    ');
disp('  Ring 1 - Level 1-6 ');
figure(1);
plot(Time_simbf-0.005,TLK1_12_51,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_simbf-0.005,TLK1_12_54,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);
plot(Time_simbf-0.005,TLK1_12_57,'-','color',[0.00 0.00 0.00],'LineWidth',0.75);
plot(Time_simbf-0.005,TLK1_12_61,'-','color',[0.00 0.44 0.74],'LineWidth',0.75);
plot(Time_simbf-0.005,TLK1_12_63,'-','color',[0.63 0.07 0.18],'LineWidth',0.75);

plot(Time_TS,TC_R11_L1,'--','color',[1.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R11_L1));
plot(Time_TS,TC_R13_L1,'--','color',[0.00 0.00 1.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R13_L1)); 
plot(Time_TS,TC_R11_L2,'--','color',[0.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R11_L2)); 
plot(Time_TS,TC_R12_L2,'--','color',[0.00 0.50 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R12_L2)); 
plot(Time_TS,TC_R13_L2,'--','color',[0.00 0.44 0.74],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R13_L2));
plot(Time_TS,TC_R11_L3,'--','color',[0.63 0.07 0.18],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R11_L3));
plot(Time_TS,TC_R13_L3,'--','color',[0.43 0.07 0.18],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R13_L3));
plot(Time_TS,TC_R13_L5,'--','color',[0.85 0.32 0.09],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R13_L5));
plot(Time_TS,TC_R11_L6,'--','color',[0.25 0.90 0.10],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R11_L6));
plot(Time_TS,TC_R12_L6,'--','color',[0.30 0.30 0.80],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R12_L6));


legend('TLK1(12,51)-SIM.','TLK1(12,54)-SIM.','TLK1(12,57)-SIM.','TLK1(12,61)-SIM.','TLK1(12,63)-SIM.',...
    'TC-R11-L1-Exp.','TC-R13-L1-Exp.','TC-R11-L2-Exp.','TC-R12-L2-Exp.','TC-R13-L2-Exp.',...
    'TC-R12-L3-Exp.','TC-R13-L3-Exp.','TC-R13-L5-Exp.','TC-R11-L6-Exp.',...
    'TC-R12-L6-Exp.','Location','southeast','NumColumns',4);
xlabel('Time [s]'); 
ylabel('Temperature [°C]');
xlim([0 170]);ylim([200 450]);
text(130,420,'Ring 1- Levels 1,2,3,5,6','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R1-foc(0-170).tif');
xlim([164 170]);
text(168,420,'Ring 1- Levels 1,2,3,5,6','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R1-foc(164-170).tif');
hold off;


% Ring 2
disp('    ');
disp('  Ring 2 - level 2-4  ');
figure(1);
plot(Time_simbf-0.005,TLK1_19_54,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_simbf-0.005,TLK1_19_59,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);

plot(Time_TS,TC_R21_L2,'--','color',[1.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R21_L2)); 
plot(Time_TS,TC_R22_L2,'--','color',[0.00 0.00 1.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R22_L2)); 
plot(Time_TS,TC_R21_L4,'--','color',[0.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R21_L4)); 
plot(Time_TS,TC_R22_L4,'--','color',[0.00 0.50 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R22_L4));
plot(Time_TS,TC_R23_L4,'--','color',[0.00 0.44 0.74],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R23_L4));

legend('TLK1(19,54)-SIM.','TLK1(19,59)-SIM.',...
    'TC-R21-L2-Exp.','TC-R22-L2-Exp.','TC-R21-L4-Exp.','TC-R22-L4-Exp.','TC-R23-L4-Exp.','Location','southeast','NumColumns',2);
xlabel('Time [s]'); 
ylabel('Temperature [°C]');
xlim([0 170]);ylim([250 400]);
text(140,380,'Ring 2- Levels 2,4','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R2-foc(0-170).tif');
xlim([164 170]);
text(168.5,380,'Ring 2- Levels 2,4','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R2-foc(164-170).tif');
hold off;


% Ring 3 - level 1
disp('    ');
disp('  Ring 3 - Level 1');
figure(1);
plot(Time_simbf-0.005,TLK1_26_51,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_simbf-0.005,TLK1_28_51,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);

plot(Time_TS,TC_R31_L1,'--','color',[1.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R31_L1)); 
plot(Time_TS,TC_R32_L1,'--','color',[0.00 0.00 1.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R32_L1)); 
plot(Time_TS,TC_R33_L1,'--','color',[0.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R33_L1)); 
plot(Time_TS,TC_R34_L1,'--','color',[0.00 0.44 0.74],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R34_L1));
plot(Time_TS,TC_R35_L1,'--','color',[0.63 0.07 0.18],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R35_L1));

legend('TLK1(26,51)-SIM.','TLK1(28,51)-SIM.',...
    'TC-R31-L1-Exp.','TC-R32-L1-Exp.','TC-R33-L1-Exp.','TC-R34-L1-Exp.','TC-R35-L1-Exp.','Location','southeast','NumColumns',3);
xlabel('Time [s]'); 
ylabel('Temperature [°C]');
xlim([0 170]);ylim([280 380]);
text(140,360,'Ring 3- Level 1','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R3L1-foc(0-170).tif');
xlim([164 170]);ylim([280 380]);
text(169,360,'Ring 3- Level 1','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R3L1-foc(164-170).tif');
hold off;

% Ring 3 - level 2-5
disp('    ');
disp('  Ring 3 - Level 2-5 ');
figure(1);
plot(Time_simbf-0.005,TLK1_28_54,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_simbf-0.005,TLK1_26_57,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);
plot(Time_simbf-0.005,TLK1_28_59,'-','color',[0.00 0.00 0.00],'LineWidth',0.75);
plot(Time_simbf-0.005,TLK1_26_61,'-','color',[0.00 0.44 0.74],'LineWidth',0.75);

plot(Time_TS,TC_R32_L2,'--','color',[1.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R32_L2)); 
plot(Time_TS,TC_R33_L3,'--','color',[0.00 0.00 1.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R33_L3));
plot(Time_TS,TC_R31_L4,'--','color',[0.43 0.07 0.18],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R31_L4));
plot(Time_TS,TC_R33_L4,'--','color',[0.25 0.90 0.10],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R33_L4));
plot(Time_TS,TC_R31_L5,'--','color',[0.30 0.30 0.80],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R31_L5));
plot(Time_TS,TC_R32_L5,'--','color',[0.40 0.80 0.20],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R32_L5));
plot(Time_TS,TC_R33_L5,'--','color',[0.60 0.60 0.40],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R33_L5));

legend('TLK1(28,54)-SIM.','TLK1(26,57)-SIM.','TLK1(28,59)-SIM.','TLK1(26,61)-SIM.',...
    'TC-R32-L2-Exp.','TC-R33-L3-Exp.','TC-R31-L4-Exp.',...
    'TC-R33-L4-Exp.','TC-R31-L5-Exp.','TC-R32-L5-Exp.',...
    'TC-R33-L5-Exp.','Location','southeast','NumColumns',4);
xlabel('Time [s]'); 
ylabel('Temperature [°C]');
xlim([0 170]);ylim([280 380]);
text(140,360,'Ring 3- Levels 2-5','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R3L25-foc(0-170).tif');
xlim([164 170]);
text(168.5,360,'Ring 3- Levels 2-5','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R3L25-foc(164-170).tif');
hold off;


% Ring 3 - level 6
disp('    ');
disp('  Ring 3 - Level 6 ');
figure(1);
plot(Time_simbf-0.005,TLK1_26_63,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_simbf-0.005,TLK1_28_63,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);

plot(Time_TS,TC_R31_L6,'--','color',[1.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R31_L6)); 
plot(Time_TS,TC_R33_L6,'--','color',[0.00 0.00 1.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R33_L6)); 
plot(Time_TS,TC_R34_L6,'--','color',[0.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R34_L6)); 
plot(Time_TS,TC_R35_L6,'--','color',[0.00 0.44 0.74],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R35_L6));
plot(Time_TS,TC_R36_L6,'--','color',[0.63 0.07 0.18],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R36_L6));

legend('TLK1(26,63)-SIM.','TLK1(28,63)-SIM.',...
    'TC-R31-L6-Exp.','TC-R33-L6-Exp.','TC-R34-L6-Exp.',...
    'TC-R35-L6-Exp.','TC-R36-L6-Exp.','Location','southeast','NumColumns',3);
xlabel('Time [s]'); 
ylabel('Temperature [°C]');
xlim([0 170]);ylim([280 400]);
text(140,370,'Ring 3- Level 6','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R3L6-foc(0-170).tif');
xlim([164 170]);
text(168.5,370,'Ring 3- Level 6','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R3L6-foc(164-170).tif');
hold off;



% Ring 4 - Level 2-5 
disp('    ');
disp('  Ring 4 - Level 2-5  ');
figure(1);
plot(Time_simbf-0.005,TLK1_31_54,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_simbf-0.005,TLK1_31_57,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);
plot(Time_simbf-0.005,TLK1_31_59,'-','color',[0.00 0.00 0.00],'LineWidth',0.75);
plot(Time_simbf-0.005,TLK1_31_61,'-','color',[0.00 0.44 0.74],'LineWidth',0.75);

plot(Time_TS,TC_R41_L2,'--','color',[1.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R41_L2)); 
plot(Time_TS,TC_R42_L2,'--','color',[0.00 0.00 1.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R42_L2)); 
plot(Time_TS,TC_R41_L3,'--','color',[0.00 0.44 0.74],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R41_L3));
plot(Time_TS,TC_R42_L3,'--','color',[0.63 0.07 0.18],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R42_L3));
plot(Time_TS,TC_R41_L4,'--','color',[0.85 0.32 0.09],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R41_L4));
plot(Time_TS,TC_R43_L4,'--','color',[0.30 0.30 0.80],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R43_L4));
plot(Time_TS,TC_R42_L5,'--','color',[0.40 0.80 0.20],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R42_L5));
plot(Time_TS,TC_R43_L5,'--','color',[0.60 0.60 0.40],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R43_L5));

legend('TLK1(31,54)-SIM.','TLK1(31,57)-SIM.','TLK1(31,59)-SIM.','TLK1(31,61)-SIM.',...
    'TC-R41-L2-Exp.','TC-R42-L2-Exp.','TC-R41-L3-Exp.',...
    'TC-R42-L3-Exp.','TC-R41-L4-Exp.','TC-R43-L4-Exp.',...
    'TC-R42-L5-Exp.','TC-R43-L5-Exp.','Location','southeast','NumColumns',4);
xlabel('Time [s]'); 
ylabel('Temperature [°C]');
xlim([0 170]);ylim([280 380]);
text(140,360,'Ring 4- Levels 2-5','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R4-foc(0-170).tif');
xlim([164 170]);
text(168.5,360,'Ring 4- Levels 2-5','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R4-foc(164-170).tif');
hold off;


% Ring 5 - level 1-4
disp('    ');
disp('  Ring 5 - Level 1-4 ');
figure(1);
plot(Time_simbf-0.005,TLK1_35_51,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_simbf-0.005,TLK1_37_59,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);

plot(Time_TS,TC_R51_L1,'--','color',[1.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R51_L1)); 
plot(Time_TS,TC_R53_L1,'--','color',[0.00 0.00 1.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R53_L1)); 
plot(Time_TS,TC_R53_L4,'--','color',[0.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R53_L4)); 

legend('TLK1(35,51)-SIM.','TLK1(37,59)-SIM.',...
    'TC-R51-L1-Exp.','TC-R53-L1-Exp.','TC-R53-L4-Exp.','Location','southeast','NumColumns',2);
xlabel('Time [s]'); 
ylabel('Temperature [°C]');
xlim([0 170]);ylim([300 360]);
text(140,340,'Ring 5- Levels 1,4','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R5-foc(0-170).tif');
xlim([164 170]);
text(168.5,340,'Ring 5- Levels 1,4','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R5-foc(164-170).tif');
hold off;

TC-R61-L3	TC-R63-L3	TC-R61-L5	TC-R63-L5	TC-R61-L6	TC-R62-L6	TC-R63-L6


% Ring 6 - level 3-6
disp('    ');
disp('  Ring 6 - Level 3-6 ');
figure(1);
plot(Time_simbf-0.005,TLK1_41_57,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_simbf-0.005,TLK1_41_61,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);
plot(Time_simbf-0.005,TLK1_41_63,'-','color',[0.00 0.00 0.00],'LineWidth',0.75);

plot(Time_TS,TC_R61_L3,'--','color',[1.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R61_L3));  
plot(Time_TS,TC_R63_L3,'--','color',[0.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R63_L3));
plot(Time_TS,TC_R61_L5,'--','color',[0.43 0.20 0.60],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R61_L5));
plot(Time_TS,TC_R63_L5,'--','color',[0.85 0.32 0.09],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R63_L5));
plot(Time_TS,TC_R61_L6,'--','color',[0.25 0.90 0.10],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R61_L6));
plot(Time_TS,TC_R62_L6,'--','color',[0.30 0.30 0.80],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R62_L6));
plot(Time_TS,TC_R63_L6,'--','color',[0.40 0.80 0.20],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_R63_L6));

legend('TLK1(41,57)-SIM.','TLK1(41,61)-SIM.','TLK1(41,63)-SIM.',...
    'TC-R61-L3-Exp.','TC-R63-L3-Exp.','TC-R61-L5-Exp.',...
    'TC-R63-L5-Exp.','TC-R61-L6-Exp.',...
    'TC-R62-L6-Exp.','TC-R63-L6-Exp.','Location','southeast','NumColumns',3);
xlabel('Time [s]'); 
ylabel('Temperature [°C]');
xlim([0 170]);ylim([280 360]);
text(140,340,'Ring 6- Levels 3,5,6','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R6-foc(0-170).tif');
xlim([164 170]);ylim([280 360]);
text(168.5,340,'Ring 6- Levels 3,5,6','Color',[0.1 0.1 0.15]);
saveas(gcf,'TS-R6-foc(164-170).tif');
hold off;



% (III) Temperature in SBL 
disp('    ');
disp(' (III) Temperature at the TCs position in SBL: TC-SBL-04/05 versus TGK(50,10) and TLK3(3,40) ');
disp('  ');
figure(1);
plot(Time_simbf-0.005,TGK_50_19,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_simbf-0.005,TGK_3_40,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);
plot(Time_simbf-0.005,TLK3_3_40,'-','color',[0.00 0.00 0.00],'LineWidth',0.75);

plot(Time_TC,TC_SBL_01,'--','color',[1.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:1000:length(TC_SBL_04));
plot(Time_TC,TC_SBL_05,'--','color',[0.00 0.00 1.00],'LineWidth',0.75,'MarkerIndices',1:1000:length(TC_SBL_05));

legend('TGK(50,19)-SIM. BC','TGK(3,40)-SIM. Argon','TLK3(3,40)-SIM. Water',...
    'TC-SBL-01-EXP. BC','TC-SBL-05-EXP. Mixture',...
    'Location','northeast','NumColumns',2);
xlabel('Time [s]'); 
ylabel('Temperature [°C]');
xlim([0 170]);ylim([0 1000]);
saveas(gcf,'TC-SBL-foc(0-170).tif');
xlim([164 170]);ylim([0 1000]);
saveas(gcf,'TC-SBL-foc(164-170).tif');
hold off;




% (IV) Volume of gas in macro-regions
disp('    ');
disp(' (IV) GVOL in Macroregions ');
figure(1);
plot(Time_bfcal-0.005,GVOL_1_1,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_bfcal-0.005,GVOL_1_2,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);
plot(Time_bfcal-0.005,GVOL_1_3,'-','color',[0.00 0.00 0.00],'LineWidth',0.75);
plot(Time_bfcal-0.005,GVOL_1_4,'-','color',[0.10 0.40 0.70],'LineWidth',0.75);
plot(Time_bfcal-0.005,GVOL_1_7,'-','color',[0.70 0.40 0.10],'LineWidth',0.75);
plot(Time_bfcal-0.005,GVOL_1_8,'-','color',[0.50 0.50 0.50],'LineWidth',0.75);
plot(Time_bfcal-0.005,GVOL_1_9,'-','color',[0.20 0.50 0.20],'LineWidth',0.75);

legend('GVOL(1)-SIM.','GVOL(2)-SIM.','GVOL(3)-SIM.','GVOL(4)-SIM.',...
    'GVOL(7)-SIM.','GVOL(8)-SIM.','GVOL(9)-SIM.','Location','northeast','NumColumns',3);
xlabel('Time [s]'); 
ylabel('Volume [m3]');
xlim([0 170]);ylim([-0.0001 0.0035]);
saveas(gcf,'GVOL-foc(0-170).tif');
xlim([164 170]);ylim([-0.0001 0.0035]);
saveas(gcf,'GVOL-foc(164-170).tif');
hold off;



% (V) Mass of PbLi in macro-regions
disp('    ');
disp(' (V) MASF in Macroregions ');
figure(1);
plot(Time_bfcal-0.005,MASF_1_1,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_bfcal-0.005,MASF_1_2,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);
plot(Time_bfcal-0.005,MASF_1_3,'-','color',[0.00 0.00 0.00],'LineWidth',0.75);
plot(Time_bfcal-0.005,MASF_1_4,'-','color',[0.10 0.40 0.70],'LineWidth',0.75);
plot(Time_bfcal-0.005,MASF_1_7,'-','color',[0.70 0.40 0.10],'LineWidth',0.75);
plot(Time_bfcal-0.005,MASF_1_8,'-','color',[0.50 0.50 0.50],'LineWidth',0.75);
plot(Time_bfcal-0.005,MASF_1_9,'-','color',[0.20 0.50 0.20],'LineWidth',0.75);

legend('MASF(1)-SIM.','MASF(2)-SIM.','MASF(3)-SIM.','MASF(4)-SIM.',...
    'MASF(7)-SIM.','MASF(8)-SIM.','MASF(9)-SIM.','Location','northeast','NumColumns',3);
xlabel('Time [s]'); 
ylabel('Mass [kg]');
xlim([0 170]);ylim([-10 300]);
saveas(gcf,'MASF-foc(0-170).tif');
xlim([164 170]);ylim([-10 300]);
saveas(gcf,'MASF-foc(164-170).tif');
hold off;



% (VI) Mass of H2O in macro-regions
disp('    ');
disp(' (VI) MASN in Macroregions ');
MASN_1_6(1,1) = 0.05;
figure(1);
plot(Time_bfcal-0.005,MASN_1_1*1000,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_bfcal-0.005,MASN_1_2*1000,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);
 
plot(Time_bfcal-0.005,MASN_1_4*1000,'-','color',[0.00 0.00 0.00],'LineWidth',0.75);
plot(Time_bfcal-0.005,MASN_1_6*1000,'-','color',[0.20 0.50 0.20],'LineWidth',0.75);
plot(Time_bfcal-0.005,MASN_1_7*1000,'-','color',[1.00 0.50 1.00],'LineWidth',0.75);
plot(Time_bfcal-0.005,MASN_1_8*1000,'-','color',[0.50 0.50 0.70],'LineWidth',0.75);
plot(Time_bfcal-0.005,MASN_1_9*1000,'-','color',[0.70 0.50 0.20],'LineWidth',0.75);

legend('MASN(1)-SIM.','MASN(2)-SIM.','MASN(4)-SIM.','MASN(6)-SIM.','MASN(7)-SIM.',...
    'MASN(8)-SIM.','MASN(9)-SIM.','MASN(9)-SIM.','Location','northeast','NumColumns',3);
xlabel('Time [s]'); 
ylabel('Mass [g]');
xlim([0.0 170]);ylim([-10 60]);
saveas(gcf,'MASN-foc(0-170).tif');
xlim([164 170]);ylim([-10 60]);
saveas(gcf,'MASN-foc(164-170).tif');
hold off;



% (VII) Mass of L/V H2O in macro-regions
disp('    ');
disp(' (VII) MASN1 and MASN2 in Macroregions ');
figure(1);
plot(Time_bfcal-0.005,MASN1_1_1*1000,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_bfcal-0.005,MASN1_1_4*1000,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);
 
plot(Time_bfcal-0.005,MASN2_1_1*1000,'-','color',[0.00 0.00 0.00],'LineWidth',0.75);
plot(Time_bfcal-0.005,MASN2_1_4*1000,'-','color',[0.00 1.00 1.00],'LineWidth',0.75);

legend('MASN1(1)-SIM. liquid H2O','MASN1(4)-SIM. liquid H2O',...
    'MASN2(1)-SIM. vapor H2O','MASN2(4)-SIM. vapor H2O',...
    'Location','northeast','NumColumns',2);
xlabel('Time [s]'); 
ylabel('Mass [g]');
xlim([0.0 170]);ylim([-0.5 2.5]);
saveas(gcf,'MASN12-foc(0-170).tif');
xlim([164 170]);ylim([-0.5 2.5]);
saveas(gcf,'MASN12-foc(164-170).tif');
hold off;



% (VIII) Mass flow rate of H2O and PbLi in macro-regions
disp('    ');
disp('  (VIII) TFLUXF and TFLUXN in Macroregions ');
figure(1);
plot(Time_bfcal-0.005,TFLUXF_1_3,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_bfcal-0.005,-TFLUXN_1_3,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);

legend('TFLUXF(3)-SIM. PbLi','TFLUXN(3)-SIM. H2O',...
        'Location','northeast','NumColumns',1);
xlabel('Time [s]'); 
ylabel('Flow rate [kg/s]');
xlim([0.0 170]);ylim([-0.1 0.6]);
saveas(gcf,'TFLUXF-foc(0-170).tif');
xlim([164 170]);ylim([-0.1 0.6]);
saveas(gcf,'TFLUXF-foc(164-170).tif');
hold off;



% (VIIII) Average temperature inside the S1B, Test section
disp('    ');
disp(' (VIIII) Test section: Average temperature of PbLi inside S1B vessel  ');
figure(1);
plot(Time_simbf-0.005,Average_SIM,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on
plot(Time_bfcal-0.005,TMPALL_1_1-10,'-','color',[0.00 0.00 1.00],'LineWidth',0.75,'MarkerIndices',1:10:length(Average_EXP));
plot(Time_TS,Average_EXP,'-','color',[0.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(Average_EXP)); 
legend('Pointwise averaged Temperature of liquid PbLi in S1B-SIM.',...
       'Overall averaged Temperature of liquid phase in S1B-SIM.',...
       'Pointwise averaged Temperature of TCs in TS-EXP.',...
       'Location','northeast','NumColumns',1);
xlabel('Time [s]'); 
ylabel('Temperature [°C]');
xlim([0 170]);ylim([310 335]);
saveas(gcf,'Average-foc(0-170).tif');
xlim([164 170]);ylim([310 335]);
saveas(gcf,'Average-foc(164-170).tif');
hold off;



% (X) Pressures in S1B
disp('    ');
disp(' (X) Pressure at PC-S1B-01 and PT-S1B-04 versus PK(47,82) and PK(30,79) ');
figure(1);
PK_47_82(:) = PK_47_82(:)/1.D5; PK_30_79(:) = PK_30_79(:)/1.D5;

plot(Time_simbf-0.005,PK_47_82-2,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_simbf-0.005,PK_30_79-2,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);
plot(Time_PT,PC_S1B_01,'--','color',[1.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:1000:length(PT_S1B_01));
plot(Time_PT,PT_S1B_04,'--','color',[0.00 0.00 1.00],'LineWidth',0.75,'MarkerIndices',1:1000:length(PT_S1B_01));

legend('PK(47,82)-SIM. S1B', 'PK(30,79)-SIM. S1B','PC-S1B-01-EXP. S1B','PT-S1B-04-EXP. S1B',...
     'Location','northeast','NumColumns',2);
xlabel('Time [s]'); 
ylabel('Pressure [bar]');
xlim([0 170]);ylim([0 30]);
saveas(gcf,'PC-S1B-foc(0-170).tif');
xlim([164 170]);
saveas(gcf,'PC-S1B-foc(164-170).tif');
hold off;



% TCs at the top flange
disp('    ');
disp('  TC-S1B-L1 and TC-S1B-L2 ');
figure(1);
plot(Time_simbf-0.005,TLK1_41_69,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on;
plot(Time_simbf-0.005,TLK1_41_72,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);

plot(Time_LT,TC_S1B_L2,'--','color',[1.00 0.00 0.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_S1B_L2)); 
plot(Time_LT,TC_S1B_L1,'--','color',[0.00 0.00 1.00],'LineWidth',0.75,'MarkerIndices',1:10:length(TC_S1B_L1)); 

legend('TLK1(41,69)-SIM.','TLK1(41,72)-SIM.',...
    'TC-S1B-L1-Exp.','TC-S1B-L2-Exp.','Location','northeast','NumColumns',2);
xlabel('Time [s]'); 
ylabel('Temperature [°C]');
xlim([0 170]);ylim([100 600]);
saveas(gcf,'TC-S1B-foc(0-170).tif');
xlim([164 170]);ylim([100 600]);
saveas(gcf,'TC-S1B-foc(164-170).tif');
hold off;



% (XI) Hydrogen production rate in the S1B
x=zeros(Lsim,1);y=zeros(Lsim,1);z=zeros(Lsim,1);
x(:,1)=2.7; y(:,1)=5.5; z(:,1)=1.13;
disp('    ');
disp(' (X) Hydrogen produced in the S1B vessel (g)  ');
figure(1);  
plot(Time_bfcal-0.005,H2*100-4.6,'-','color',[1.00 0.00 0.00],'LineWidth',0.75); hold on
plot(Time_simbf-0.005,z,'-','color',[0.00 0.00 1.00],'LineWidth',0.75);
plot(Time_simbf-0.005,x,'--','color',[0.00 0.00 0.00],'LineWidth',0.75);
plot(Time_simbf-0.005,y,'--','color',[0.00 1.00 1.00],'LineWidth',0.75);

legend('H2 mass-SIM.',...
    'H2 mass based on stochiometry- minimum',...
    'H2 mass based on stochiometry- maximum','Location','northeast','NumColumns',1);
xlabel('Time [s]'); 
ylabel('Mass [g]');
xlim([0 170]);ylim([0 8]);
saveas(gcf,'H2-foc(0-170).tif');
xlim([164 170]);ylim([0 8]);
saveas(gcf,'H2-foc(164-170).tif');
hold off; 


cd 'D:\Samad\PhDThesis\Post-test processing -Tests D3.1';
