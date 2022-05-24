function B = kwantyzacjaHSV(hsv,h,s,v)

B = hsv;
hsv(:, :, 1) = (hsv(:, :, 1)*360);   
hsv(:, :, 2:3) = (hsv(:, :, 2:3)*255);
if (h==10)
      for i=1:512
          for j=1:512
              if(B(i,j,2)==0)
                  B(i, j, 1) = hsv(i, j, 1);
                  B(i, j, 2) = hsv(i, j, 2);
                  B(i, j, 3) = (floor(hsv(i, j, 3)/ceil(255/6)))*(255/6) + (255/6/2); 
                  
              else
                  B(i, j, 1) = (floor(hsv(i, j, 1)/ceil(360/h)))*(360/h) + (360/h/2);  
                  B(i, j, 2) = (floor(hsv(i, j, 2)/ceil(255/s)))*(255/s) + (255/s/2); 
                  B(i, j, 3) = (floor(hsv(i, j, 3)/ceil(255/v)))*(255/v) + (255/v/2); 
              end
          end
      end  
else
        B(:, :, 1) = (floor(hsv(:, :, 1)/ceil(360/h)))*(360/h) + (360/h/2);
        B(:, :, 2) = (floor(hsv(:, :, 2)/ceil(255/s)))*(255/s) + (255/s/2);  
        B(:, :, 3) = (floor(hsv(:, :, 3)/ceil(255/v)))*(255/v) + (255/v/2); 

end
        B(:, :, 1) = B(:, :, 1)/360;
        B(:, :, 2:3) = B(:, :, 2:3)/255;
end