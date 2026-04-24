%% ==============================================================================================
%  Function: The display of CSR ecological strategy maps
%
%  Author: Jing Wang
%  Date: 2025/08/08
%% ==============================================================================================
function Step3_DispCSR%(C_stra,S_stra,R_stra)
[C_stra,Cstra_info]=readgeoraster('C_stra.tif');%('C_stra.tif');
[S_stra,~]=readgeoraster('S_stra.tif');
[R_stra,~]=readgeoraster('R_stra.tif');

imAlpha=ones(size(C_stra,[1,2]));
nonvalid=isnan(C_stra) | isnan(S_stra) | isnan(R_stra);
imAlpha(nonvalid)=0;

geoplot_large(C_stra,Cstra_info,imAlpha)
colormap jet
set(gcf,'Position', [10 10 1200 600]);
clim([0 100])
geoplot_large(S_stra,Cstra_info,imAlpha)
colormap jet
set(gcf,'Position', [10 10 1200 600]);
clim([0 100])
geoplot_large(R_stra,Cstra_info,imAlpha)
colormap jet
set(gcf,'Position', [10 10 1200 600]);
clim([0 100])

%C S R corresponding to Red green blue
CSR_stra=cat(3,C_stra,S_stra,R_stra);
CSR_stra=uint8(CSR_stra./100*255);
%figure;imshow(CSR_stra,[0,255])
geoplot_large(255-CSR_stra,Cstra_info,imAlpha)
set(gcf,'Position', [10 10 1200 600]);

