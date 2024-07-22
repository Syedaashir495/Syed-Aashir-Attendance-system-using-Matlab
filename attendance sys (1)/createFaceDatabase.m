function createFaceDatabase(directoryPath)
    faceDetector = vision.CascadeObjectDetector();
    filePattern = fullfile(directoryPath, '*.jpg'); 
    imgFiles = dir(filePattern);
    
    databaseFeatures = [];
    identifiers = {}; 
    
    for k = 1:length(imgFiles)
        identifier = extractBefore(imgFiles(k).name, '.jpg'); 
        img = imread(fullfile(directoryPath, imgFiles(k).name));
        bbox = step(faceDetector, img);
        
        if ~isempty(bbox)
            faceImage = imcrop(img, bbox(1, :));
            features = extractFeatures(faceImage);
            databaseFeatures = [databaseFeatures; features];  
            identifiers{end+1} = identifier; 
        end
    end
    
    save('faceDatabase.mat', 'databaseFeatures', 'identifiers');  % Save features and identifiers
    fprintf('Database created successfully with %d entries');
end
