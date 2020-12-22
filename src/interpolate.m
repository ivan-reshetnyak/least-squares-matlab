function interpolate()
  points = [ Point(0, 0) Point(1, 1) Point(2, 3) Point(3, 3) Point(4, 4) Point(5, 5)];
  interpolator = Interpolator(points, 5, -1);
  
  sz = size(points);
  sz = sz(2);
  
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
