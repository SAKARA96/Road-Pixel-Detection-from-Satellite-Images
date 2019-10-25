global se;
global bw5;
global bw6;

bw6=imdilate(bw5,se);

axes(handles.axes6);
imshow(bw6);