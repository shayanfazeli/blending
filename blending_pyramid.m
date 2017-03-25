function pyramid=blending_pyramid(pyramid1, pyramid2, pyramid_mask)
number_of_levels=size(pyramid_mask,1); 
pyramid=cell(number_of_levels,1);
%for each level, using the formula in slides, we create the file:
for l=1:number_of_levels
    pyramid{l,1}=(1-pyramid_mask{l,1}).*pyramid1{l,1}+(pyramid_mask{l,1}).*pyramid2{l,1};
end

end
