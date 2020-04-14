function [BW,maskedImage] = segmentImageFcn(im)
%segmentImage segments image using auto-generated code from imageSegmenter App
%  [BW,MASKEDIMAGE] = segmentImage(IM) segments image IM using auto-generated
%  code from the imageSegmenter App. The final segmentation is returned in
%  BW and a masked image is returned in MASKEDIMAGE.

%----------------------------------------------------


% Convert to grayscale
if size(im,3) == 3
	im = rgb2gray(im);
end

% Initialize segmentation with Otsu's threshold
level = graythresh(im);
mask = im2bw(im,level);

% Filter components by area
BW = bwareafilt(mask, [920 Inf]);
%BW = ~bwareafilt(~BW, [100 Inf]);

% Form masked image from input image and segmented image.
maskedImage = im;
maskedImage(~BW) = 0;
BW = ~BW;
end
