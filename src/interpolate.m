function interpolate( filename )
  file = fopen(filename, "r");
  data = fscanf(file, "%f");
  fclose("all");
  power = data(1);
  sz = data(2);
  
  points(1:sz) = Point(0, 0);
  for i=1:sz
    x = data(3 + (i - 1) * 2);
    y = data(3 + (i - 1) * 2 + 1);
    points(i) = Point(x, y);
  end
  [~, ind] = sort([points.x]);
  points = points(ind);
  
  interpolator = Interpolator(points, power, -1);
  
  pxs = Point.xs(points);
  figure(1);
  hold off;
  plot(pxs, Point.ys(points), '-*');
   
  left = min(pxs);
  right = max(pxs);
  ixs = left:(right - left) / sz / 10:right;
  grid on;
  hold on;
  plot(ixs, interpolator.at(ixs));
end
