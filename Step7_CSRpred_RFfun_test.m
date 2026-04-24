%% ==============================================================================================
%  Function: Prediction of CSR ecological strategy using RF models using
%  SoilGrid and World climate data
%
%  Author: Jing Wang
%  Date: 2025/08/08
%% ==============================================================================================
function Step7_CSRpred_RFfun_test
%% read gpp data
[C_stra,Cstra_info]=readgeoraster('C_stra.tif');%('C_stra.tif');
% geoinfo = geotiffinfo('S_stra1.tif');
% geoTags = geoinfo.GeoTIFFTags.GeoKeyDirectoryTag;
% [S_stra,~]=readgeoraster('S_stra.tif');
% [R_stra,~]=readgeoraster('R_stra.tif');

[C_stra_XX,C_stra_YY]=meshgrid(1:size(C_stra,2),1:size(C_stra,1));
C_stra_X=Cstra_info.LongitudeLimits(1)+Cstra_info.CellExtentInLongitude*(C_stra_XX-1);
C_stra_Y=Cstra_info.LatitudeLimits(2)-Cstra_info.CellExtentInLatitude*(C_stra_YY-1);
clear C_stra_XX C_stra_YY 

[soil_image1,~]=readgeoraster('D:\learning_SYSU\CSR\Soilgrid\soil_all_layer_5bandtif.tif');
soil_image1=single(soil_image1);
soil_nan=sum(isnan(soil_image1),3)>0;
soil_image1=reshape(soil_image1,size(soil_image1,1)*size(soil_image1,2),size(soil_image1,3));
sl_varname={'bdod','cec','nit','ocd','soc'};%'ocs',,'silt','sand','phh2o','clay','cfvo'

file_dir='D:\learning_SYSU\CSR\wc2.1_2.5m\wc2.1_2.5m_history\';
wc_dir=dir(strcat(file_dir,'wc2.1_2.5m_bio*'));% file dir
wc_varname={'AMT','DRT','IsoT','SDT','WarmMT','ColdMT','ART','WetQT','DryQT','WarmQT','ColdQT','AP','WetMP','DryMP','CVP','WetQP','DryQP','WarmQP','ColdQP'};%,'Elev'
ws_varname=[wc_varname,sl_varname];

[bio1_subimage,ind]=transf_img(file_dir,wc_dir(1).name,C_stra_Y,C_stra_X);
valid_num=~(isnan(C_stra) | isnan(bio1_subimage) | soil_nan);

stra_var=C_stra(valid_num);
soil_var=soil_image1(valid_num(:),:);
clear C_stra soil_image1

bio_var=zeros(sum(valid_num(:)),length(wc_dir));
bio_var(:,1)=bio1_subimage(valid_num);
for m=2:length(wc_dir)
    [bio1_image,~]=readgeoraster([file_dir,wc_dir(m).name]);
    bio1_image=single(bio1_image);
    bio1_subimage=single(bio1_image(ind));

    bio_var(:,m)=bio1_subimage(valid_num);
end

clear C_stra_Y C_stra_X bio1_subimage

% rand_num = randperm(sum(valid_num(:)));
load rand_num 
numn=500000;
bio_var=normalize([bio_var,soil_var]);
Mdl=RFfun([bio_var(rand_num(1:numn),:)],stra_var(rand_num(1:numn)),ws_varname);%,soil_var(rand_num(1:numn),:)
yvalHat = predict(Mdl,[bio_var(rand_num(numn+1:end),:)]);%,soil_var(rand_num(numn+1:end),:)
valR2 = corr(stra_var(rand_num(numn+1:end),:),yvalHat)^2
clear bio_var valid_num ind soil_var
%%Predictor Importance Estimation
% impOOB = oobPermutedPredictorImportance(Mdl);
%Compare the predictor importance estimates.
% figure
% bar(impOOB)
% title('Unbiased Predictor Importance Estimates')
% xlabel('Predictor variable')
% ylabel('Importance')
% h = gca;
% h.XTickLabel = Mdl.PredictorNames;
% h.XTickLabelRotation = 45;
% h.TickLabelInterpreter = 'none';
% h.XTickLabel=ws_varname;

