# Array.prototype.map = function(callback){
#   var array = [];
#   for (var i = 0; i < this.length; i++){
#     array.push(callback(this[i]));
#   };  
#   return array;
# }
# 
# [1,2,3,4,5].map(function(m){return m * 2;});
# 

class Array
  def map(&callback)
    array = []
    i = 0
    while i < self.length 
      array.push(yield self[i])
      i += 1
    end
    array
  end  
end

p [1,2,3,4,5].map{|m| m * 2}
# same
# [1,2,3,4,5].map do |m| 
#   m * 2
# end
