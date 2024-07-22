function main
    imagePath = 'captured_image.jpg';
    img = imread(imagePath);
    bboxes = detectFaces(img);

    for i = 1:size(bboxes, 1)
        faceRegion = imcrop(img, bboxes(i, :));
        features = extractFeatures(faceRegion);
        [isMatch, identifier] = matchFace(features);

        if isMatch
            markAttendance(['Attendance marked for ', identifier]);
            logAttendance(identifier);  
        else
            markAttendance('Student didn''t enroll');
        end
    end
end

function logAttendance(identifier)
    fileId = fopen('attendanceLog.txt', 'a');
    fprintf(fileId, '%s: %s\n', identifier, datestr(now, 'yyyy-mm-dd HH:MM:SS'));
    fclose(fileId);
end
