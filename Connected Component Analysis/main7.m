global bw6;
global bw7;

bw7=bwmorph(bw6,'thin',2);
imwrite(bw7,'output.jpg');
axes(handles.axes7);
imshow(bw7);