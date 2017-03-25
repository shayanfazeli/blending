function out=laplacian_pyramid(image)
number_of_levels=size(image,1);
%again storing it all in a cell array:
out=cell(number_of_levels,1);
out{number_of_levels,1}=double(image{number_of_levels,1});
%creating the laplacian pyramid:
for i = number_of_levels-1:-1:1
    tmp = imresize(image{i+1,1},size(image{i,1}));
    out{i,1} = double(image{i,1}) - double(tmp);
end
