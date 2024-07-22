function bboxes = detectFaces(img)
    faceDetector = vision.CascadeObjectDetector();
    bboxes = step(faceDetector, img);

    
    detectedImg = insertObjectAnnotation(img, 'rectangle', bboxes, 'Face');
    figure; imshow(detectedImg);
end
