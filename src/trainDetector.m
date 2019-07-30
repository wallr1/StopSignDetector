
% load('..\labeledImages\3picstes1.mat');
cd('../labeledImages');
load('boundedImages.mat');
cd('../src');
% posInstances = gTruth.LabelData.stopSign;
posInstances = stopSignsAndCars(: , 1:2);

% posImages = fullfile(matlabroot,'toolbox','vision','visiondata','stopSignImages');
% addpath(posImages);

negImages = fullfile('..','negativeImages');
negIDS = imageDatastore(negImages);
cd('../models');
trainCascadeObjectDetector('stopSignDetector.xml',posInstances,negImages,'FalseAlarmRate',0.01,'NumCascadeStages',5);