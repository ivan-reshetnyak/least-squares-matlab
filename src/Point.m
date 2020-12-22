classdef Point
properties
  x, y
end
  
methods
  function this = Point( x, y )
    this.x = x;
    this.y = y;
  end
end

methods(Static)
  function result = xs( points )
    sz = size(points);
    sz = sz(2);
    result = zeros(size(points));
    for i = 1:sz
      result(i) = points(i).x;
    end
  end
  
  function result = ys( points )
    sz = size(points);
    sz = sz(2);
    result = zeros(size(points));
    for i = 1:sz
      result(i) = points(i).y;
    end
  end
end
  
end
