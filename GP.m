%The function to compute gaussian pyramid:
function out = GP(image,number_of_levels,deviation,blocksize)
%first, we need somewhere to store our pyramid in. we know what 
%a cell array is, it helps us with storing things with types that are not
%similar in itself. so first, we create that:
out=cell(number_of_levels,1);
%now the gaussian filter. in gaussian pyramid, we have understood that
%normal subsampling would lead to aliasing.
g_filter=fspecial('gaussian', blocksize, deviation);
%first storing the main image:
out{1,1}=image;
%now computing the levels, each based on the one before itself:
for i=2:number_of_levels
    %filtering the one before:
    temp=imfilter(out{i-1,1},g_filter,'symmetric','corr');
    %subsampling AFTER the filter is performed:
    out{i,1}=temp(1:2:end,1:2:end);
end
