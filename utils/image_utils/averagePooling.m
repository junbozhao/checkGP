function [pooledData,numOfPixels] = averagePooling(dataMatrix)
%
%averagePooling computes the Average 2x2 pooling of an image
%
numOfPixels = sqrt(size(dataMatrix,2));

pooledData = zeros(size(dataMatrix,1),size(dataMatrix,2)/4);

for hh = 1:size(dataMatrix,1)
    x = dataMatrix(hh,:);
    x = reshape(x,numOfPixels,numOfPixels)';
    y = zeros(numOfPixels/2,numOfPixels/2);
    for ii = 1:size(y,1)
        ii_4_x = [ii*2-1,ii*2]; 
        for jj = 1:size(y,2)
            jj_4_x = [jj*2-1,jj*2]; 
            y(ii,jj) = mean(mean(x(ii_4_x,jj_4_x)));
        end  
    end
    pooledData(hh,:) =  y(:);
end

numOfPixels = numOfPixels/2;
end