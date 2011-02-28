# Array.prototype.myMap = function(callback){
#   var array = [];
#   for (var i = 0; i < this.length; i++){
#     array.push(callback(this[i]));
#   };  
#   return array;
# }
# 
# [1,2,3,4,5].myMap(function(m){return m * 2;});
# 

class Array
  def my_map(callback)
    array = []
    i = 0
    while i < self.length 
      array.push(callback.call(self[i]))
      i += 1
    end
    array
  end  
end

p [1,2,3,4,5].my_map(lambda {|m| m * 2})
