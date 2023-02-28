% step/resolution 
step = 0.1; 
 
% start/end of a2 parameter 
a2_start = 0.1; 
a2_end = 0.3; 
 
% start/end of b2 parameter 
b2_start = 0.1; 
b2_end = 0.3; 
 
for i = a2_start:step:a2_end 
    for j= b2_start:step:b2_end 
        disp(i); 
        disp(j); 
    end 
end 