% figure
% [imp_sort,impind_sort]=sort(impOOB);
% barh(1:length(impind_sort),imp_sort)
% ylabel('Predictor variable')
% xlabel('Importance')
% h = gca;
% yticks(1:length(impind_sort))
% h.YTickLabel=ws_varname(impind_sort);
% 
%Compare predictor importance estimates by permuting out-of-bag observations and those estimates obtained by summing gains in the mean squared error due to splits on each predictor. 
% [impGain,predAssociation] = predictorImportance(Mdl);
% figure
% plot(1:numel(Mdl.PredictorNames),[impOOB' impGain'])
% title('Predictor Importance Estimation Comparison')
% xlabel('Predictor variable')
% ylabel('Importance')
% h = gca;
% h.XTickLabel = Mdl.PredictorNames;
% h.XTickLabelRotation = 45;
% h.TickLabelInterpreter = 'none';
% legend('OOB permuted','MSE improvement')
% grid on
% plot Predictive Measure of Association; the similarity between decision rules that split observations. 
% figure
% imagesc(predAssociation)
% title('Predictor Association Estimates')
% colorbar
% h = gca;
% h.XTickLabel = Mdl.PredictorNames;
% h.XTickLabelRotation = 45;
% h.TickLabelInterpreter = 'none';
% h.YTickLabel = Mdl.PredictorNames;

%% predict CSR strategy
load ind_res5.mat
load soil_var.mat
load valid_num_res5.mat
newfile_dir='D:\learning_SYSU\CSR\wc2.1_2.5m\wc2.1_2.5m_future\';
newwc_dir1=dir(strcat(newfile_dir,'wc2.1_2.5m_bioc_*'));% file dir
% ele_image=imread('D:\learning_SYSU\CSR\wc2.1_2.5m\wc2.1_2.5m_history\wc2.1_2.5m_elev.tif');
for m=1:length(newwc_dir1)
    newwc_dir2=dir(strcat(newfile_dir,newwc_dir1(m).name,'\wc2.1_2.5m_bioc_*'));% file dir
    RF_fitstra=zeros(size(soil_var,1),length(newwc_dir2));
    for n=1:length(newwc_dir2)
        [bio1_image,~]=readgeoraster([newfile_dir,newwc_dir1(m).name,'\',newwc_dir2(n).name]);
        bio1_image=single(bio1_image);
        bio1_image=reshape(bio1_image,size(bio1_image,1)*size(bio1_image,2),size(bio1_image,3));
        bio1_subimage=[bio1_image(ind,:)];%,single(ele_image(ind(:)))
        bio1_var=[bio1_subimage(valid_num(:),:),soil_var];
        bio1_var=normalize(bio1_var);

        RF_fitstra(:,n) = predict(Mdl,[bio1_var]);%,soil_var
    end
    RF_fitstra_ssp126=RF_fitstra(:,1:4);
    save(['RF_fitstra_C_',newwc_dir1(m).name(17:end),'_ssp126.mat'],"RF_fitstra_ssp126");
    clear RF_fitstra_ssp126
    RF_fitstra_ssp245=RF_fitstra(:,5:8);
    save(['RF_fitstra_C_',newwc_dir1(m).name(17:end),'_ssp245.mat'],"RF_fitstra_ssp245");
    clear RF_fitstra_ssp245
    RF_fitstra_ssp370=RF_fitstra(:,9:12);
    save(['RF_fitstra_C_',newwc_dir1(m).name(17:end),'_ssp370.mat'],"RF_fitstra_ssp370");
    clear RF_fitstra_ssp370
    RF_fitstra_ssp585=RF_fitstra(:,13:16);
    save(['RF_fitstra_C_',newwc_dir1(m).name(17:end),'_ssp585.mat'],"RF_fitstra_ssp585");
    clear RF_fitstra_ssp585
    clear RF_fitstra
end

function [bio1_subimage,ind]=transf_img(file_dir,file_name,C_stra_Y,C_stra_X)

[bio1_image,bio1_info]=readgeoraster([file_dir,file_name]);
bio1_image=single(bio1_image);
bio1_image(bio1_image<-3.4e+10)=nan;

[col,row]=geographicToIntrinsic(bio1_info,C_stra_Y,C_stra_X);
col(col>size(bio1_image,2))=size(bio1_image,2);

row=double(round(row));
col=double(round(col));
ind=row+(col-1)*size(bio1_image,1);
bio1_subimage=single(bio1_image(ind));
