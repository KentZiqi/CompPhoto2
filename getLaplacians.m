function [laplacians,gaussians] = getLaplacians(I,levels,hsize,sigma)
    gaussians = {I};
    laplacians = {I};
    for i=2:1:levels
        filter = fspecial('gaussian', hsize, sigma);
        gaussians{i} = imfilter(gaussians{i-1},filter); 
        laplacians{i-1} = gaussians{i-1}-gaussians{i};
    end
end