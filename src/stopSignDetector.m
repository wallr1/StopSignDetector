function procImg = stopSignDetector(I)
    detector = vision.CascadeObjectDetector('stopSignDetector.xml');
    cd('../positiveImages');
    bbox = step(detector,I);
    procImg =  insertObjectAnnotation(I,'rectangle',bbox,'stop sign');
    imshow(procImg);