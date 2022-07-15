%code to convert image to hex values and storing in a txt file
img = imread('ABC.jpg');    
fid = fopen('im16.txt', 'w');
if fid == -1, error('Cannot open file'); end
fprintf(fid, '%x\n', img(:));
fclose(fid);
