%% ==============================================================================================
%  Function: Calculation of the predicted CSR ecological strategy change across biomes from the historical period (1970-2000)
%  to 2040, 2060, 2080, 2100 under CMIP6 future climate scenarios, based on 10 global climate models (GCMs; see Materials) for SSP126, SSP245, SSP370, and SSP585.
%
%  Author: Jing Wang
%  Date: 2025/08/08
%% ==============================================================================================
function Step8_1_plotCSRpred_PFT_test
%% get "meanvect.mat" for original PFT strategy
%% get "C/S/Rstra_mean.mat" for predicted PFT strategy
load("Cstra_mean.mat")
load("Sstra_mean.mat")
load("Rstra_mean.mat")
load('meanvect_res.mat')
numClasses = 16;
ori_meanPFT=meanvect';
for i=1:4
C_meanPFT_year=squeeze(mean(reshape(Cstra_mean(:,:,i),[10,4,numClasses]),1,'omitnan'));
S_meanPFT_year=squeeze(mean(reshape(Sstra_mean(:,:,i),[10,4,numClasses]),1,'omitnan'));
R_meanPFT_year=squeeze(mean(reshape(Rstra_mean(:,:,i),[10,4,numClasses]),1,'omitnan'));

change_meanPFT_year_S1=[C_meanPFT_year(1,:)-ori_meanPFT(1,:);S_meanPFT_year(1,:)-ori_meanPFT(2,:);R_meanPFT_year(1,:)-ori_meanPFT(3,:)]';
change_meanPFT_year_S2=[C_meanPFT_year(2,:)-ori_meanPFT(1,:);S_meanPFT_year(2,:)-ori_meanPFT(2,:);R_meanPFT_year(2,:)-ori_meanPFT(3,:)]';
change_meanPFT_year_S3=[C_meanPFT_year(3,:)-ori_meanPFT(1,:);S_meanPFT_year(3,:)-ori_meanPFT(2,:);R_meanPFT_year(3,:)-ori_meanPFT(3,:)]';
change_meanPFT_year_S4=[C_meanPFT_year(4,:)-ori_meanPFT(1,:);S_meanPFT_year(4,:)-ori_meanPFT(2,:);R_meanPFT_year(4,:)-ori_meanPFT(3,:)]';

plot_csr_bar(change_meanPFT_year_S1)
plot_csr_bar(change_meanPFT_year_S2)
plot_csr_bar(change_meanPFT_year_S3)
plot_csr_bar(change_meanPFT_year_S4)
end

function plot_csr_bar(change_meanPFT)
% X = categorical({'Tundra','Tropical & Subtropical Moist Broadleaf Forests','Mediterranean Forests, Woodlands & Scrub','Deserts & Xeric Shrublands','Temperate Grasslands, Savannas & Shrublands','Boreal Forests/Taiga','Temperate Conifer Forests','Temperate Broadleaf & Mixed Forests','Montane Grasslands & Shrublands','Mangroves','Flooded Grasslands & Savannas','Tropical & Subtropical Grasslands, Savannas & Shrublands','Tropical & Subtropical Dry Broadleaf Forests','Tropical & Subtropical Coniferous Forests','N/A'});
X = categorical({'TDR','TSMBF','MFWS','DXS','TGSS','BFT','TCF','TBMF','MGS','MGR','FGS','TSGSS','TSDBF','TSCF','CRPL'});
figure;ba1=bar(X,change_meanPFT(2:end,:),'FaceColor','flat');
ba1(1).CData = [171 217 233]/255;%[1 0 0]
ba1(2).CData = [241 182 218]/255;%[0 1 0]
ba1(3).CData = [255 255 191]/255;%[0 0 1]
legend('C','S','R');
ylabel('Strategy (%)');
xlabel('Biome');
set(gca,'linewidth',1,'FontSize',14)