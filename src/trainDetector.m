
% load('..\labeledImages\3picstes1.mat');
load('stopSignsAndCars.mat');

% posInstances = gTruth.LabelData.stopSign;
posInstances = stopSignsAndCars(: , 1:2);

posImages = fullfile(matlabroot,'toolbox','vision','visiondata','stopSignImages');
addpath(images);

negImages = fullfile(matlabroot,'toolbox','vision','visiondata','nonStopSigns');
negIDS = imageDatastore(negImages);
cd('../models');
trainCascadeObjectDetector('stopSignDetector.xml',posInstances,negImages,'FalseAlarmRate',0.1,'NumCascadeStages',5);