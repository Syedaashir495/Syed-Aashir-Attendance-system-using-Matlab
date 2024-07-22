function features = extractFeatures(faceRegion)
    % Convert to grayscale
    faceRegionGray = rgb2gray(faceRegion);

    % Resize image to ensure consistency
    standardizedSize = [64, 64];  % Choose a size that keeps important details
    resizedImage = imresize(faceRegionGray, standardizedSize);

    % Extract HOG features
    % The 'CellSize' option can greatly affect the output length
    cellSize = [8 8];  % Smaller cells can capture more detail but increase the feature vector length
    hogFeature = extractHOGFeatures(resizedImage, 'CellSize', cellSize);
    features = hogFeature;  % Output features
end
