global bw4;
global se;
global bw5;
global bw3;

 bw4=bwmorph(bw3,'majority',10);
 se=strel('disk',3);
bw5=imclose(bw4,se);

axes(handles.axes5);
imshow(bw5);