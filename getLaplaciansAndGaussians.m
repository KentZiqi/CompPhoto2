function [laplacians,gaussians] = getLaplaciansAndGaussians(I,levels,sigma)
    gaussians = {I};
    laplacians = {I};
    for i=2:1:levels
        sigma = sigma * 2;
        gaussians{i} = imgaussfilt(gaussians{1}, sigma); 
        laplacians{i-1} = gaussians{i-1}-gaussians{i};
    end
end