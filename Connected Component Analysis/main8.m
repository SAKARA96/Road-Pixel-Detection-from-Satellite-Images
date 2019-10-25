global bw7;
global gray;
global bw8;

bw8=imfuse(gray,bw7);

axes(handles.axes8);
imshow(bw8);