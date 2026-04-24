%% ==============================================================================================
%  Function: Correlation analysis between CSR ecological strategy and environmental
%  variables
%  
%  Author: Jing Wang
%  Date: 2025/08/08
%% ==============================================================================================
function Step5_4_CSR_stress

[C_stra,Cstra_info]=readgeoraster('C_stra.tif');%Change to other stratefy files, e.g.('S_stra.tif');
C_stra=imresize(C_stra,1/10,'bilinear');%resample strategy maps as environmental files, e.g. tn10p.tif, have coarse resolution, so need to rescale
Cstra_info.RasterSize = [size(C_stra,1),size(C_stra,2)];
[C_stra_XX,C_stra_YY]=meshgrid(1:size(C_stra,2),1:size(C_stra,1));
C_stra_X=Cstra_info.LongitudeLimits(1)+Cstra_info.CellExtentInLongitude*(C_stra_XX-1);
C_stra_Y=Cstra_info.LatitudeLimits(2)-Cstra_info.CellExtentInLatitude*(C_stra_YY-1);

%% Stress image from statellite image analysis,vpd; change to other environmental variables
[dist_image,dist_info]=readgeoraster('D:\learning_SYSU\CSR\stress\heat\tn10p.tif');%

dist_image=single(dist_image);
dist_image(dist_image>1e4)=nan;%dist_image(dist_image<-1e37)=0;remove outliers

[col,row]=geographicToIntrinsic(dist_info,C_stra_Y,C_stra_X);
col(col>size(dist_image,2))=size(dist_image,2);
row(row>size(dist_image,1))=size(dist_image,1);
row(row<1)=1;

clear C_stra_XX C_stra_YY C_stra_Y C_stra_X input_X input_Y
row=double(round(row));
col=double(round(col));
ind=row+(col-1)*size(dist_image,1);
dist_subimage=single(dist_image(ind));

dist_res=dist_subimage;%
C_res=C_stra;%
nan_ab=isnan(dist_res) | isnan(C_res);

data2=C_res(~nan_ab);% & forest_mask
data1=dist_res(~nan_ab);%  & forest_mask
[R,p_value]=cor2_strate(data1,data2)

