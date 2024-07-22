function [isMatch, matchedIdentifier] = matchFace(features)
    load('faceDatabase.mat', 'databaseFeatures', 'identifiers');
    threshold = 3;
    distances = pdist2(features, databaseFeatures, 'euclidean');
    [minDistance, idx] = min(distances);
    
    isMatch = minDistance < threshold;
    if isMatch
        matchedIdentifier = identifiers{idx};
    else
        matchedIdentifier = '';
    end
end
