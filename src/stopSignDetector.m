function procImg = stopSignDetector(I)
    imL = length(I(:,1));
    cd('../models');
    minS = [round(imL/5) round(imL/5)];
    detector = vision.CascadeObjectDetector('stopSignDetector.xml', 'MinSize', minS);
    bbox = step(detector,I);
    cd('../src');
    lineW = round(imL / 100);
    fontS = lineW*4;
    if fontS > 72
        fontS = 72;
    end
    procImg =  insertObjectAnnotation(I,'rectangle',bbox,'stop sign','LineWidth',lineW,'FontSize',fontS);
    
%     imshow(procImg);