function out = collapse_the_tower(tower)
%okay, now we have a set (a tower) of all those images.
%time to make them unite:
number_of_levels = size(tower,1);
%collapsing:
for i = number_of_levels-1:-1:1
    %first, making their sizes to be the same:
    temp=imresize(uint8(tower{i+1,1}),size(tower{i,1}));
    %then summing up the information:
    tower{i,1}=tower{i,1}+double(temp);
end
%now outputting the final file:
out = uint8(tower{1,1});