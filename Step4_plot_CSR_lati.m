%% ==============================================================================================
%  Function: Plot of CSR ecological strategy along latitudes and biomes
%
%  Author: Jing Wang
%  Date: 2025/08/08; updated: 2026/03/15
%% ==============================================================================================
function Step4_plot_CSR_lati
clear
clc
%% read gpp data
[C_stra,Cstra_info]=readgeoraster('C_stra.tif');%('C_stra.tif');
[S_stra,~]=readgeoraster('S_stra.tif');
[R_stra,~]=readgeoraster('R_stra.tif');

[C_stra_XX,C_stra_YY]=meshgrid(1:size(C_stra,2),1:size(C_stra,1));
C_stra_X=Cstra_info.LongitudeLimits(1)+Cstra_info.CellExtentInLongitude*(C_stra_XX-1);
C_stra_Y=Cstra_info.LatitudeLimits(2)-Cstra_info.CellExtentInLatitude*(C_stra_YY-1);
%% plot spatial distribution along biomes and cropland
[biome,bio_info]=readgeoraster('D:\learning_SYSU\CSR\Ecoregions2017\biomename.tif');

[col,row]=geographicToIntrinsic(bio_info,C_stra_Y,C_stra_X);
col(col>size(biome,2))=size(biome,2);

row=single(round(row));
col=single(round(col));
ind=row+(col-1)*size(biome,1);
bio_subimage=single(biome(ind));


[USGS,USGS_info]=readgeoraster('D:\learning_SYSU\CSR\Ecoregions2017\MCD12C1_061_IGBP.tif');
USGS_info=Cstra_info;
USGS_info.LatitudeLimits=[-90,90];
USGS_info.LongitudeLimits=[-180,180];
USGS_info.RasterSize = [size(USGS,1),size(USGS,2)];

[bio_col,bio_row]=geographicToIntrinsic(USGS_info,C_stra_Y,C_stra_X);
bio_col(bio_col>size(USGS,2))=size(USGS,2);
bio_row(bio_row>size(USGS,1))=size(USGS,1);
bio_col(bio_col<1)=1;
bio_row(bio_row<1)=1;

bio_row=single(round(bio_row));
bio_col=single(round(bio_col));
bio_ind=bio_row+(bio_col-1)*size(USGS,1);
USGS_subimage=uint8(USGS(bio_ind));

class_bio=unique(bio_subimage);% 0 and 15 is NAN
numClasses = numel(class_bio);
meanvect=zeros(numClasses,3);
stdvect=zeros(numClasses,3);
for i = 2:numClasses-1
    Ri = (bio_subimage==class_bio(i)); % Get indices of the elements from the ith class
    meanvect(i,1) = mean(C_stra(Ri),'omitnan'); % Calculate their mean
    stdvect(i,1)= std(C_stra(Ri),'omitnan'); % Calculate their covariance
    meanvect(i,2) = mean(S_stra(Ri),'omitnan'); % Calculate their mean
    stdvect(i,2)= std(S_stra(Ri),'omitnan'); % Calculate their covariance
    meanvect(i,3) = mean(R_stra(Ri),'omitnan'); % Calculate their mean
    stdvect(i,3)= std(R_stra(Ri),'omitnan'); % Calculate their covariance
end
crop_mask=USGS_subimage==12| USGS_subimage==14;% cropland USGS_subimage==13| %urban
meanvect(numClasses,1) = mean(C_stra(crop_mask),'omitnan'); % Calculate their mean
stdvect(numClasses,1)= std(C_stra(crop_mask),'omitnan'); % Calculate their covariance
meanvect(numClasses,2) = mean(S_stra(crop_mask),'omitnan'); % Calculate their mean
stdvect(numClasses,2)= std(S_stra(crop_mask),'omitnan'); % Calculate their covariance
meanvect(numClasses,3) = mean(R_stra(crop_mask),'omitnan'); % Calculate their mean
stdvect(numClasses,3)= std(R_stra(crop_mask),'omitnan'); % Calculate their covariance
    
% X = categorical({'Tundra','Tropical & Subtropical Moist Broadleaf Forests','Mediterranean Forests, Woodlands & Scrub','Deserts & Xeric Shrublands','Temperate Grasslands, Savannas & Shrublands','Boreal Forests/Taiga','Temperate Conifer Forests','Temperate Broadleaf & Mixed Forests','Montane Grasslands & Shrublands','Mangroves','Flooded Grasslands & Savannas','Tropical & Subtropical Grasslands, Savannas & Shrublands','Tropical & Subtropical Dry Broadleaf Forests','Tropical & Subtropical Coniferous Forests','N/A'});
figure;ba1=bar([1:15],meanvect(2:end,:),'FaceColor','flat');
ba1(1).CData = [171 217 233]/255;%[1 0 0]
ba1(2).CData = [241 182 218]/255;%[0 1 0]
ba1(3).CData = [255 255 191]/255;%[0 0 1]

hold on;
er = errorbar([1:15]-0.22,meanvect(2:end,1),stdvect(2:end,1));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
er = errorbar([1:15],meanvect(2:end,2),stdvect(2:end,2));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
er = errorbar([1:15]+0.22,meanvect(2:end,3),stdvect(2:end,3));    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off
xticklabels({'TDR','TSMBF','MFWS','DXS','TGSS','BFT','TCF','TBMF','MGS','MGR','FGS','TSGSS','TSDBF','TSCF','CRPL'})
set(gcf,'Position', [10 10 1200 600]);
xlabel('Biome');
ylabel('Strategy (%)');
fontsize(gcf, 22, "points")

%% plot spatial distribution along latitude
lat=C_stra_Y(:,1);
C_latim=mean(C_stra,2,'omitnan');
C_latisd=std(C_stra,[],2,'omitnan');
S_latim=mean(S_stra,2,'omitnan');
S_latisd=std(S_stra,[],2,'omitnan');
R_latim=mean(R_stra,2,'omitnan');
R_latisd=std(R_stra,[],2,'omitnan');
% plot shade error
c = shadedErrorBar(lat,C_latim,C_latisd,'lineprops','-c','transparent',true,'patchSaturation',0.33); 
hold on;
s=shadedErrorBar(lat,S_latim,S_latisd,'lineprops','-m','transparent',true,'patchSaturation',0.33);
r=shadedErrorBar(lat,R_latim,R_latisd,'lineprops','-y','transparent',true,'patchSaturation',0.33);
% Set face and edge properties
set(c.edge,'LineStyle','none')
c.mainLine.LineWidth = 2;
c.mainLine.Color = [44,123,182]/255;
c.patch.FaceColor = [171 217 233]/255;
set(s.edge,'LineStyle','none')
s.mainLine.LineWidth = 2;
s.mainLine.Color = [208,28,139]/255;
s.patch.FaceColor = [241 182 218]/255;
set(r.edge,'LineStyle','none')
r.mainLine.LineWidth = 2;
r.mainLine.Color = [255,255,0]/255;
r.patch.FaceColor = [255 255 100]/255;
box on
xlabel('Latitude');
ylabel('Strategy (%)');
fontsize(gcf, 18, "points")
xlim([-60,83])
ylim([-3,100])
xticks([-60:20:80])
yticks([0:20:100])
set(gcf,'Position', [10 10 600 400]);

