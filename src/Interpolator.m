classdef Interpolator < handle
properties
  weights, power, func
end
    
methods 
  function this = Interpolator( points, power, weights )
    if size(weights) == size(points)
      this.weights = weights;
    else
      this.weights = ones(size(points));
    end
    
    this.power = power;
    this.update(points);
  end
  
  function update( this, points )
    sz = this.power;
    pt_n = size(points);
    pt_n = pt_n(2);
    
    sys_m = zeros(sz, sz);
    sys_c = zeros(sz, 1);
    
    for row = 1:sz
      for pt = 1:pt_n
        sys_c(row) = sys_c(row) + this.weights(pt) * ...
          points(pt).x^(row - 1) * points(pt).y;
      end
      
      for col = 1:sz
        for pt = 1:pt_n
          sys_m(col, row) = sys_m(col, row) + this.weights(pt) * ...
            points(pt).x^(row + col - 2);
        end
      end
    end
    
    this.func = flip(linsolve(sys_m, sys_c));
  end
  
  function result = at( this, x )
    result = polyval(this.func, x);
  end
end

end

