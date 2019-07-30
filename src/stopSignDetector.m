function procImg = stopSignDetector(I)
    cd('../models');
    detector = vision.CascadeObjectDetector('stopSignDetector.xml' , 'MinSize', [500 500]);
    bbox = step(detector,I);
    procImg =  insertObjectAnnotation(I,'rectangle',bbox,'stop sign');
    imshow(procImg);