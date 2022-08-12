# Image Processing
Image Processing Module By Arpit Bhatnagar
# Introduction
In this project, I have implemented image processing operations on a black and white image using verilog. 
![image](https://user-images.githubusercontent.com/109095852/179349724-c29cb78e-db19-4715-9751-60cc5da8d65e.png)<br>
Since in a Black and white image, each pixel is represented by an 8 bit value, each pixel is supplied using the inbyte port. The type of operation is controlled using the select bits. The threshold and value bits are used in the operations binarisation and brightness increase respectively.
# Operations
Select 2'b00 : Increases brightness by "Values" <br>
       2'b01 : Decreases Brightness by "Value" <br>
       2'b10 : Binarises The image using "Threshold" <br>
       2'b11 : Inverts The Image  <br>
# Sample Outputs : 
Input Image : <br>
![ABC](https://user-images.githubusercontent.com/109095852/179349910-43711e01-73f3-4df8-8356-4b09bfce687d.jpg) <br>
Selecting 00 : <br>
![image](https://user-images.githubusercontent.com/109095852/179350554-e86c226e-65d8-4539-8d85-a2390dcd3365.png) <br>
Selecting 01 : <br>
![image](https://user-images.githubusercontent.com/109095852/179350557-ebb48008-a21f-434a-964d-f6cefee8c5d8.png)
<br>
Selecting 10 : <br>
![image](https://user-images.githubusercontent.com/109095852/179350564-0d8ba9a7-b3cb-44ec-aab2-8bb2f3b8373a.png)
<br>
Selecting 11 : <br>
![image](https://user-images.githubusercontent.com/109095852/179350575-509237f7-49de-4264-9a56-9f9ff4548eb6.png)


# Working 
A matlab file is used to convert the given image to hex values. These values are stored in a txt file which are then read by the Verilog module. After processing, these values are read by another matlab file and converted to jpg.
