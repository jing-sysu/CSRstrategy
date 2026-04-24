%% ==============================================================================================
%  Function: Calculation of CSR ecological strategy using three key functional traits
%  Method adopted from: Pierce, S., et al. A global method for calculating plant CSR ecological
%                       strategies applied across biomes world-wide. Functional Ecology, 31, 444-457,
%                       DOI: 10.1111/1365-2435.12722 (2017)
%
%  Author: Jing Wang
%  Date: 2025/08/08
%% ==============================================================================================
function [C_stra,S_stra,R_stra]=Step2_StrateFyCalc(LA,LDMC,SLA)% LA (mm2), LDMC (%), SLA (mm2/mg)
J5=LA;
K5=LDMC;
L5=SLA;

AA5=J5./L5;
Z5=(100./K5).*AA5;
AB5=(Z5-AA5)./(J5./10);

%AD5=IF(AB5>5, ((100-(AA5*100)/Z5)), ((AA5*100)/Z5));
AD5=(100-(AA5.*100)./Z5).*(AB5>5)+(AA5.*100)./Z5.*(AB5<=5);

AE5=sqrt(J5./894205).*100;
AF5=log((AD5./100)./(1-(AD5./100)));
AG5=log(L5);

AH5=-0.8678 + 1.6464 .* AE5;
AI5=1.3369+0.000010019.*(1-exp(-0.0000000000022303.*AF5))+4.5835.*(1-exp(-0.2328*AF5));
AJ5=-57.5924 + 62.6802.*exp(-0.0288.*AG5);

AQ5=57.3756711966087;
AK5=0;
AR5=5.79158377609218;
AL5=-0.756451214853076;
AS5=1.10795515716546;
AM5=-11.3467682227961;
AW5=abs(AK5);
AX5=abs(AL5);
AY5=abs(AM5);

AN5=max(AK5,AH5);%IF(AH5<AK5,AK5,AH5);
AO5=max(AL5,AI5);%IF(AI5<AL5,AL5,AI5);
AP5=max(AM5,AJ5);%IF(AJ5<AM5,AM5,AJ5);

AT5=min(AQ5,AN5);%IF(AN5>AQ5,AQ5,AN5);
AU5=min(AR5,AO5);%IF(AO5>AR5,AR5,AO5);
AV5=min(AS5,AP5);%IF(AP5>AS5,AS5,AP5);

AZ5=AT5+AW5;
BC5=AQ5+(abs(AK5));
BA5=AU5+AX5;
BD5=AR5+(abs(AL5));
BB5=AV5+AY5;
BE5=AS5+(abs(AM5));

BF5=(AZ5./BC5.*100);
BG5=(BA5./BD5.*100);
BH5=(100-(BB5./BE5.*100));
BI5=100./(BF5+BG5+BH5);

C_stra=BF5.*BI5;
S_stra=BG5.*BI5;
R_stra=BH5.*BI5;

C_stra(isnan(SLA) | isnan(LDMC) | isnan(LA))=nan;
S_stra(isnan(SLA) | isnan(LDMC) | isnan(LA))=nan;
R_stra(isnan(SLA) | isnan(LDMC) | isnan(LA))=nan;

