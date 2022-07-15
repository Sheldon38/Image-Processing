%code to covert the hex values back to original image
fid = fopen('imgnew.txt', 'r');         %verilog output path here
if fid == -1, error('Cannot open file'); end
uselesscomments=textscan(fid,'%c',168);   
ImgData = fscanf(fid, '%x ',Inf);
Img     = reshape(ImgData,[256 384]);
Img = cat(3, Img, Img, Img);
Img = uint8(Img);
imshow(Img);
fclose(fid);
