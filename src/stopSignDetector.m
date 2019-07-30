function [status , procImg] = stopSignDetector(I)
    status = 1;
    imL = length(I(:,1));
    cd('../models');
    minS = [round(imL/7) round(imL/7)];
    detector = vision.CascadeObjectDetector('stopSignDetector.xml');%, 'MinSize', minS);
    bbox = step(detector,I);
    if isempty(bbox)
        status = 0;
    end
    cd('../src');
    lineW = round(imL / 100);
    fontS = lineW*4;
    if fontS > 72
        fontS = 72;
    end
    procImg =  insertObjectAnnotation(I,'rectangle',bbox,'stop sign','LineWidth',lineW,'FontSize',fontS);